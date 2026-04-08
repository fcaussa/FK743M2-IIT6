################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/lvgl/src/drivers/display/ft81x/lv_ft81x.c 

OBJS += \
./Drivers/lvgl/src/drivers/display/ft81x/lv_ft81x.o 

C_DEPS += \
./Drivers/lvgl/src/drivers/display/ft81x/lv_ft81x.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/lvgl/src/drivers/display/ft81x/%.o Drivers/lvgl/src/drivers/display/ft81x/%.su Drivers/lvgl/src/drivers/display/ft81x/%.cyclo: ../Drivers/lvgl/src/drivers/display/ft81x/%.c Drivers/lvgl/src/drivers/display/ft81x/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DUSE_PWR_LDO_SUPPLY -DUSE_HAL_DRIVER -DSTM32H743xx -c -I../Core/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32H7xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers/lvgl" -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-lvgl-2f-src-2f-drivers-2f-display-2f-ft81x

clean-Drivers-2f-lvgl-2f-src-2f-drivers-2f-display-2f-ft81x:
	-$(RM) ./Drivers/lvgl/src/drivers/display/ft81x/lv_ft81x.cyclo ./Drivers/lvgl/src/drivers/display/ft81x/lv_ft81x.d ./Drivers/lvgl/src/drivers/display/ft81x/lv_ft81x.o ./Drivers/lvgl/src/drivers/display/ft81x/lv_ft81x.su

.PHONY: clean-Drivers-2f-lvgl-2f-src-2f-drivers-2f-display-2f-ft81x

