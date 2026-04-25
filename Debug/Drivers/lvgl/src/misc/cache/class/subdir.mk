################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/lvgl/src/misc/cache/class/lv_cache_lru_ll.c \
../Drivers/lvgl/src/misc/cache/class/lv_cache_lru_rb.c \
../Drivers/lvgl/src/misc/cache/class/lv_cache_sc_da.c 

OBJS += \
./Drivers/lvgl/src/misc/cache/class/lv_cache_lru_ll.o \
./Drivers/lvgl/src/misc/cache/class/lv_cache_lru_rb.o \
./Drivers/lvgl/src/misc/cache/class/lv_cache_sc_da.o 

C_DEPS += \
./Drivers/lvgl/src/misc/cache/class/lv_cache_lru_ll.d \
./Drivers/lvgl/src/misc/cache/class/lv_cache_lru_rb.d \
./Drivers/lvgl/src/misc/cache/class/lv_cache_sc_da.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/lvgl/src/misc/cache/class/%.o Drivers/lvgl/src/misc/cache/class/%.su Drivers/lvgl/src/misc/cache/class/%.cyclo: ../Drivers/lvgl/src/misc/cache/class/%.c Drivers/lvgl/src/misc/cache/class/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DUSE_PWR_LDO_SUPPLY -DUSE_HAL_DRIVER -DSTM32H743xx -c -I../Core/Inc -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Core/ui" -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers/lvgl/src" -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers" -I../Drivers/STM32H7xx_HAL_Driver/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32H7xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers/lvgl" -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers" -O0 -ffunction-sections -fdata-sections -Wall -mno-unaligned-access -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-lvgl-2f-src-2f-misc-2f-cache-2f-class

clean-Drivers-2f-lvgl-2f-src-2f-misc-2f-cache-2f-class:
	-$(RM) ./Drivers/lvgl/src/misc/cache/class/lv_cache_lru_ll.cyclo ./Drivers/lvgl/src/misc/cache/class/lv_cache_lru_ll.d ./Drivers/lvgl/src/misc/cache/class/lv_cache_lru_ll.o ./Drivers/lvgl/src/misc/cache/class/lv_cache_lru_ll.su ./Drivers/lvgl/src/misc/cache/class/lv_cache_lru_rb.cyclo ./Drivers/lvgl/src/misc/cache/class/lv_cache_lru_rb.d ./Drivers/lvgl/src/misc/cache/class/lv_cache_lru_rb.o ./Drivers/lvgl/src/misc/cache/class/lv_cache_lru_rb.su ./Drivers/lvgl/src/misc/cache/class/lv_cache_sc_da.cyclo ./Drivers/lvgl/src/misc/cache/class/lv_cache_sc_da.d ./Drivers/lvgl/src/misc/cache/class/lv_cache_sc_da.o ./Drivers/lvgl/src/misc/cache/class/lv_cache_sc_da.su

.PHONY: clean-Drivers-2f-lvgl-2f-src-2f-misc-2f-cache-2f-class

