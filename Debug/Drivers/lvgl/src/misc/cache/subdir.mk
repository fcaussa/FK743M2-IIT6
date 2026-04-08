################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/lvgl/src/misc/cache/lv_cache.c \
../Drivers/lvgl/src/misc/cache/lv_cache_entry.c 

OBJS += \
./Drivers/lvgl/src/misc/cache/lv_cache.o \
./Drivers/lvgl/src/misc/cache/lv_cache_entry.o 

C_DEPS += \
./Drivers/lvgl/src/misc/cache/lv_cache.d \
./Drivers/lvgl/src/misc/cache/lv_cache_entry.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/lvgl/src/misc/cache/%.o Drivers/lvgl/src/misc/cache/%.su Drivers/lvgl/src/misc/cache/%.cyclo: ../Drivers/lvgl/src/misc/cache/%.c Drivers/lvgl/src/misc/cache/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DUSE_PWR_LDO_SUPPLY -DUSE_HAL_DRIVER -DSTM32H743xx -c -I../Core/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32H7xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers/lvgl" -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-lvgl-2f-src-2f-misc-2f-cache

clean-Drivers-2f-lvgl-2f-src-2f-misc-2f-cache:
	-$(RM) ./Drivers/lvgl/src/misc/cache/lv_cache.cyclo ./Drivers/lvgl/src/misc/cache/lv_cache.d ./Drivers/lvgl/src/misc/cache/lv_cache.o ./Drivers/lvgl/src/misc/cache/lv_cache.su ./Drivers/lvgl/src/misc/cache/lv_cache_entry.cyclo ./Drivers/lvgl/src/misc/cache/lv_cache_entry.d ./Drivers/lvgl/src/misc/cache/lv_cache_entry.o ./Drivers/lvgl/src/misc/cache/lv_cache_entry.su

.PHONY: clean-Drivers-2f-lvgl-2f-src-2f-misc-2f-cache

