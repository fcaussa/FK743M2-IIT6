################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/lvgl/src/drivers/display/drm/lv_linux_drm.c \
../Drivers/lvgl/src/drivers/display/drm/lv_linux_drm_common.c \
../Drivers/lvgl/src/drivers/display/drm/lv_linux_drm_egl.c 

OBJS += \
./Drivers/lvgl/src/drivers/display/drm/lv_linux_drm.o \
./Drivers/lvgl/src/drivers/display/drm/lv_linux_drm_common.o \
./Drivers/lvgl/src/drivers/display/drm/lv_linux_drm_egl.o 

C_DEPS += \
./Drivers/lvgl/src/drivers/display/drm/lv_linux_drm.d \
./Drivers/lvgl/src/drivers/display/drm/lv_linux_drm_common.d \
./Drivers/lvgl/src/drivers/display/drm/lv_linux_drm_egl.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/lvgl/src/drivers/display/drm/%.o Drivers/lvgl/src/drivers/display/drm/%.su Drivers/lvgl/src/drivers/display/drm/%.cyclo: ../Drivers/lvgl/src/drivers/display/drm/%.c Drivers/lvgl/src/drivers/display/drm/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DUSE_PWR_LDO_SUPPLY -DUSE_HAL_DRIVER -DSTM32H743xx -c -I../Core/Inc -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers/lvgl/src" -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers" -I../Drivers/STM32H7xx_HAL_Driver/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32H7xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers/lvgl" -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers" -O0 -ffunction-sections -fdata-sections -Wall -mno-unaligned-access -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-lvgl-2f-src-2f-drivers-2f-display-2f-drm

clean-Drivers-2f-lvgl-2f-src-2f-drivers-2f-display-2f-drm:
	-$(RM) ./Drivers/lvgl/src/drivers/display/drm/lv_linux_drm.cyclo ./Drivers/lvgl/src/drivers/display/drm/lv_linux_drm.d ./Drivers/lvgl/src/drivers/display/drm/lv_linux_drm.o ./Drivers/lvgl/src/drivers/display/drm/lv_linux_drm.su ./Drivers/lvgl/src/drivers/display/drm/lv_linux_drm_common.cyclo ./Drivers/lvgl/src/drivers/display/drm/lv_linux_drm_common.d ./Drivers/lvgl/src/drivers/display/drm/lv_linux_drm_common.o ./Drivers/lvgl/src/drivers/display/drm/lv_linux_drm_common.su ./Drivers/lvgl/src/drivers/display/drm/lv_linux_drm_egl.cyclo ./Drivers/lvgl/src/drivers/display/drm/lv_linux_drm_egl.d ./Drivers/lvgl/src/drivers/display/drm/lv_linux_drm_egl.o ./Drivers/lvgl/src/drivers/display/drm/lv_linux_drm_egl.su

.PHONY: clean-Drivers-2f-lvgl-2f-src-2f-drivers-2f-display-2f-drm

