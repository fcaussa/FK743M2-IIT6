################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/lvgl/src/others/test/lv_test_display.c \
../Drivers/lvgl/src/others/test/lv_test_helpers.c \
../Drivers/lvgl/src/others/test/lv_test_indev.c \
../Drivers/lvgl/src/others/test/lv_test_indev_gesture.c \
../Drivers/lvgl/src/others/test/lv_test_screenshot_compare.c 

OBJS += \
./Drivers/lvgl/src/others/test/lv_test_display.o \
./Drivers/lvgl/src/others/test/lv_test_helpers.o \
./Drivers/lvgl/src/others/test/lv_test_indev.o \
./Drivers/lvgl/src/others/test/lv_test_indev_gesture.o \
./Drivers/lvgl/src/others/test/lv_test_screenshot_compare.o 

C_DEPS += \
./Drivers/lvgl/src/others/test/lv_test_display.d \
./Drivers/lvgl/src/others/test/lv_test_helpers.d \
./Drivers/lvgl/src/others/test/lv_test_indev.d \
./Drivers/lvgl/src/others/test/lv_test_indev_gesture.d \
./Drivers/lvgl/src/others/test/lv_test_screenshot_compare.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/lvgl/src/others/test/%.o Drivers/lvgl/src/others/test/%.su Drivers/lvgl/src/others/test/%.cyclo: ../Drivers/lvgl/src/others/test/%.c Drivers/lvgl/src/others/test/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DUSE_PWR_LDO_SUPPLY -DUSE_HAL_DRIVER -DSTM32H743xx -c -I../Core/Inc -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers/touch" -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Core/ui" -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers/lvgl/src" -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers" -I../Drivers/STM32H7xx_HAL_Driver/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32H7xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers/lvgl" -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers" -O0 -ffunction-sections -fdata-sections -Wall -mno-unaligned-access -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-lvgl-2f-src-2f-others-2f-test

clean-Drivers-2f-lvgl-2f-src-2f-others-2f-test:
	-$(RM) ./Drivers/lvgl/src/others/test/lv_test_display.cyclo ./Drivers/lvgl/src/others/test/lv_test_display.d ./Drivers/lvgl/src/others/test/lv_test_display.o ./Drivers/lvgl/src/others/test/lv_test_display.su ./Drivers/lvgl/src/others/test/lv_test_helpers.cyclo ./Drivers/lvgl/src/others/test/lv_test_helpers.d ./Drivers/lvgl/src/others/test/lv_test_helpers.o ./Drivers/lvgl/src/others/test/lv_test_helpers.su ./Drivers/lvgl/src/others/test/lv_test_indev.cyclo ./Drivers/lvgl/src/others/test/lv_test_indev.d ./Drivers/lvgl/src/others/test/lv_test_indev.o ./Drivers/lvgl/src/others/test/lv_test_indev.su ./Drivers/lvgl/src/others/test/lv_test_indev_gesture.cyclo ./Drivers/lvgl/src/others/test/lv_test_indev_gesture.d ./Drivers/lvgl/src/others/test/lv_test_indev_gesture.o ./Drivers/lvgl/src/others/test/lv_test_indev_gesture.su ./Drivers/lvgl/src/others/test/lv_test_screenshot_compare.cyclo ./Drivers/lvgl/src/others/test/lv_test_screenshot_compare.d ./Drivers/lvgl/src/others/test/lv_test_screenshot_compare.o ./Drivers/lvgl/src/others/test/lv_test_screenshot_compare.su

.PHONY: clean-Drivers-2f-lvgl-2f-src-2f-others-2f-test

