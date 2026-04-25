################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/lvgl/src/draw/eve/lv_draw_eve.c \
../Drivers/lvgl/src/draw/eve/lv_draw_eve_arc.c \
../Drivers/lvgl/src/draw/eve/lv_draw_eve_fill.c \
../Drivers/lvgl/src/draw/eve/lv_draw_eve_image.c \
../Drivers/lvgl/src/draw/eve/lv_draw_eve_letter.c \
../Drivers/lvgl/src/draw/eve/lv_draw_eve_line.c \
../Drivers/lvgl/src/draw/eve/lv_draw_eve_ram_g.c \
../Drivers/lvgl/src/draw/eve/lv_draw_eve_triangle.c \
../Drivers/lvgl/src/draw/eve/lv_eve.c 

OBJS += \
./Drivers/lvgl/src/draw/eve/lv_draw_eve.o \
./Drivers/lvgl/src/draw/eve/lv_draw_eve_arc.o \
./Drivers/lvgl/src/draw/eve/lv_draw_eve_fill.o \
./Drivers/lvgl/src/draw/eve/lv_draw_eve_image.o \
./Drivers/lvgl/src/draw/eve/lv_draw_eve_letter.o \
./Drivers/lvgl/src/draw/eve/lv_draw_eve_line.o \
./Drivers/lvgl/src/draw/eve/lv_draw_eve_ram_g.o \
./Drivers/lvgl/src/draw/eve/lv_draw_eve_triangle.o \
./Drivers/lvgl/src/draw/eve/lv_eve.o 

C_DEPS += \
./Drivers/lvgl/src/draw/eve/lv_draw_eve.d \
./Drivers/lvgl/src/draw/eve/lv_draw_eve_arc.d \
./Drivers/lvgl/src/draw/eve/lv_draw_eve_fill.d \
./Drivers/lvgl/src/draw/eve/lv_draw_eve_image.d \
./Drivers/lvgl/src/draw/eve/lv_draw_eve_letter.d \
./Drivers/lvgl/src/draw/eve/lv_draw_eve_line.d \
./Drivers/lvgl/src/draw/eve/lv_draw_eve_ram_g.d \
./Drivers/lvgl/src/draw/eve/lv_draw_eve_triangle.d \
./Drivers/lvgl/src/draw/eve/lv_eve.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/lvgl/src/draw/eve/%.o Drivers/lvgl/src/draw/eve/%.su Drivers/lvgl/src/draw/eve/%.cyclo: ../Drivers/lvgl/src/draw/eve/%.c Drivers/lvgl/src/draw/eve/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DUSE_PWR_LDO_SUPPLY -DUSE_HAL_DRIVER -DSTM32H743xx -c -I../Core/Inc -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers/touch" -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Core/ui" -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers/lvgl/src" -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers" -I../Drivers/STM32H7xx_HAL_Driver/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32H7xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers/lvgl" -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers" -O0 -ffunction-sections -fdata-sections -Wall -mno-unaligned-access -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-lvgl-2f-src-2f-draw-2f-eve

clean-Drivers-2f-lvgl-2f-src-2f-draw-2f-eve:
	-$(RM) ./Drivers/lvgl/src/draw/eve/lv_draw_eve.cyclo ./Drivers/lvgl/src/draw/eve/lv_draw_eve.d ./Drivers/lvgl/src/draw/eve/lv_draw_eve.o ./Drivers/lvgl/src/draw/eve/lv_draw_eve.su ./Drivers/lvgl/src/draw/eve/lv_draw_eve_arc.cyclo ./Drivers/lvgl/src/draw/eve/lv_draw_eve_arc.d ./Drivers/lvgl/src/draw/eve/lv_draw_eve_arc.o ./Drivers/lvgl/src/draw/eve/lv_draw_eve_arc.su ./Drivers/lvgl/src/draw/eve/lv_draw_eve_fill.cyclo ./Drivers/lvgl/src/draw/eve/lv_draw_eve_fill.d ./Drivers/lvgl/src/draw/eve/lv_draw_eve_fill.o ./Drivers/lvgl/src/draw/eve/lv_draw_eve_fill.su ./Drivers/lvgl/src/draw/eve/lv_draw_eve_image.cyclo ./Drivers/lvgl/src/draw/eve/lv_draw_eve_image.d ./Drivers/lvgl/src/draw/eve/lv_draw_eve_image.o ./Drivers/lvgl/src/draw/eve/lv_draw_eve_image.su ./Drivers/lvgl/src/draw/eve/lv_draw_eve_letter.cyclo ./Drivers/lvgl/src/draw/eve/lv_draw_eve_letter.d ./Drivers/lvgl/src/draw/eve/lv_draw_eve_letter.o ./Drivers/lvgl/src/draw/eve/lv_draw_eve_letter.su ./Drivers/lvgl/src/draw/eve/lv_draw_eve_line.cyclo ./Drivers/lvgl/src/draw/eve/lv_draw_eve_line.d ./Drivers/lvgl/src/draw/eve/lv_draw_eve_line.o ./Drivers/lvgl/src/draw/eve/lv_draw_eve_line.su ./Drivers/lvgl/src/draw/eve/lv_draw_eve_ram_g.cyclo ./Drivers/lvgl/src/draw/eve/lv_draw_eve_ram_g.d ./Drivers/lvgl/src/draw/eve/lv_draw_eve_ram_g.o ./Drivers/lvgl/src/draw/eve/lv_draw_eve_ram_g.su ./Drivers/lvgl/src/draw/eve/lv_draw_eve_triangle.cyclo ./Drivers/lvgl/src/draw/eve/lv_draw_eve_triangle.d ./Drivers/lvgl/src/draw/eve/lv_draw_eve_triangle.o ./Drivers/lvgl/src/draw/eve/lv_draw_eve_triangle.su ./Drivers/lvgl/src/draw/eve/lv_eve.cyclo ./Drivers/lvgl/src/draw/eve/lv_eve.d ./Drivers/lvgl/src/draw/eve/lv_eve.o ./Drivers/lvgl/src/draw/eve/lv_eve.su

.PHONY: clean-Drivers-2f-lvgl-2f-src-2f-draw-2f-eve

