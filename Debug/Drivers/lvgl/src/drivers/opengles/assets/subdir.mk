################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/lvgl/src/drivers/opengles/assets/lv_opengles_shader.c 

OBJS += \
./Drivers/lvgl/src/drivers/opengles/assets/lv_opengles_shader.o 

C_DEPS += \
./Drivers/lvgl/src/drivers/opengles/assets/lv_opengles_shader.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/lvgl/src/drivers/opengles/assets/%.o Drivers/lvgl/src/drivers/opengles/assets/%.su Drivers/lvgl/src/drivers/opengles/assets/%.cyclo: ../Drivers/lvgl/src/drivers/opengles/assets/%.c Drivers/lvgl/src/drivers/opengles/assets/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DUSE_PWR_LDO_SUPPLY -DUSE_HAL_DRIVER -DSTM32H743xx -c -I../Core/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32H7xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers/lvgl" -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-lvgl-2f-src-2f-drivers-2f-opengles-2f-assets

clean-Drivers-2f-lvgl-2f-src-2f-drivers-2f-opengles-2f-assets:
	-$(RM) ./Drivers/lvgl/src/drivers/opengles/assets/lv_opengles_shader.cyclo ./Drivers/lvgl/src/drivers/opengles/assets/lv_opengles_shader.d ./Drivers/lvgl/src/drivers/opengles/assets/lv_opengles_shader.o ./Drivers/lvgl/src/drivers/opengles/assets/lv_opengles_shader.su

.PHONY: clean-Drivers-2f-lvgl-2f-src-2f-drivers-2f-opengles-2f-assets

