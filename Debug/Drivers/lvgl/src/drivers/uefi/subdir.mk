################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/lvgl/src/drivers/uefi/lv_uefi_context.c \
../Drivers/lvgl/src/drivers/uefi/lv_uefi_display.c \
../Drivers/lvgl/src/drivers/uefi/lv_uefi_indev_keyboard.c \
../Drivers/lvgl/src/drivers/uefi/lv_uefi_indev_pointer.c \
../Drivers/lvgl/src/drivers/uefi/lv_uefi_indev_touch.c \
../Drivers/lvgl/src/drivers/uefi/lv_uefi_private.c 

OBJS += \
./Drivers/lvgl/src/drivers/uefi/lv_uefi_context.o \
./Drivers/lvgl/src/drivers/uefi/lv_uefi_display.o \
./Drivers/lvgl/src/drivers/uefi/lv_uefi_indev_keyboard.o \
./Drivers/lvgl/src/drivers/uefi/lv_uefi_indev_pointer.o \
./Drivers/lvgl/src/drivers/uefi/lv_uefi_indev_touch.o \
./Drivers/lvgl/src/drivers/uefi/lv_uefi_private.o 

C_DEPS += \
./Drivers/lvgl/src/drivers/uefi/lv_uefi_context.d \
./Drivers/lvgl/src/drivers/uefi/lv_uefi_display.d \
./Drivers/lvgl/src/drivers/uefi/lv_uefi_indev_keyboard.d \
./Drivers/lvgl/src/drivers/uefi/lv_uefi_indev_pointer.d \
./Drivers/lvgl/src/drivers/uefi/lv_uefi_indev_touch.d \
./Drivers/lvgl/src/drivers/uefi/lv_uefi_private.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/lvgl/src/drivers/uefi/%.o Drivers/lvgl/src/drivers/uefi/%.su Drivers/lvgl/src/drivers/uefi/%.cyclo: ../Drivers/lvgl/src/drivers/uefi/%.c Drivers/lvgl/src/drivers/uefi/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DUSE_PWR_LDO_SUPPLY -DUSE_HAL_DRIVER -DSTM32H743xx -c -I../Core/Inc -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers/lv_fatfs" -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers/touch" -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Core/ui" -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers/lvgl/src" -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers" -I../Drivers/STM32H7xx_HAL_Driver/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32H7xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers/lvgl" -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers" -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -O0 -ffunction-sections -fdata-sections -Wall -mno-unaligned-access -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-lvgl-2f-src-2f-drivers-2f-uefi

clean-Drivers-2f-lvgl-2f-src-2f-drivers-2f-uefi:
	-$(RM) ./Drivers/lvgl/src/drivers/uefi/lv_uefi_context.cyclo ./Drivers/lvgl/src/drivers/uefi/lv_uefi_context.d ./Drivers/lvgl/src/drivers/uefi/lv_uefi_context.o ./Drivers/lvgl/src/drivers/uefi/lv_uefi_context.su ./Drivers/lvgl/src/drivers/uefi/lv_uefi_display.cyclo ./Drivers/lvgl/src/drivers/uefi/lv_uefi_display.d ./Drivers/lvgl/src/drivers/uefi/lv_uefi_display.o ./Drivers/lvgl/src/drivers/uefi/lv_uefi_display.su ./Drivers/lvgl/src/drivers/uefi/lv_uefi_indev_keyboard.cyclo ./Drivers/lvgl/src/drivers/uefi/lv_uefi_indev_keyboard.d ./Drivers/lvgl/src/drivers/uefi/lv_uefi_indev_keyboard.o ./Drivers/lvgl/src/drivers/uefi/lv_uefi_indev_keyboard.su ./Drivers/lvgl/src/drivers/uefi/lv_uefi_indev_pointer.cyclo ./Drivers/lvgl/src/drivers/uefi/lv_uefi_indev_pointer.d ./Drivers/lvgl/src/drivers/uefi/lv_uefi_indev_pointer.o ./Drivers/lvgl/src/drivers/uefi/lv_uefi_indev_pointer.su ./Drivers/lvgl/src/drivers/uefi/lv_uefi_indev_touch.cyclo ./Drivers/lvgl/src/drivers/uefi/lv_uefi_indev_touch.d ./Drivers/lvgl/src/drivers/uefi/lv_uefi_indev_touch.o ./Drivers/lvgl/src/drivers/uefi/lv_uefi_indev_touch.su ./Drivers/lvgl/src/drivers/uefi/lv_uefi_private.cyclo ./Drivers/lvgl/src/drivers/uefi/lv_uefi_private.d ./Drivers/lvgl/src/drivers/uefi/lv_uefi_private.o ./Drivers/lvgl/src/drivers/uefi/lv_uefi_private.su

.PHONY: clean-Drivers-2f-lvgl-2f-src-2f-drivers-2f-uefi

