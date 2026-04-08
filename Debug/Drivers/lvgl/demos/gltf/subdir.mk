################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/lvgl/demos/gltf/lv_demo_gltf.c 

OBJS += \
./Drivers/lvgl/demos/gltf/lv_demo_gltf.o 

C_DEPS += \
./Drivers/lvgl/demos/gltf/lv_demo_gltf.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/lvgl/demos/gltf/%.o Drivers/lvgl/demos/gltf/%.su Drivers/lvgl/demos/gltf/%.cyclo: ../Drivers/lvgl/demos/gltf/%.c Drivers/lvgl/demos/gltf/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DUSE_PWR_LDO_SUPPLY -DUSE_HAL_DRIVER -DSTM32H743xx -c -I../Core/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32H7xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers/lvgl" -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-lvgl-2f-demos-2f-gltf

clean-Drivers-2f-lvgl-2f-demos-2f-gltf:
	-$(RM) ./Drivers/lvgl/demos/gltf/lv_demo_gltf.cyclo ./Drivers/lvgl/demos/gltf/lv_demo_gltf.d ./Drivers/lvgl/demos/gltf/lv_demo_gltf.o ./Drivers/lvgl/demos/gltf/lv_demo_gltf.su

.PHONY: clean-Drivers-2f-lvgl-2f-demos-2f-gltf

