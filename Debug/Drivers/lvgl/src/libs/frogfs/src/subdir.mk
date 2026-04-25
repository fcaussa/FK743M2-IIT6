################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/lvgl/src/libs/frogfs/src/decomp_raw.c \
../Drivers/lvgl/src/libs/frogfs/src/frogfs.c 

OBJS += \
./Drivers/lvgl/src/libs/frogfs/src/decomp_raw.o \
./Drivers/lvgl/src/libs/frogfs/src/frogfs.o 

C_DEPS += \
./Drivers/lvgl/src/libs/frogfs/src/decomp_raw.d \
./Drivers/lvgl/src/libs/frogfs/src/frogfs.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/lvgl/src/libs/frogfs/src/%.o Drivers/lvgl/src/libs/frogfs/src/%.su Drivers/lvgl/src/libs/frogfs/src/%.cyclo: ../Drivers/lvgl/src/libs/frogfs/src/%.c Drivers/lvgl/src/libs/frogfs/src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DUSE_PWR_LDO_SUPPLY -DUSE_HAL_DRIVER -DSTM32H743xx -c -I../Core/Inc -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers/lvgl/src" -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers" -I../Drivers/STM32H7xx_HAL_Driver/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32H7xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers/lvgl" -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers" -O0 -ffunction-sections -fdata-sections -Wall -mno-unaligned-access -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-lvgl-2f-src-2f-libs-2f-frogfs-2f-src

clean-Drivers-2f-lvgl-2f-src-2f-libs-2f-frogfs-2f-src:
	-$(RM) ./Drivers/lvgl/src/libs/frogfs/src/decomp_raw.cyclo ./Drivers/lvgl/src/libs/frogfs/src/decomp_raw.d ./Drivers/lvgl/src/libs/frogfs/src/decomp_raw.o ./Drivers/lvgl/src/libs/frogfs/src/decomp_raw.su ./Drivers/lvgl/src/libs/frogfs/src/frogfs.cyclo ./Drivers/lvgl/src/libs/frogfs/src/frogfs.d ./Drivers/lvgl/src/libs/frogfs/src/frogfs.o ./Drivers/lvgl/src/libs/frogfs/src/frogfs.su

.PHONY: clean-Drivers-2f-lvgl-2f-src-2f-libs-2f-frogfs-2f-src

