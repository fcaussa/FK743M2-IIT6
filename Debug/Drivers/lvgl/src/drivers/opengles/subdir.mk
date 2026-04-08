################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/lvgl/src/drivers/opengles/lv_opengles_debug.c \
../Drivers/lvgl/src/drivers/opengles/lv_opengles_driver.c \
../Drivers/lvgl/src/drivers/opengles/lv_opengles_egl.c \
../Drivers/lvgl/src/drivers/opengles/lv_opengles_glfw.c \
../Drivers/lvgl/src/drivers/opengles/lv_opengles_texture.c 

OBJS += \
./Drivers/lvgl/src/drivers/opengles/lv_opengles_debug.o \
./Drivers/lvgl/src/drivers/opengles/lv_opengles_driver.o \
./Drivers/lvgl/src/drivers/opengles/lv_opengles_egl.o \
./Drivers/lvgl/src/drivers/opengles/lv_opengles_glfw.o \
./Drivers/lvgl/src/drivers/opengles/lv_opengles_texture.o 

C_DEPS += \
./Drivers/lvgl/src/drivers/opengles/lv_opengles_debug.d \
./Drivers/lvgl/src/drivers/opengles/lv_opengles_driver.d \
./Drivers/lvgl/src/drivers/opengles/lv_opengles_egl.d \
./Drivers/lvgl/src/drivers/opengles/lv_opengles_glfw.d \
./Drivers/lvgl/src/drivers/opengles/lv_opengles_texture.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/lvgl/src/drivers/opengles/%.o Drivers/lvgl/src/drivers/opengles/%.su Drivers/lvgl/src/drivers/opengles/%.cyclo: ../Drivers/lvgl/src/drivers/opengles/%.c Drivers/lvgl/src/drivers/opengles/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DUSE_PWR_LDO_SUPPLY -DUSE_HAL_DRIVER -DSTM32H743xx -c -I../Core/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32H7xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers/lvgl" -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-lvgl-2f-src-2f-drivers-2f-opengles

clean-Drivers-2f-lvgl-2f-src-2f-drivers-2f-opengles:
	-$(RM) ./Drivers/lvgl/src/drivers/opengles/lv_opengles_debug.cyclo ./Drivers/lvgl/src/drivers/opengles/lv_opengles_debug.d ./Drivers/lvgl/src/drivers/opengles/lv_opengles_debug.o ./Drivers/lvgl/src/drivers/opengles/lv_opengles_debug.su ./Drivers/lvgl/src/drivers/opengles/lv_opengles_driver.cyclo ./Drivers/lvgl/src/drivers/opengles/lv_opengles_driver.d ./Drivers/lvgl/src/drivers/opengles/lv_opengles_driver.o ./Drivers/lvgl/src/drivers/opengles/lv_opengles_driver.su ./Drivers/lvgl/src/drivers/opengles/lv_opengles_egl.cyclo ./Drivers/lvgl/src/drivers/opengles/lv_opengles_egl.d ./Drivers/lvgl/src/drivers/opengles/lv_opengles_egl.o ./Drivers/lvgl/src/drivers/opengles/lv_opengles_egl.su ./Drivers/lvgl/src/drivers/opengles/lv_opengles_glfw.cyclo ./Drivers/lvgl/src/drivers/opengles/lv_opengles_glfw.d ./Drivers/lvgl/src/drivers/opengles/lv_opengles_glfw.o ./Drivers/lvgl/src/drivers/opengles/lv_opengles_glfw.su ./Drivers/lvgl/src/drivers/opengles/lv_opengles_texture.cyclo ./Drivers/lvgl/src/drivers/opengles/lv_opengles_texture.d ./Drivers/lvgl/src/drivers/opengles/lv_opengles_texture.o ./Drivers/lvgl/src/drivers/opengles/lv_opengles_texture.su

.PHONY: clean-Drivers-2f-lvgl-2f-src-2f-drivers-2f-opengles

