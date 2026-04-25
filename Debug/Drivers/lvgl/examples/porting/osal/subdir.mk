################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/lvgl/examples/porting/osal/lv_example_osal.c 

OBJS += \
./Drivers/lvgl/examples/porting/osal/lv_example_osal.o 

C_DEPS += \
./Drivers/lvgl/examples/porting/osal/lv_example_osal.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/lvgl/examples/porting/osal/%.o Drivers/lvgl/examples/porting/osal/%.su Drivers/lvgl/examples/porting/osal/%.cyclo: ../Drivers/lvgl/examples/porting/osal/%.c Drivers/lvgl/examples/porting/osal/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DUSE_PWR_LDO_SUPPLY -DUSE_HAL_DRIVER -DSTM32H743xx -c -I../Core/Inc -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers/lvgl/src" -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers" -I../Drivers/STM32H7xx_HAL_Driver/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32H7xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers/lvgl" -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-lvgl-2f-examples-2f-porting-2f-osal

clean-Drivers-2f-lvgl-2f-examples-2f-porting-2f-osal:
	-$(RM) ./Drivers/lvgl/examples/porting/osal/lv_example_osal.cyclo ./Drivers/lvgl/examples/porting/osal/lv_example_osal.d ./Drivers/lvgl/examples/porting/osal/lv_example_osal.o ./Drivers/lvgl/examples/porting/osal/lv_example_osal.su

.PHONY: clean-Drivers-2f-lvgl-2f-examples-2f-porting-2f-osal

