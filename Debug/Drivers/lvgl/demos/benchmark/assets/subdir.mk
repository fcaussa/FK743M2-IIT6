################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/lvgl/demos/benchmark/assets/img_benchmark_avatar.c \
../Drivers/lvgl/demos/benchmark/assets/img_benchmark_lvgl_logo_argb.c \
../Drivers/lvgl/demos/benchmark/assets/img_benchmark_lvgl_logo_rgb.c \
../Drivers/lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_12_aligned.c \
../Drivers/lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_14_aligned.c \
../Drivers/lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_16_aligned.c \
../Drivers/lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_18_aligned.c \
../Drivers/lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_20_aligned.c \
../Drivers/lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_24_aligned.c \
../Drivers/lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_26_aligned.c 

OBJS += \
./Drivers/lvgl/demos/benchmark/assets/img_benchmark_avatar.o \
./Drivers/lvgl/demos/benchmark/assets/img_benchmark_lvgl_logo_argb.o \
./Drivers/lvgl/demos/benchmark/assets/img_benchmark_lvgl_logo_rgb.o \
./Drivers/lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_12_aligned.o \
./Drivers/lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_14_aligned.o \
./Drivers/lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_16_aligned.o \
./Drivers/lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_18_aligned.o \
./Drivers/lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_20_aligned.o \
./Drivers/lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_24_aligned.o \
./Drivers/lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_26_aligned.o 

C_DEPS += \
./Drivers/lvgl/demos/benchmark/assets/img_benchmark_avatar.d \
./Drivers/lvgl/demos/benchmark/assets/img_benchmark_lvgl_logo_argb.d \
./Drivers/lvgl/demos/benchmark/assets/img_benchmark_lvgl_logo_rgb.d \
./Drivers/lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_12_aligned.d \
./Drivers/lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_14_aligned.d \
./Drivers/lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_16_aligned.d \
./Drivers/lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_18_aligned.d \
./Drivers/lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_20_aligned.d \
./Drivers/lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_24_aligned.d \
./Drivers/lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_26_aligned.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/lvgl/demos/benchmark/assets/%.o Drivers/lvgl/demos/benchmark/assets/%.su Drivers/lvgl/demos/benchmark/assets/%.cyclo: ../Drivers/lvgl/demos/benchmark/assets/%.c Drivers/lvgl/demos/benchmark/assets/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DUSE_PWR_LDO_SUPPLY -DUSE_HAL_DRIVER -DSTM32H743xx -c -I../Core/Inc -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers/lvgl/src" -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers" -I../Drivers/STM32H7xx_HAL_Driver/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32H7xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers/lvgl" -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-lvgl-2f-demos-2f-benchmark-2f-assets

clean-Drivers-2f-lvgl-2f-demos-2f-benchmark-2f-assets:
	-$(RM) ./Drivers/lvgl/demos/benchmark/assets/img_benchmark_avatar.cyclo ./Drivers/lvgl/demos/benchmark/assets/img_benchmark_avatar.d ./Drivers/lvgl/demos/benchmark/assets/img_benchmark_avatar.o ./Drivers/lvgl/demos/benchmark/assets/img_benchmark_avatar.su ./Drivers/lvgl/demos/benchmark/assets/img_benchmark_lvgl_logo_argb.cyclo ./Drivers/lvgl/demos/benchmark/assets/img_benchmark_lvgl_logo_argb.d ./Drivers/lvgl/demos/benchmark/assets/img_benchmark_lvgl_logo_argb.o ./Drivers/lvgl/demos/benchmark/assets/img_benchmark_lvgl_logo_argb.su ./Drivers/lvgl/demos/benchmark/assets/img_benchmark_lvgl_logo_rgb.cyclo ./Drivers/lvgl/demos/benchmark/assets/img_benchmark_lvgl_logo_rgb.d ./Drivers/lvgl/demos/benchmark/assets/img_benchmark_lvgl_logo_rgb.o ./Drivers/lvgl/demos/benchmark/assets/img_benchmark_lvgl_logo_rgb.su ./Drivers/lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_12_aligned.cyclo ./Drivers/lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_12_aligned.d ./Drivers/lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_12_aligned.o ./Drivers/lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_12_aligned.su ./Drivers/lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_14_aligned.cyclo ./Drivers/lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_14_aligned.d ./Drivers/lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_14_aligned.o ./Drivers/lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_14_aligned.su ./Drivers/lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_16_aligned.cyclo ./Drivers/lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_16_aligned.d ./Drivers/lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_16_aligned.o ./Drivers/lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_16_aligned.su ./Drivers/lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_18_aligned.cyclo ./Drivers/lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_18_aligned.d ./Drivers/lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_18_aligned.o ./Drivers/lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_18_aligned.su ./Drivers/lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_20_aligned.cyclo ./Drivers/lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_20_aligned.d ./Drivers/lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_20_aligned.o ./Drivers/lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_20_aligned.su ./Drivers/lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_24_aligned.cyclo ./Drivers/lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_24_aligned.d ./Drivers/lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_24_aligned.o ./Drivers/lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_24_aligned.su ./Drivers/lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_26_aligned.cyclo ./Drivers/lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_26_aligned.d ./Drivers/lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_26_aligned.o ./Drivers/lvgl/demos/benchmark/assets/lv_font_benchmark_montserrat_26_aligned.su

.PHONY: clean-Drivers-2f-lvgl-2f-demos-2f-benchmark-2f-assets

