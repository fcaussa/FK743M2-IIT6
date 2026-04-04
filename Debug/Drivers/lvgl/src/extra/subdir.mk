################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/lvgl/src/extra/lv_extra.c 

OBJS += \
./Drivers/lvgl/src/extra/lv_extra.o 

C_DEPS += \
./Drivers/lvgl/src/extra/lv_extra.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/lvgl/src/extra/%.o Drivers/lvgl/src/extra/%.su Drivers/lvgl/src/extra/%.cyclo: ../Drivers/lvgl/src/extra/%.c Drivers/lvgl/src/extra/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DUSE_PWR_LDO_SUPPLY -DUSE_HAL_DRIVER -DSTM32H743xx -c -I../Core/Inc -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers/lvgl" -I../Drivers/STM32H7xx_HAL_Driver/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32H7xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers/lvgl" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-lvgl-2f-src-2f-extra

clean-Drivers-2f-lvgl-2f-src-2f-extra:
	-$(RM) ./Drivers/lvgl/src/extra/lv_extra.cyclo ./Drivers/lvgl/src/extra/lv_extra.d ./Drivers/lvgl/src/extra/lv_extra.o ./Drivers/lvgl/src/extra/lv_extra.su

.PHONY: clean-Drivers-2f-lvgl-2f-src-2f-extra

