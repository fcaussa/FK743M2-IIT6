################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/lvgl/examples/widgets/label/lv_example_label_1.c \
../Drivers/lvgl/examples/widgets/label/lv_example_label_2.c \
../Drivers/lvgl/examples/widgets/label/lv_example_label_3.c \
../Drivers/lvgl/examples/widgets/label/lv_example_label_4.c \
../Drivers/lvgl/examples/widgets/label/lv_example_label_5.c \
../Drivers/lvgl/examples/widgets/label/lv_example_label_6.c \
../Drivers/lvgl/examples/widgets/label/lv_example_label_7.c 

OBJS += \
./Drivers/lvgl/examples/widgets/label/lv_example_label_1.o \
./Drivers/lvgl/examples/widgets/label/lv_example_label_2.o \
./Drivers/lvgl/examples/widgets/label/lv_example_label_3.o \
./Drivers/lvgl/examples/widgets/label/lv_example_label_4.o \
./Drivers/lvgl/examples/widgets/label/lv_example_label_5.o \
./Drivers/lvgl/examples/widgets/label/lv_example_label_6.o \
./Drivers/lvgl/examples/widgets/label/lv_example_label_7.o 

C_DEPS += \
./Drivers/lvgl/examples/widgets/label/lv_example_label_1.d \
./Drivers/lvgl/examples/widgets/label/lv_example_label_2.d \
./Drivers/lvgl/examples/widgets/label/lv_example_label_3.d \
./Drivers/lvgl/examples/widgets/label/lv_example_label_4.d \
./Drivers/lvgl/examples/widgets/label/lv_example_label_5.d \
./Drivers/lvgl/examples/widgets/label/lv_example_label_6.d \
./Drivers/lvgl/examples/widgets/label/lv_example_label_7.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/lvgl/examples/widgets/label/%.o Drivers/lvgl/examples/widgets/label/%.su Drivers/lvgl/examples/widgets/label/%.cyclo: ../Drivers/lvgl/examples/widgets/label/%.c Drivers/lvgl/examples/widgets/label/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DUSE_PWR_LDO_SUPPLY -DUSE_HAL_DRIVER -DSTM32H743xx -c -I../Core/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32H7xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers/lvgl" -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-lvgl-2f-examples-2f-widgets-2f-label

clean-Drivers-2f-lvgl-2f-examples-2f-widgets-2f-label:
	-$(RM) ./Drivers/lvgl/examples/widgets/label/lv_example_label_1.cyclo ./Drivers/lvgl/examples/widgets/label/lv_example_label_1.d ./Drivers/lvgl/examples/widgets/label/lv_example_label_1.o ./Drivers/lvgl/examples/widgets/label/lv_example_label_1.su ./Drivers/lvgl/examples/widgets/label/lv_example_label_2.cyclo ./Drivers/lvgl/examples/widgets/label/lv_example_label_2.d ./Drivers/lvgl/examples/widgets/label/lv_example_label_2.o ./Drivers/lvgl/examples/widgets/label/lv_example_label_2.su ./Drivers/lvgl/examples/widgets/label/lv_example_label_3.cyclo ./Drivers/lvgl/examples/widgets/label/lv_example_label_3.d ./Drivers/lvgl/examples/widgets/label/lv_example_label_3.o ./Drivers/lvgl/examples/widgets/label/lv_example_label_3.su ./Drivers/lvgl/examples/widgets/label/lv_example_label_4.cyclo ./Drivers/lvgl/examples/widgets/label/lv_example_label_4.d ./Drivers/lvgl/examples/widgets/label/lv_example_label_4.o ./Drivers/lvgl/examples/widgets/label/lv_example_label_4.su ./Drivers/lvgl/examples/widgets/label/lv_example_label_5.cyclo ./Drivers/lvgl/examples/widgets/label/lv_example_label_5.d ./Drivers/lvgl/examples/widgets/label/lv_example_label_5.o ./Drivers/lvgl/examples/widgets/label/lv_example_label_5.su ./Drivers/lvgl/examples/widgets/label/lv_example_label_6.cyclo ./Drivers/lvgl/examples/widgets/label/lv_example_label_6.d ./Drivers/lvgl/examples/widgets/label/lv_example_label_6.o ./Drivers/lvgl/examples/widgets/label/lv_example_label_6.su ./Drivers/lvgl/examples/widgets/label/lv_example_label_7.cyclo ./Drivers/lvgl/examples/widgets/label/lv_example_label_7.d ./Drivers/lvgl/examples/widgets/label/lv_example_label_7.o ./Drivers/lvgl/examples/widgets/label/lv_example_label_7.su

.PHONY: clean-Drivers-2f-lvgl-2f-examples-2f-widgets-2f-label

