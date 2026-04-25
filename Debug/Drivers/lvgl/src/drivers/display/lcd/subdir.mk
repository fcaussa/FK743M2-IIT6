################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/lvgl/src/drivers/display/lcd/lv_lcd_generic_mipi.c 

OBJS += \
./Drivers/lvgl/src/drivers/display/lcd/lv_lcd_generic_mipi.o 

C_DEPS += \
./Drivers/lvgl/src/drivers/display/lcd/lv_lcd_generic_mipi.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/lvgl/src/drivers/display/lcd/%.o Drivers/lvgl/src/drivers/display/lcd/%.su Drivers/lvgl/src/drivers/display/lcd/%.cyclo: ../Drivers/lvgl/src/drivers/display/lcd/%.c Drivers/lvgl/src/drivers/display/lcd/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DUSE_PWR_LDO_SUPPLY -DUSE_HAL_DRIVER -DSTM32H743xx -c -I../Core/Inc -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Core/ui" -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers/lvgl/src" -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers" -I../Drivers/STM32H7xx_HAL_Driver/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32H7xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers/lvgl" -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers" -O0 -ffunction-sections -fdata-sections -Wall -mno-unaligned-access -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-lvgl-2f-src-2f-drivers-2f-display-2f-lcd

clean-Drivers-2f-lvgl-2f-src-2f-drivers-2f-display-2f-lcd:
	-$(RM) ./Drivers/lvgl/src/drivers/display/lcd/lv_lcd_generic_mipi.cyclo ./Drivers/lvgl/src/drivers/display/lcd/lv_lcd_generic_mipi.d ./Drivers/lvgl/src/drivers/display/lcd/lv_lcd_generic_mipi.o ./Drivers/lvgl/src/drivers/display/lcd/lv_lcd_generic_mipi.su

.PHONY: clean-Drivers-2f-lvgl-2f-src-2f-drivers-2f-display-2f-lcd

