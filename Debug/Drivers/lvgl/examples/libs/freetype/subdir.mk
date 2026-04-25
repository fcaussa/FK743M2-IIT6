################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/lvgl/examples/libs/freetype/lv_example_freetype_1.c \
../Drivers/lvgl/examples/libs/freetype/lv_example_freetype_2.c \
../Drivers/lvgl/examples/libs/freetype/lv_example_freetype_3.c 

OBJS += \
./Drivers/lvgl/examples/libs/freetype/lv_example_freetype_1.o \
./Drivers/lvgl/examples/libs/freetype/lv_example_freetype_2.o \
./Drivers/lvgl/examples/libs/freetype/lv_example_freetype_3.o 

C_DEPS += \
./Drivers/lvgl/examples/libs/freetype/lv_example_freetype_1.d \
./Drivers/lvgl/examples/libs/freetype/lv_example_freetype_2.d \
./Drivers/lvgl/examples/libs/freetype/lv_example_freetype_3.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/lvgl/examples/libs/freetype/%.o Drivers/lvgl/examples/libs/freetype/%.su Drivers/lvgl/examples/libs/freetype/%.cyclo: ../Drivers/lvgl/examples/libs/freetype/%.c Drivers/lvgl/examples/libs/freetype/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DUSE_PWR_LDO_SUPPLY -DUSE_HAL_DRIVER -DSTM32H743xx -c -I../Core/Inc -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers/lvgl/src" -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers" -I../Drivers/STM32H7xx_HAL_Driver/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32H7xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers/lvgl" -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-lvgl-2f-examples-2f-libs-2f-freetype

clean-Drivers-2f-lvgl-2f-examples-2f-libs-2f-freetype:
	-$(RM) ./Drivers/lvgl/examples/libs/freetype/lv_example_freetype_1.cyclo ./Drivers/lvgl/examples/libs/freetype/lv_example_freetype_1.d ./Drivers/lvgl/examples/libs/freetype/lv_example_freetype_1.o ./Drivers/lvgl/examples/libs/freetype/lv_example_freetype_1.su ./Drivers/lvgl/examples/libs/freetype/lv_example_freetype_2.cyclo ./Drivers/lvgl/examples/libs/freetype/lv_example_freetype_2.d ./Drivers/lvgl/examples/libs/freetype/lv_example_freetype_2.o ./Drivers/lvgl/examples/libs/freetype/lv_example_freetype_2.su ./Drivers/lvgl/examples/libs/freetype/lv_example_freetype_3.cyclo ./Drivers/lvgl/examples/libs/freetype/lv_example_freetype_3.d ./Drivers/lvgl/examples/libs/freetype/lv_example_freetype_3.o ./Drivers/lvgl/examples/libs/freetype/lv_example_freetype_3.su

.PHONY: clean-Drivers-2f-lvgl-2f-examples-2f-libs-2f-freetype

