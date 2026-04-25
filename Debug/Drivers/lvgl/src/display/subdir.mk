################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/lvgl/src/display/lv_display.c 

OBJS += \
./Drivers/lvgl/src/display/lv_display.o 

C_DEPS += \
./Drivers/lvgl/src/display/lv_display.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/lvgl/src/display/%.o Drivers/lvgl/src/display/%.su Drivers/lvgl/src/display/%.cyclo: ../Drivers/lvgl/src/display/%.c Drivers/lvgl/src/display/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DUSE_PWR_LDO_SUPPLY -DUSE_HAL_DRIVER -DSTM32H743xx -c -I../Core/Inc -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers/touch" -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Core/ui" -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers/lvgl/src" -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers" -I../Drivers/STM32H7xx_HAL_Driver/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32H7xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers/lvgl" -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers" -O0 -ffunction-sections -fdata-sections -Wall -mno-unaligned-access -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-lvgl-2f-src-2f-display

clean-Drivers-2f-lvgl-2f-src-2f-display:
	-$(RM) ./Drivers/lvgl/src/display/lv_display.cyclo ./Drivers/lvgl/src/display/lv_display.d ./Drivers/lvgl/src/display/lv_display.o ./Drivers/lvgl/src/display/lv_display.su

.PHONY: clean-Drivers-2f-lvgl-2f-src-2f-display

