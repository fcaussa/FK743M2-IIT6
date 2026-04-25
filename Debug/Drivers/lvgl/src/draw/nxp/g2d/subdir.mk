################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/lvgl/src/draw/nxp/g2d/lv_draw_buf_g2d.c \
../Drivers/lvgl/src/draw/nxp/g2d/lv_draw_g2d.c \
../Drivers/lvgl/src/draw/nxp/g2d/lv_draw_g2d_fill.c \
../Drivers/lvgl/src/draw/nxp/g2d/lv_draw_g2d_img.c \
../Drivers/lvgl/src/draw/nxp/g2d/lv_g2d_buf_map.c \
../Drivers/lvgl/src/draw/nxp/g2d/lv_g2d_utils.c 

OBJS += \
./Drivers/lvgl/src/draw/nxp/g2d/lv_draw_buf_g2d.o \
./Drivers/lvgl/src/draw/nxp/g2d/lv_draw_g2d.o \
./Drivers/lvgl/src/draw/nxp/g2d/lv_draw_g2d_fill.o \
./Drivers/lvgl/src/draw/nxp/g2d/lv_draw_g2d_img.o \
./Drivers/lvgl/src/draw/nxp/g2d/lv_g2d_buf_map.o \
./Drivers/lvgl/src/draw/nxp/g2d/lv_g2d_utils.o 

C_DEPS += \
./Drivers/lvgl/src/draw/nxp/g2d/lv_draw_buf_g2d.d \
./Drivers/lvgl/src/draw/nxp/g2d/lv_draw_g2d.d \
./Drivers/lvgl/src/draw/nxp/g2d/lv_draw_g2d_fill.d \
./Drivers/lvgl/src/draw/nxp/g2d/lv_draw_g2d_img.d \
./Drivers/lvgl/src/draw/nxp/g2d/lv_g2d_buf_map.d \
./Drivers/lvgl/src/draw/nxp/g2d/lv_g2d_utils.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/lvgl/src/draw/nxp/g2d/%.o Drivers/lvgl/src/draw/nxp/g2d/%.su Drivers/lvgl/src/draw/nxp/g2d/%.cyclo: ../Drivers/lvgl/src/draw/nxp/g2d/%.c Drivers/lvgl/src/draw/nxp/g2d/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DUSE_PWR_LDO_SUPPLY -DUSE_HAL_DRIVER -DSTM32H743xx -c -I../Core/Inc -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers/lvgl/src" -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers" -I../Drivers/STM32H7xx_HAL_Driver/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32H7xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers/lvgl" -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers" -O0 -ffunction-sections -fdata-sections -Wall -mno-unaligned-access -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-lvgl-2f-src-2f-draw-2f-nxp-2f-g2d

clean-Drivers-2f-lvgl-2f-src-2f-draw-2f-nxp-2f-g2d:
	-$(RM) ./Drivers/lvgl/src/draw/nxp/g2d/lv_draw_buf_g2d.cyclo ./Drivers/lvgl/src/draw/nxp/g2d/lv_draw_buf_g2d.d ./Drivers/lvgl/src/draw/nxp/g2d/lv_draw_buf_g2d.o ./Drivers/lvgl/src/draw/nxp/g2d/lv_draw_buf_g2d.su ./Drivers/lvgl/src/draw/nxp/g2d/lv_draw_g2d.cyclo ./Drivers/lvgl/src/draw/nxp/g2d/lv_draw_g2d.d ./Drivers/lvgl/src/draw/nxp/g2d/lv_draw_g2d.o ./Drivers/lvgl/src/draw/nxp/g2d/lv_draw_g2d.su ./Drivers/lvgl/src/draw/nxp/g2d/lv_draw_g2d_fill.cyclo ./Drivers/lvgl/src/draw/nxp/g2d/lv_draw_g2d_fill.d ./Drivers/lvgl/src/draw/nxp/g2d/lv_draw_g2d_fill.o ./Drivers/lvgl/src/draw/nxp/g2d/lv_draw_g2d_fill.su ./Drivers/lvgl/src/draw/nxp/g2d/lv_draw_g2d_img.cyclo ./Drivers/lvgl/src/draw/nxp/g2d/lv_draw_g2d_img.d ./Drivers/lvgl/src/draw/nxp/g2d/lv_draw_g2d_img.o ./Drivers/lvgl/src/draw/nxp/g2d/lv_draw_g2d_img.su ./Drivers/lvgl/src/draw/nxp/g2d/lv_g2d_buf_map.cyclo ./Drivers/lvgl/src/draw/nxp/g2d/lv_g2d_buf_map.d ./Drivers/lvgl/src/draw/nxp/g2d/lv_g2d_buf_map.o ./Drivers/lvgl/src/draw/nxp/g2d/lv_g2d_buf_map.su ./Drivers/lvgl/src/draw/nxp/g2d/lv_g2d_utils.cyclo ./Drivers/lvgl/src/draw/nxp/g2d/lv_g2d_utils.d ./Drivers/lvgl/src/draw/nxp/g2d/lv_g2d_utils.o ./Drivers/lvgl/src/draw/nxp/g2d/lv_g2d_utils.su

.PHONY: clean-Drivers-2f-lvgl-2f-src-2f-draw-2f-nxp-2f-g2d

