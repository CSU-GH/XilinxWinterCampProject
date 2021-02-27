################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include src/i2c/subdir.mk
-include src/dynclk/subdir.mk
-include src/display_ctrl/subdir.mk
-include src/subdir.mk
-include subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(S_UPPER_DEPS)),)
-include $(S_UPPER_DEPS)
endif
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
endif

-include ../makefile.defs

# Add inputs and outputs from these tool invocations to the build variables 
ELFSIZE += \
Process_Camera_new.elf.size \


# All Target
all: Process_Camera_new.elf secondary-outputs

# Tool invocations
Process_Camera_new.elf: $(OBJS) ../src/lscript.ld $(USER_OBJS)
	@echo 'Building target: $@'
	@echo 'Invoking: ARM v8 gcc linker'
	aarch64-none-elf-gcc -Wl,-T -Wl,../src/lscript.ld -L/home/guohui/Work/HLS_Vivado_Vitis_Prj/Process_Camera/Process_Camera_Vitis/design_1_wrapper_1/export/design_1_wrapper_1/sw/design_1_wrapper_1/domain_psu_cortexa53_0/bsplib/lib -o "Process_Camera_new.elf" $(OBJS) $(USER_OBJS) $(LIBS)
	@echo 'Finished building target: $@'
	@echo ' '

Process_Camera_new.elf.size: Process_Camera_new.elf
	@echo 'Invoking: ARM v8 Print Size'
	aarch64-none-elf-size Process_Camera_new.elf  |tee "Process_Camera_new.elf.size"
	@echo 'Finished building: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) $(EXECUTABLES)$(OBJS)$(S_UPPER_DEPS)$(C_DEPS)$(ELFSIZE) Process_Camera_new.elf
	-@echo ' '

secondary-outputs: $(ELFSIZE)

.PHONY: all clean dependents

-include ../makefile.targets
