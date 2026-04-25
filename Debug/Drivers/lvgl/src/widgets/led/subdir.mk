################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/lvgl/src/widgets/led/lv_led.c 

OBJS += \
./Drivers/lvgl/src/widgets/led/lv_led.o 

C_DEPS += \
./Drivers/lvgl/src/widgets/led/lv_led.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/lvgl/src/widgets/led/%.o Drivers/lvgl/src/widgets/led/%.su Drivers/lvgl/src/widgets/led/%.cyclo: ../Drivers/lvgl/src/widgets/led/%.c Drivers/lvgl/src/widgets/led/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DUSE_PWR_LDO_SUPPLY -DUSE_HAL_DRIVER -DSTM32H743xx -c -I../Core/Inc -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers/touch" -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Core/ui" -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers/lvgl/src" -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers" -I../Drivers/STM32H7xx_HAL_Driver/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32H7xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers/lvgl" -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers" -O0 -ffunction-sections -fdata-sections -Wall -mno-unaligned-access -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-lvgl-2f-src-2f-widgets-2f-led

clean-Drivers-2f-lvgl-2f-src-2f-widgets-2f-led:
	-$(RM) ./Drivers/lvgl/src/widgets/led/lv_led.cyclo ./Drivers/lvgl/src/widgets/led/lv_led.d ./Drivers/lvgl/src/widgets/led/lv_led.o ./Drivers/lvgl/src/widgets/led/lv_led.su

.PHONY: clean-Drivers-2f-lvgl-2f-src-2f-widgets-2f-led

