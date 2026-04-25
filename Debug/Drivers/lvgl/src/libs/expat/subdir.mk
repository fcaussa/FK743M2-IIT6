################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/lvgl/src/libs/expat/xmlparse.c \
../Drivers/lvgl/src/libs/expat/xmlrole.c \
../Drivers/lvgl/src/libs/expat/xmltok.c \
../Drivers/lvgl/src/libs/expat/xmltok_impl.c \
../Drivers/lvgl/src/libs/expat/xmltok_ns.c 

OBJS += \
./Drivers/lvgl/src/libs/expat/xmlparse.o \
./Drivers/lvgl/src/libs/expat/xmlrole.o \
./Drivers/lvgl/src/libs/expat/xmltok.o \
./Drivers/lvgl/src/libs/expat/xmltok_impl.o \
./Drivers/lvgl/src/libs/expat/xmltok_ns.o 

C_DEPS += \
./Drivers/lvgl/src/libs/expat/xmlparse.d \
./Drivers/lvgl/src/libs/expat/xmlrole.d \
./Drivers/lvgl/src/libs/expat/xmltok.d \
./Drivers/lvgl/src/libs/expat/xmltok_impl.d \
./Drivers/lvgl/src/libs/expat/xmltok_ns.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/lvgl/src/libs/expat/%.o Drivers/lvgl/src/libs/expat/%.su Drivers/lvgl/src/libs/expat/%.cyclo: ../Drivers/lvgl/src/libs/expat/%.c Drivers/lvgl/src/libs/expat/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DUSE_PWR_LDO_SUPPLY -DUSE_HAL_DRIVER -DSTM32H743xx -c -I../Core/Inc -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers/touch" -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Core/ui" -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers/lvgl/src" -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers" -I../Drivers/STM32H7xx_HAL_Driver/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32H7xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers/lvgl" -I"C:/Users/franc/Documents/GitHub/FK743M2-IIT6/Drivers" -O0 -ffunction-sections -fdata-sections -Wall -mno-unaligned-access -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-lvgl-2f-src-2f-libs-2f-expat

clean-Drivers-2f-lvgl-2f-src-2f-libs-2f-expat:
	-$(RM) ./Drivers/lvgl/src/libs/expat/xmlparse.cyclo ./Drivers/lvgl/src/libs/expat/xmlparse.d ./Drivers/lvgl/src/libs/expat/xmlparse.o ./Drivers/lvgl/src/libs/expat/xmlparse.su ./Drivers/lvgl/src/libs/expat/xmlrole.cyclo ./Drivers/lvgl/src/libs/expat/xmlrole.d ./Drivers/lvgl/src/libs/expat/xmlrole.o ./Drivers/lvgl/src/libs/expat/xmlrole.su ./Drivers/lvgl/src/libs/expat/xmltok.cyclo ./Drivers/lvgl/src/libs/expat/xmltok.d ./Drivers/lvgl/src/libs/expat/xmltok.o ./Drivers/lvgl/src/libs/expat/xmltok.su ./Drivers/lvgl/src/libs/expat/xmltok_impl.cyclo ./Drivers/lvgl/src/libs/expat/xmltok_impl.d ./Drivers/lvgl/src/libs/expat/xmltok_impl.o ./Drivers/lvgl/src/libs/expat/xmltok_impl.su ./Drivers/lvgl/src/libs/expat/xmltok_ns.cyclo ./Drivers/lvgl/src/libs/expat/xmltok_ns.d ./Drivers/lvgl/src/libs/expat/xmltok_ns.o ./Drivers/lvgl/src/libs/expat/xmltok_ns.su

.PHONY: clean-Drivers-2f-lvgl-2f-src-2f-libs-2f-expat

