################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
LD_SRCS += \
../src/lscript.ld 

C_SRCS += \
../src/adv7511.c \
../src/demosaic.c \
../src/display_demo.c \
../src/gamma_lut.c \
../src/ov5640.c \
../src/vdma.c 

OBJS += \
./src/adv7511.o \
./src/demosaic.o \
./src/display_demo.o \
./src/gamma_lut.o \
./src/ov5640.o \
./src/vdma.o 

C_DEPS += \
./src/adv7511.d \
./src/demosaic.d \
./src/display_demo.d \
./src/gamma_lut.d \
./src/ov5640.d \
./src/vdma.d 


# Each subdirectory must supply rules for building sources it contributes
src/%.o: ../src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM v8 gcc compiler'
	aarch64-none-elf-gcc -Wall -O0 -g3 -c -fmessage-length=0 -MT"$@" -I/home/guohui/Work/HLS_Vivado_Vitis_Prj/Process_Camera/Process_Camera_Vitis/design_1_wrapper_1/export/design_1_wrapper_1/sw/design_1_wrapper_1/domain_psu_cortexa53_0/bspinclude/include -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


