################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/lvgl/examples/libs/libpng/img_png_demo.c \
../Drivers/lvgl/examples/libs/libpng/lv_example_libpng_1.c 

OBJS += \
./Drivers/lvgl/examples/libs/libpng/img_png_demo.o \
./Drivers/lvgl/examples/libs/libpng/lv_example_libpng_1.o 

C_DEPS += \
./Drivers/lvgl/examples/libs/libpng/img_png_demo.d \
./Drivers/lvgl/examples/libs/libpng/lv_example_libpng_1.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/lvgl/examples/libs/libpng/%.o Drivers/lvgl/examples/libs/libpng/%.su Drivers/lvgl/examples/libs/libpng/%.cyclo: ../Drivers/lvgl/examples/libs/libpng/%.c Drivers/lvgl/examples/libs/libpng/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DUSE_PWR_LDO_SUPPLY -DUSE_HAL_DRIVER -DSTM32H743xx -c -I../Core/Inc -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers/lvgl/src" -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers" -I../Drivers/STM32H7xx_HAL_Driver/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32H7xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers/lvgl" -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-lvgl-2f-examples-2f-libs-2f-libpng

clean-Drivers-2f-lvgl-2f-examples-2f-libs-2f-libpng:
	-$(RM) ./Drivers/lvgl/examples/libs/libpng/img_png_demo.cyclo ./Drivers/lvgl/examples/libs/libpng/img_png_demo.d ./Drivers/lvgl/examples/libs/libpng/img_png_demo.o ./Drivers/lvgl/examples/libs/libpng/img_png_demo.su ./Drivers/lvgl/examples/libs/libpng/lv_example_libpng_1.cyclo ./Drivers/lvgl/examples/libs/libpng/lv_example_libpng_1.d ./Drivers/lvgl/examples/libs/libpng/lv_example_libpng_1.o ./Drivers/lvgl/examples/libs/libpng/lv_example_libpng_1.su

.PHONY: clean-Drivers-2f-lvgl-2f-examples-2f-libs-2f-libpng

