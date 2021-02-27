
/* ------------------------------------------------------------ */
/*				Include File Definitions						*/
/* ------------------------------------------------------------ */

#include "display_demo.h"
#include "display_ctrl/display_ctrl.h"
#include <stdio.h>
#include "math.h"
#include <ctype.h>
#include <stdlib.h>
#include "xil_types.h"
#include "xil_cache.h"
#include "xparameters.h"
#include "xiicps.h"
#include "vdma.h"
#include "i2c/PS_i2c.h"
#include "xgpiops.h"
#include "sleep.h"
#include "ov5640.h"
#include "config.h"
#include "demosaic.h"
#include "gamma_lut.h"

/*
 * XPAR redefines
 */
#define DYNCLK_BASEADDR XPAR_AXI_DYNCLK_0_BASEADDR
#define VGA_VDMA_ID XPAR_AXIVDMA_1_DEVICE_ID
#define DISP_VTC_ID XPAR_VTC_0_DEVICE_ID

#if P1080 == 1
#define HORSIZE 1920*4 //1920*3
#define VERSIZE 1080
#else
#define HORSIZE 1280*4 //1280*3
#define VERSIZE 720
#endif

#define CAM_EMIO	78
/* ------------------------------------------------------------ */
/*				Global Variables								*/
/* ------------------------------------------------------------ */

/*
 * Display Driver structs
 */

XIicPs ps_i2c0;
XIicPs ps_i2c1;
XGpioPs Gpio;
/*
 * Display Driver structs
 */
DisplayCtrl dispCtrl;
XAxiVdma vdma;
/*
 * Framebuffers for video data
 */
u8 frameBuf[DISPLAY_NUM_FRAMES][DEMO_MAX_FRAME] __attribute__ ((aligned(256)));
u8 *pFrames[DISPLAY_NUM_FRAMES]; //array of pointers to the frame buffers

int PsGpioSetup() ;
void adv7511_init(XIicPs IicInstance) ;
u8 hpd_check(XIicPs IicInstance) ;

int main(void)
{

	int Status;
	int i ;
	XAxiVdma_Config *vdmaConfig;

	/*
	 * Initialize an array of pointers to the 3 frame buffers
	 */
	for (i = 0; i < DISPLAY_NUM_FRAMES; i++)
	{
		pFrames[i] = frameBuf[i];
		memset(pFrames[i], 0, DEMO_MAX_FRAME);
		Xil_DCacheFlushRange((INTPTR) pFrames[i], DEMO_MAX_FRAME) ;
	}


	PsGpioSetup() ;
	/*
	 * Reset sensor
	 */
	XGpioPs_WritePin(&Gpio, CAM_EMIO, 0) ;
	usleep(1000000);
	XGpioPs_WritePin(&Gpio, CAM_EMIO, 1) ;
	usleep(1000000);

	i2c_init(&ps_i2c0, XPAR_XIICPS_0_DEVICE_ID,100000);
	i2c_init(&ps_i2c1, XPAR_XIICPS_1_DEVICE_ID,100000);

	
	/*
	 * Initialize VDMA driver
	 */
	vdmaConfig = XAxiVdma_LookupConfig(VGA_VDMA_ID);
	if (!vdmaConfig)
	{
		xil_printf("No video DMA found for ID %d\r\n", VGA_VDMA_ID);

	}
	Status = XAxiVdma_CfgInitialize(&vdma, vdmaConfig, vdmaConfig->BaseAddress);
	if (Status != XST_SUCCESS)
	{
		xil_printf("VDMA Configuration Initialization failed %d\r\n", Status);

	}

	/*
	 * Initialize the Display controller and start it
	 */
	Status = DisplayInitialize(&dispCtrl, &vdma, DISP_VTC_ID, DYNCLK_BASEADDR,pFrames, DEMO_STRIDE);
	if (Status != XST_SUCCESS)
	{
		xil_printf("Display Ctrl initialization failed during demo initialization%d\r\n", Status);

	}
	Status = DisplayStart(&dispCtrl);
	if (Status != XST_SUCCESS)
	{
		xil_printf("Couldn't start display during demo initialization%d\r\n", Status);

	}

	gamma_lut_init();
	demosaic_init();

	/* Start Sensor Vdma */
	vdma_write_init(XPAR_AXIVDMA_0_DEVICE_ID,HORSIZE,VERSIZE,DEMO_STRIDE,(unsigned int)pFrames[0]);
	
	/*
	 * Initialize Sensor
	 */
	sensor_init(&ps_i2c0);
	
	/*
	 * Check HPD signal
	 */
	while(1){

		Status = hpd_check(ps_i2c1) ;
		if (Status){
			xil_printf("Hot plug detected\r\n");
			adv7511_init(ps_i2c1) ;
			break;
		}
		sleep(1);
	};

	return 0;
}


int PsGpioSetup()
{
	XGpioPs_Config *GPIO_CONFIG ;
	int Status ;

	GPIO_CONFIG = XGpioPs_LookupConfig(XPAR_XGPIOPS_0_DEVICE_ID) ;

	Status = XGpioPs_CfgInitialize(&Gpio, GPIO_CONFIG, GPIO_CONFIG->BaseAddr) ;
	if (Status != XST_SUCCESS)
	{
		return XST_FAILURE ;
	}
	/* set MIO 54 as output */
	XGpioPs_SetDirectionPin(&Gpio, CAM_EMIO, 1) ;

	XGpioPs_SetOutputEnablePin(&Gpio, CAM_EMIO, 1);


	return XST_SUCCESS ;
}
