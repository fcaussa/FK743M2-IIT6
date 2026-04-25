################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/lvgl/src/drivers/wayland/lv_wayland.c \
../Drivers/lvgl/src/drivers/wayland/lv_wayland_smm.c \
../Drivers/lvgl/src/drivers/wayland/lv_wl_cache.c \
../Drivers/lvgl/src/drivers/wayland/lv_wl_dmabuf.c \
../Drivers/lvgl/src/drivers/wayland/lv_wl_keyboard.c \
../Drivers/lvgl/src/drivers/wayland/lv_wl_pointer.c \
../Drivers/lvgl/src/drivers/wayland/lv_wl_pointer_axis.c \
../Drivers/lvgl/src/drivers/wayland/lv_wl_seat.c \
../Drivers/lvgl/src/drivers/wayland/lv_wl_shm.c \
../Drivers/lvgl/src/drivers/wayland/lv_wl_touch.c \
../Drivers/lvgl/src/drivers/wayland/lv_wl_window.c \
../Drivers/lvgl/src/drivers/wayland/lv_wl_window_decorations.c \
../Drivers/lvgl/src/drivers/wayland/lv_wl_xdg_shell.c 

OBJS += \
./Drivers/lvgl/src/drivers/wayland/lv_wayland.o \
./Drivers/lvgl/src/drivers/wayland/lv_wayland_smm.o \
./Drivers/lvgl/src/drivers/wayland/lv_wl_cache.o \
./Drivers/lvgl/src/drivers/wayland/lv_wl_dmabuf.o \
./Drivers/lvgl/src/drivers/wayland/lv_wl_keyboard.o \
./Drivers/lvgl/src/drivers/wayland/lv_wl_pointer.o \
./Drivers/lvgl/src/drivers/wayland/lv_wl_pointer_axis.o \
./Drivers/lvgl/src/drivers/wayland/lv_wl_seat.o \
./Drivers/lvgl/src/drivers/wayland/lv_wl_shm.o \
./Drivers/lvgl/src/drivers/wayland/lv_wl_touch.o \
./Drivers/lvgl/src/drivers/wayland/lv_wl_window.o \
./Drivers/lvgl/src/drivers/wayland/lv_wl_window_decorations.o \
./Drivers/lvgl/src/drivers/wayland/lv_wl_xdg_shell.o 

C_DEPS += \
./Drivers/lvgl/src/drivers/wayland/lv_wayland.d \
./Drivers/lvgl/src/drivers/wayland/lv_wayland_smm.d \
./Drivers/lvgl/src/drivers/wayland/lv_wl_cache.d \
./Drivers/lvgl/src/drivers/wayland/lv_wl_dmabuf.d \
./Drivers/lvgl/src/drivers/wayland/lv_wl_keyboard.d \
./Drivers/lvgl/src/drivers/wayland/lv_wl_pointer.d \
./Drivers/lvgl/src/drivers/wayland/lv_wl_pointer_axis.d \
./Drivers/lvgl/src/drivers/wayland/lv_wl_seat.d \
./Drivers/lvgl/src/drivers/wayland/lv_wl_shm.d \
./Drivers/lvgl/src/drivers/wayland/lv_wl_touch.d \
./Drivers/lvgl/src/drivers/wayland/lv_wl_window.d \
./Drivers/lvgl/src/drivers/wayland/lv_wl_window_decorations.d \
./Drivers/lvgl/src/drivers/wayland/lv_wl_xdg_shell.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/lvgl/src/drivers/wayland/%.o Drivers/lvgl/src/drivers/wayland/%.su Drivers/lvgl/src/drivers/wayland/%.cyclo: ../Drivers/lvgl/src/drivers/wayland/%.c Drivers/lvgl/src/drivers/wayland/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DUSE_PWR_LDO_SUPPLY -DUSE_HAL_DRIVER -DSTM32H743xx -c -I../Core/Inc -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers/touch" -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Core/ui" -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers/lvgl/src" -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers" -I../Drivers/STM32H7xx_HAL_Driver/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32H7xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers/lvgl" -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers" -O0 -ffunction-sections -fdata-sections -Wall -mno-unaligned-access -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-lvgl-2f-src-2f-drivers-2f-wayland

clean-Drivers-2f-lvgl-2f-src-2f-drivers-2f-wayland:
	-$(RM) ./Drivers/lvgl/src/drivers/wayland/lv_wayland.cyclo ./Drivers/lvgl/src/drivers/wayland/lv_wayland.d ./Drivers/lvgl/src/drivers/wayland/lv_wayland.o ./Drivers/lvgl/src/drivers/wayland/lv_wayland.su ./Drivers/lvgl/src/drivers/wayland/lv_wayland_smm.cyclo ./Drivers/lvgl/src/drivers/wayland/lv_wayland_smm.d ./Drivers/lvgl/src/drivers/wayland/lv_wayland_smm.o ./Drivers/lvgl/src/drivers/wayland/lv_wayland_smm.su ./Drivers/lvgl/src/drivers/wayland/lv_wl_cache.cyclo ./Drivers/lvgl/src/drivers/wayland/lv_wl_cache.d ./Drivers/lvgl/src/drivers/wayland/lv_wl_cache.o ./Drivers/lvgl/src/drivers/wayland/lv_wl_cache.su ./Drivers/lvgl/src/drivers/wayland/lv_wl_dmabuf.cyclo ./Drivers/lvgl/src/drivers/wayland/lv_wl_dmabuf.d ./Drivers/lvgl/src/drivers/wayland/lv_wl_dmabuf.o ./Drivers/lvgl/src/drivers/wayland/lv_wl_dmabuf.su ./Drivers/lvgl/src/drivers/wayland/lv_wl_keyboard.cyclo ./Drivers/lvgl/src/drivers/wayland/lv_wl_keyboard.d ./Drivers/lvgl/src/drivers/wayland/lv_wl_keyboard.o ./Drivers/lvgl/src/drivers/wayland/lv_wl_keyboard.su ./Drivers/lvgl/src/drivers/wayland/lv_wl_pointer.cyclo ./Drivers/lvgl/src/drivers/wayland/lv_wl_pointer.d ./Drivers/lvgl/src/drivers/wayland/lv_wl_pointer.o ./Drivers/lvgl/src/drivers/wayland/lv_wl_pointer.su ./Drivers/lvgl/src/drivers/wayland/lv_wl_pointer_axis.cyclo ./Drivers/lvgl/src/drivers/wayland/lv_wl_pointer_axis.d ./Drivers/lvgl/src/drivers/wayland/lv_wl_pointer_axis.o ./Drivers/lvgl/src/drivers/wayland/lv_wl_pointer_axis.su ./Drivers/lvgl/src/drivers/wayland/lv_wl_seat.cyclo ./Drivers/lvgl/src/drivers/wayland/lv_wl_seat.d ./Drivers/lvgl/src/drivers/wayland/lv_wl_seat.o ./Drivers/lvgl/src/drivers/wayland/lv_wl_seat.su ./Drivers/lvgl/src/drivers/wayland/lv_wl_shm.cyclo ./Drivers/lvgl/src/drivers/wayland/lv_wl_shm.d ./Drivers/lvgl/src/drivers/wayland/lv_wl_shm.o ./Drivers/lvgl/src/drivers/wayland/lv_wl_shm.su ./Drivers/lvgl/src/drivers/wayland/lv_wl_touch.cyclo ./Drivers/lvgl/src/drivers/wayland/lv_wl_touch.d ./Drivers/lvgl/src/drivers/wayland/lv_wl_touch.o ./Drivers/lvgl/src/drivers/wayland/lv_wl_touch.su ./Drivers/lvgl/src/drivers/wayland/lv_wl_window.cyclo ./Drivers/lvgl/src/drivers/wayland/lv_wl_window.d ./Drivers/lvgl/src/drivers/wayland/lv_wl_window.o ./Drivers/lvgl/src/drivers/wayland/lv_wl_window.su ./Drivers/lvgl/src/drivers/wayland/lv_wl_window_decorations.cyclo ./Drivers/lvgl/src/drivers/wayland/lv_wl_window_decorations.d ./Drivers/lvgl/src/drivers/wayland/lv_wl_window_decorations.o ./Drivers/lvgl/src/drivers/wayland/lv_wl_window_decorations.su ./Drivers/lvgl/src/drivers/wayland/lv_wl_xdg_shell.cyclo ./Drivers/lvgl/src/drivers/wayland/lv_wl_xdg_shell.d ./Drivers/lvgl/src/drivers/wayland/lv_wl_xdg_shell.o ./Drivers/lvgl/src/drivers/wayland/lv_wl_xdg_shell.su

.PHONY: clean-Drivers-2f-lvgl-2f-src-2f-drivers-2f-wayland

