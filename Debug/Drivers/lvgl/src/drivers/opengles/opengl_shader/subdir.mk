################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/lvgl/src/drivers/opengles/opengl_shader/lv_opengl_shader_manager.c \
../Drivers/lvgl/src/drivers/opengles/opengl_shader/lv_opengl_shader_program.c 

OBJS += \
./Drivers/lvgl/src/drivers/opengles/opengl_shader/lv_opengl_shader_manager.o \
./Drivers/lvgl/src/drivers/opengles/opengl_shader/lv_opengl_shader_program.o 

C_DEPS += \
./Drivers/lvgl/src/drivers/opengles/opengl_shader/lv_opengl_shader_manager.d \
./Drivers/lvgl/src/drivers/opengles/opengl_shader/lv_opengl_shader_program.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/lvgl/src/drivers/opengles/opengl_shader/%.o Drivers/lvgl/src/drivers/opengles/opengl_shader/%.su Drivers/lvgl/src/drivers/opengles/opengl_shader/%.cyclo: ../Drivers/lvgl/src/drivers/opengles/opengl_shader/%.c Drivers/lvgl/src/drivers/opengles/opengl_shader/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DUSE_PWR_LDO_SUPPLY -DUSE_HAL_DRIVER -DSTM32H743xx -c -I../Core/Inc -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers/lvgl/src" -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers" -I../Drivers/STM32H7xx_HAL_Driver/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32H7xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers/lvgl" -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers" -O0 -ffunction-sections -fdata-sections -Wall -mno-unaligned-access -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-lvgl-2f-src-2f-drivers-2f-opengles-2f-opengl_shader

clean-Drivers-2f-lvgl-2f-src-2f-drivers-2f-opengles-2f-opengl_shader:
	-$(RM) ./Drivers/lvgl/src/drivers/opengles/opengl_shader/lv_opengl_shader_manager.cyclo ./Drivers/lvgl/src/drivers/opengles/opengl_shader/lv_opengl_shader_manager.d ./Drivers/lvgl/src/drivers/opengles/opengl_shader/lv_opengl_shader_manager.o ./Drivers/lvgl/src/drivers/opengles/opengl_shader/lv_opengl_shader_manager.su ./Drivers/lvgl/src/drivers/opengles/opengl_shader/lv_opengl_shader_program.cyclo ./Drivers/lvgl/src/drivers/opengles/opengl_shader/lv_opengl_shader_program.d ./Drivers/lvgl/src/drivers/opengles/opengl_shader/lv_opengl_shader_program.o ./Drivers/lvgl/src/drivers/opengles/opengl_shader/lv_opengl_shader_program.su

.PHONY: clean-Drivers-2f-lvgl-2f-src-2f-drivers-2f-opengles-2f-opengl_shader

