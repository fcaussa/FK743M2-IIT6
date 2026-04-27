################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/lvgl/src/widgets/property/lv_animimage_properties.c \
../Drivers/lvgl/src/widgets/property/lv_dropdown_properties.c \
../Drivers/lvgl/src/widgets/property/lv_image_properties.c \
../Drivers/lvgl/src/widgets/property/lv_keyboard_properties.c \
../Drivers/lvgl/src/widgets/property/lv_label_properties.c \
../Drivers/lvgl/src/widgets/property/lv_obj_properties.c \
../Drivers/lvgl/src/widgets/property/lv_roller_properties.c \
../Drivers/lvgl/src/widgets/property/lv_slider_properties.c \
../Drivers/lvgl/src/widgets/property/lv_style_properties.c \
../Drivers/lvgl/src/widgets/property/lv_textarea_properties.c 

OBJS += \
./Drivers/lvgl/src/widgets/property/lv_animimage_properties.o \
./Drivers/lvgl/src/widgets/property/lv_dropdown_properties.o \
./Drivers/lvgl/src/widgets/property/lv_image_properties.o \
./Drivers/lvgl/src/widgets/property/lv_keyboard_properties.o \
./Drivers/lvgl/src/widgets/property/lv_label_properties.o \
./Drivers/lvgl/src/widgets/property/lv_obj_properties.o \
./Drivers/lvgl/src/widgets/property/lv_roller_properties.o \
./Drivers/lvgl/src/widgets/property/lv_slider_properties.o \
./Drivers/lvgl/src/widgets/property/lv_style_properties.o \
./Drivers/lvgl/src/widgets/property/lv_textarea_properties.o 

C_DEPS += \
./Drivers/lvgl/src/widgets/property/lv_animimage_properties.d \
./Drivers/lvgl/src/widgets/property/lv_dropdown_properties.d \
./Drivers/lvgl/src/widgets/property/lv_image_properties.d \
./Drivers/lvgl/src/widgets/property/lv_keyboard_properties.d \
./Drivers/lvgl/src/widgets/property/lv_label_properties.d \
./Drivers/lvgl/src/widgets/property/lv_obj_properties.d \
./Drivers/lvgl/src/widgets/property/lv_roller_properties.d \
./Drivers/lvgl/src/widgets/property/lv_slider_properties.d \
./Drivers/lvgl/src/widgets/property/lv_style_properties.d \
./Drivers/lvgl/src/widgets/property/lv_textarea_properties.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/lvgl/src/widgets/property/%.o Drivers/lvgl/src/widgets/property/%.su Drivers/lvgl/src/widgets/property/%.cyclo: ../Drivers/lvgl/src/widgets/property/%.c Drivers/lvgl/src/widgets/property/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DUSE_PWR_LDO_SUPPLY -DUSE_HAL_DRIVER -DSTM32H743xx -c -I../Core/Inc -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers/lv_fatfs" -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers/touch" -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Core/ui" -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers/lvgl/src" -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers" -I../Drivers/STM32H7xx_HAL_Driver/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32H7xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers/lvgl" -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers" -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -O0 -ffunction-sections -fdata-sections -Wall -mno-unaligned-access -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-lvgl-2f-src-2f-widgets-2f-property

clean-Drivers-2f-lvgl-2f-src-2f-widgets-2f-property:
	-$(RM) ./Drivers/lvgl/src/widgets/property/lv_animimage_properties.cyclo ./Drivers/lvgl/src/widgets/property/lv_animimage_properties.d ./Drivers/lvgl/src/widgets/property/lv_animimage_properties.o ./Drivers/lvgl/src/widgets/property/lv_animimage_properties.su ./Drivers/lvgl/src/widgets/property/lv_dropdown_properties.cyclo ./Drivers/lvgl/src/widgets/property/lv_dropdown_properties.d ./Drivers/lvgl/src/widgets/property/lv_dropdown_properties.o ./Drivers/lvgl/src/widgets/property/lv_dropdown_properties.su ./Drivers/lvgl/src/widgets/property/lv_image_properties.cyclo ./Drivers/lvgl/src/widgets/property/lv_image_properties.d ./Drivers/lvgl/src/widgets/property/lv_image_properties.o ./Drivers/lvgl/src/widgets/property/lv_image_properties.su ./Drivers/lvgl/src/widgets/property/lv_keyboard_properties.cyclo ./Drivers/lvgl/src/widgets/property/lv_keyboard_properties.d ./Drivers/lvgl/src/widgets/property/lv_keyboard_properties.o ./Drivers/lvgl/src/widgets/property/lv_keyboard_properties.su ./Drivers/lvgl/src/widgets/property/lv_label_properties.cyclo ./Drivers/lvgl/src/widgets/property/lv_label_properties.d ./Drivers/lvgl/src/widgets/property/lv_label_properties.o ./Drivers/lvgl/src/widgets/property/lv_label_properties.su ./Drivers/lvgl/src/widgets/property/lv_obj_properties.cyclo ./Drivers/lvgl/src/widgets/property/lv_obj_properties.d ./Drivers/lvgl/src/widgets/property/lv_obj_properties.o ./Drivers/lvgl/src/widgets/property/lv_obj_properties.su ./Drivers/lvgl/src/widgets/property/lv_roller_properties.cyclo ./Drivers/lvgl/src/widgets/property/lv_roller_properties.d ./Drivers/lvgl/src/widgets/property/lv_roller_properties.o ./Drivers/lvgl/src/widgets/property/lv_roller_properties.su ./Drivers/lvgl/src/widgets/property/lv_slider_properties.cyclo ./Drivers/lvgl/src/widgets/property/lv_slider_properties.d ./Drivers/lvgl/src/widgets/property/lv_slider_properties.o ./Drivers/lvgl/src/widgets/property/lv_slider_properties.su ./Drivers/lvgl/src/widgets/property/lv_style_properties.cyclo ./Drivers/lvgl/src/widgets/property/lv_style_properties.d ./Drivers/lvgl/src/widgets/property/lv_style_properties.o ./Drivers/lvgl/src/widgets/property/lv_style_properties.su ./Drivers/lvgl/src/widgets/property/lv_textarea_properties.cyclo ./Drivers/lvgl/src/widgets/property/lv_textarea_properties.d ./Drivers/lvgl/src/widgets/property/lv_textarea_properties.o ./Drivers/lvgl/src/widgets/property/lv_textarea_properties.su

.PHONY: clean-Drivers-2f-lvgl-2f-src-2f-widgets-2f-property

