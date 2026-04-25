################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/lvgl/src/layouts/grid/lv_grid.c 

OBJS += \
./Drivers/lvgl/src/layouts/grid/lv_grid.o 

C_DEPS += \
./Drivers/lvgl/src/layouts/grid/lv_grid.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/lvgl/src/layouts/grid/%.o Drivers/lvgl/src/layouts/grid/%.su Drivers/lvgl/src/layouts/grid/%.cyclo: ../Drivers/lvgl/src/layouts/grid/%.c Drivers/lvgl/src/layouts/grid/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DUSE_PWR_LDO_SUPPLY -DUSE_HAL_DRIVER -DSTM32H743xx -c -I../Core/Inc -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Core/ui" -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers/lvgl/src" -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers" -I../Drivers/STM32H7xx_HAL_Driver/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32H7xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers/lvgl" -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers" -O0 -ffunction-sections -fdata-sections -Wall -mno-unaligned-access -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-lvgl-2f-src-2f-layouts-2f-grid

clean-Drivers-2f-lvgl-2f-src-2f-layouts-2f-grid:
	-$(RM) ./Drivers/lvgl/src/layouts/grid/lv_grid.cyclo ./Drivers/lvgl/src/layouts/grid/lv_grid.d ./Drivers/lvgl/src/layouts/grid/lv_grid.o ./Drivers/lvgl/src/layouts/grid/lv_grid.su

.PHONY: clean-Drivers-2f-lvgl-2f-src-2f-layouts-2f-grid

