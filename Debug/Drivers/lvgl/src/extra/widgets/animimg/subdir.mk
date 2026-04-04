################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/lvgl/src/extra/widgets/animimg/lv_animimg.c 

OBJS += \
./Drivers/lvgl/src/extra/widgets/animimg/lv_animimg.o 

C_DEPS += \
./Drivers/lvgl/src/extra/widgets/animimg/lv_animimg.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/lvgl/src/extra/widgets/animimg/%.o Drivers/lvgl/src/extra/widgets/animimg/%.su Drivers/lvgl/src/extra/widgets/animimg/%.cyclo: ../Drivers/lvgl/src/extra/widgets/animimg/%.c Drivers/lvgl/src/extra/widgets/animimg/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DUSE_PWR_LDO_SUPPLY -DUSE_HAL_DRIVER -DSTM32H743xx -c -I../Core/Inc -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers/lvgl" -I../Drivers/STM32H7xx_HAL_Driver/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32H7xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers/lvgl" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-lvgl-2f-src-2f-extra-2f-widgets-2f-animimg

clean-Drivers-2f-lvgl-2f-src-2f-extra-2f-widgets-2f-animimg:
	-$(RM) ./Drivers/lvgl/src/extra/widgets/animimg/lv_animimg.cyclo ./Drivers/lvgl/src/extra/widgets/animimg/lv_animimg.d ./Drivers/lvgl/src/extra/widgets/animimg/lv_animimg.o ./Drivers/lvgl/src/extra/widgets/animimg/lv_animimg.su

.PHONY: clean-Drivers-2f-lvgl-2f-src-2f-extra-2f-widgets-2f-animimg

