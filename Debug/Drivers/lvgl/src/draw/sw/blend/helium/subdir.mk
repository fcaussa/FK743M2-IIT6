################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
S_UPPER_SRCS += \
../Drivers/lvgl/src/draw/sw/blend/helium/lv_blend_helium.S 

OBJS += \
./Drivers/lvgl/src/draw/sw/blend/helium/lv_blend_helium.o 

S_UPPER_DEPS += \
./Drivers/lvgl/src/draw/sw/blend/helium/lv_blend_helium.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/lvgl/src/draw/sw/blend/helium/%.o: ../Drivers/lvgl/src/draw/sw/blend/helium/%.S Drivers/lvgl/src/draw/sw/blend/helium/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m7 -g3 -DDEBUG -c -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers/lvgl" -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers/lv_fatfs" -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers/touch" -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Core/Inc" -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers" -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"

clean: clean-Drivers-2f-lvgl-2f-src-2f-draw-2f-sw-2f-blend-2f-helium

clean-Drivers-2f-lvgl-2f-src-2f-draw-2f-sw-2f-blend-2f-helium:
	-$(RM) ./Drivers/lvgl/src/draw/sw/blend/helium/lv_blend_helium.d ./Drivers/lvgl/src/draw/sw/blend/helium/lv_blend_helium.o

.PHONY: clean-Drivers-2f-lvgl-2f-src-2f-draw-2f-sw-2f-blend-2f-helium

