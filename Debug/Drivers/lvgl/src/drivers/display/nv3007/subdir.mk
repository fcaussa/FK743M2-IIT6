################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/lvgl/src/drivers/display/nv3007/lv_nv3007.c 

OBJS += \
./Drivers/lvgl/src/drivers/display/nv3007/lv_nv3007.o 

C_DEPS += \
./Drivers/lvgl/src/drivers/display/nv3007/lv_nv3007.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/lvgl/src/drivers/display/nv3007/%.o Drivers/lvgl/src/drivers/display/nv3007/%.su Drivers/lvgl/src/drivers/display/nv3007/%.cyclo: ../Drivers/lvgl/src/drivers/display/nv3007/%.c Drivers/lvgl/src/drivers/display/nv3007/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DUSE_PWR_LDO_SUPPLY -DUSE_HAL_DRIVER -DSTM32H743xx -c -I../Core/Inc -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers/lvgl/src" -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers" -I../Drivers/STM32H7xx_HAL_Driver/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32H7xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers/lvgl" -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers" -O0 -ffunction-sections -fdata-sections -Wall -mno-unaligned-access -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-lvgl-2f-src-2f-drivers-2f-display-2f-nv3007

clean-Drivers-2f-lvgl-2f-src-2f-drivers-2f-display-2f-nv3007:
	-$(RM) ./Drivers/lvgl/src/drivers/display/nv3007/lv_nv3007.cyclo ./Drivers/lvgl/src/drivers/display/nv3007/lv_nv3007.d ./Drivers/lvgl/src/drivers/display/nv3007/lv_nv3007.o ./Drivers/lvgl/src/drivers/display/nv3007/lv_nv3007.su

.PHONY: clean-Drivers-2f-lvgl-2f-src-2f-drivers-2f-display-2f-nv3007

