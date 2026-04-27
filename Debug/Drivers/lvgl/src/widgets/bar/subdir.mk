################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/lvgl/src/widgets/bar/lv_bar.c 

OBJS += \
./Drivers/lvgl/src/widgets/bar/lv_bar.o 

C_DEPS += \
./Drivers/lvgl/src/widgets/bar/lv_bar.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/lvgl/src/widgets/bar/%.o Drivers/lvgl/src/widgets/bar/%.su Drivers/lvgl/src/widgets/bar/%.cyclo: ../Drivers/lvgl/src/widgets/bar/%.c Drivers/lvgl/src/widgets/bar/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DUSE_PWR_LDO_SUPPLY -DUSE_HAL_DRIVER -DSTM32H743xx -c -I../Core/Inc -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers/lv_fatfs" -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers/touch" -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Core/ui" -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers/lvgl/src" -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers" -I../Drivers/STM32H7xx_HAL_Driver/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32H7xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers/lvgl" -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers" -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -O0 -ffunction-sections -fdata-sections -Wall -mno-unaligned-access -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-lvgl-2f-src-2f-widgets-2f-bar

clean-Drivers-2f-lvgl-2f-src-2f-widgets-2f-bar:
	-$(RM) ./Drivers/lvgl/src/widgets/bar/lv_bar.cyclo ./Drivers/lvgl/src/widgets/bar/lv_bar.d ./Drivers/lvgl/src/widgets/bar/lv_bar.o ./Drivers/lvgl/src/widgets/bar/lv_bar.su

.PHONY: clean-Drivers-2f-lvgl-2f-src-2f-widgets-2f-bar

