################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/i2c/PS_i2c.c 

OBJS += \
./src/i2c/PS_i2c.o 

C_DEPS += \
./src/i2c/PS_i2c.d 


# Each subdirectory must supply rules for building sources it contributes
src/i2c/%.o: ../src/i2c/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM v8 gcc compiler'
	aarch64-none-elf-gcc -Wall -O0 -g3 -c -fmessage-length=0 -MT"$@" -I/home/guohui/Work/HLS_Vivado_Vitis_Prj/Process_Camera/Process_Camera_Vitis/design_1_wrapper_1/export/design_1_wrapper_1/sw/design_1_wrapper_1/domain_psu_cortexa53_0/bspinclude/include -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


