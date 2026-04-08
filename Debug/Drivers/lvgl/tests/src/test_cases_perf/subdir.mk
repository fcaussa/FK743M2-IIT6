################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/lvgl/tests/src/test_cases_perf/test_chart.c \
../Drivers/lvgl/tests/src/test_cases_perf/test_label.c \
../Drivers/lvgl/tests/src/test_cases_perf/test_math.c 

OBJS += \
./Drivers/lvgl/tests/src/test_cases_perf/test_chart.o \
./Drivers/lvgl/tests/src/test_cases_perf/test_label.o \
./Drivers/lvgl/tests/src/test_cases_perf/test_math.o 

C_DEPS += \
./Drivers/lvgl/tests/src/test_cases_perf/test_chart.d \
./Drivers/lvgl/tests/src/test_cases_perf/test_label.d \
./Drivers/lvgl/tests/src/test_cases_perf/test_math.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/lvgl/tests/src/test_cases_perf/%.o Drivers/lvgl/tests/src/test_cases_perf/%.su Drivers/lvgl/tests/src/test_cases_perf/%.cyclo: ../Drivers/lvgl/tests/src/test_cases_perf/%.c Drivers/lvgl/tests/src/test_cases_perf/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DUSE_PWR_LDO_SUPPLY -DUSE_HAL_DRIVER -DSTM32H743xx -c -I../Core/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32H7xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers/lvgl" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-lvgl-2f-tests-2f-src-2f-test_cases_perf

clean-Drivers-2f-lvgl-2f-tests-2f-src-2f-test_cases_perf:
	-$(RM) ./Drivers/lvgl/tests/src/test_cases_perf/test_chart.cyclo ./Drivers/lvgl/tests/src/test_cases_perf/test_chart.d ./Drivers/lvgl/tests/src/test_cases_perf/test_chart.o ./Drivers/lvgl/tests/src/test_cases_perf/test_chart.su ./Drivers/lvgl/tests/src/test_cases_perf/test_label.cyclo ./Drivers/lvgl/tests/src/test_cases_perf/test_label.d ./Drivers/lvgl/tests/src/test_cases_perf/test_label.o ./Drivers/lvgl/tests/src/test_cases_perf/test_label.su ./Drivers/lvgl/tests/src/test_cases_perf/test_math.cyclo ./Drivers/lvgl/tests/src/test_cases_perf/test_math.d ./Drivers/lvgl/tests/src/test_cases_perf/test_math.o ./Drivers/lvgl/tests/src/test_cases_perf/test_math.su

.PHONY: clean-Drivers-2f-lvgl-2f-tests-2f-src-2f-test_cases_perf

