################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/lvgl/src/draw/espressif/ppa/lv_draw_ppa.c \
../Drivers/lvgl/src/draw/espressif/ppa/lv_draw_ppa_buf.c \
../Drivers/lvgl/src/draw/espressif/ppa/lv_draw_ppa_fill.c \
../Drivers/lvgl/src/draw/espressif/ppa/lv_draw_ppa_img.c 

OBJS += \
./Drivers/lvgl/src/draw/espressif/ppa/lv_draw_ppa.o \
./Drivers/lvgl/src/draw/espressif/ppa/lv_draw_ppa_buf.o \
./Drivers/lvgl/src/draw/espressif/ppa/lv_draw_ppa_fill.o \
./Drivers/lvgl/src/draw/espressif/ppa/lv_draw_ppa_img.o 

C_DEPS += \
./Drivers/lvgl/src/draw/espressif/ppa/lv_draw_ppa.d \
./Drivers/lvgl/src/draw/espressif/ppa/lv_draw_ppa_buf.d \
./Drivers/lvgl/src/draw/espressif/ppa/lv_draw_ppa_fill.d \
./Drivers/lvgl/src/draw/espressif/ppa/lv_draw_ppa_img.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/lvgl/src/draw/espressif/ppa/%.o Drivers/lvgl/src/draw/espressif/ppa/%.su Drivers/lvgl/src/draw/espressif/ppa/%.cyclo: ../Drivers/lvgl/src/draw/espressif/ppa/%.c Drivers/lvgl/src/draw/espressif/ppa/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DUSE_PWR_LDO_SUPPLY -DUSE_HAL_DRIVER -DSTM32H743xx -c -I../Core/Inc -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers/touch" -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Core/ui" -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers/lvgl/src" -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers" -I../Drivers/STM32H7xx_HAL_Driver/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32H7xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers/lvgl" -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers" -O0 -ffunction-sections -fdata-sections -Wall -mno-unaligned-access -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-lvgl-2f-src-2f-draw-2f-espressif-2f-ppa

clean-Drivers-2f-lvgl-2f-src-2f-draw-2f-espressif-2f-ppa:
	-$(RM) ./Drivers/lvgl/src/draw/espressif/ppa/lv_draw_ppa.cyclo ./Drivers/lvgl/src/draw/espressif/ppa/lv_draw_ppa.d ./Drivers/lvgl/src/draw/espressif/ppa/lv_draw_ppa.o ./Drivers/lvgl/src/draw/espressif/ppa/lv_draw_ppa.su ./Drivers/lvgl/src/draw/espressif/ppa/lv_draw_ppa_buf.cyclo ./Drivers/lvgl/src/draw/espressif/ppa/lv_draw_ppa_buf.d ./Drivers/lvgl/src/draw/espressif/ppa/lv_draw_ppa_buf.o ./Drivers/lvgl/src/draw/espressif/ppa/lv_draw_ppa_buf.su ./Drivers/lvgl/src/draw/espressif/ppa/lv_draw_ppa_fill.cyclo ./Drivers/lvgl/src/draw/espressif/ppa/lv_draw_ppa_fill.d ./Drivers/lvgl/src/draw/espressif/ppa/lv_draw_ppa_fill.o ./Drivers/lvgl/src/draw/espressif/ppa/lv_draw_ppa_fill.su ./Drivers/lvgl/src/draw/espressif/ppa/lv_draw_ppa_img.cyclo ./Drivers/lvgl/src/draw/espressif/ppa/lv_draw_ppa_img.d ./Drivers/lvgl/src/draw/espressif/ppa/lv_draw_ppa_img.o ./Drivers/lvgl/src/draw/espressif/ppa/lv_draw_ppa_img.su

.PHONY: clean-Drivers-2f-lvgl-2f-src-2f-draw-2f-espressif-2f-ppa

