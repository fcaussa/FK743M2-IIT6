# FK743M2-IIT6 + 7" 800x480 RGB LCD Bring-Up Demo

A minimal **STM32CubeIDE** bring-up project for the **FK743M2-IIT6** development board featuring the **STM32H743IIT6**, external **SDRAM**, and a **7-inch 800x480 RGB LCD**.

This repository is meant to provide a **known-good starting point** for anyone working with this board and display combination. There is very little practical information available online, so having a basic working project can save a significant amount of debugging time.

---

## Overview

This demo validates the complete low-level display path:

- STM32H743IIT6 core bring-up
- FMC + external SDRAM initialization
- LTDC configuration
- RGB LCD output
- PWM backlight control
- basic framebuffer rendering

The project is intentionally simple and focused on **hardware validation** rather than on building a full graphics stack.

---

## Current demo features

This demo currently does the following:

- Blinks the onboard **user LED on PH7** every **500 ms**
- Enables the LCD backlight using **PWM at 2 kHz**
- Draws **vertical color bars** on the display using a framebuffer stored in external SDRAM

If all of this works, you have a reliable baseline for further development such as **LVGL integration**.

---

## Hardware

### Development board
- **FK743M2-IIT6**
- MCU: **STM32H743IIT6**

### External memory
- **W9825G6KH SDRAM**
  - 4M x 4 banks x 16 bits
- **W25Q64JV Quad SPI Flash**

### LCD
- **7-inch TFT LCD**
- Resolution: **800 x 480**
- Parallel **RGB interface** driven by **LTDC**
- Backlight controlled independently by PWM

---

## Why this project exists

Getting first pixels on this platform can be surprisingly time-consuming due to:

- scarce documentation
- different LCD variants sharing similar connectors
- LTDC timing sensitivity
- GPIO speed requirements
- SDRAM and MPU considerations

This project provides a practical, working base to help others get started faster.

---

## Important finding

A key issue during bring-up was that **LTDC GPIO speed must be set correctly**.

Using low-speed GPIO configuration on the LTDC pins caused:

- no visible image
- unstable behavior
- incorrect colors
- display artifacts

Setting the LTDC-related GPIOs to **Very High Speed** was essential for proper LCD operation.

---

## Display setup

### Resolution
- **800 x 480**

### Pixel format
- **RGB565**

### Framebuffer
- Located in **external SDRAM**
- Base address:

#define LCD_FB_ADDR 0xC0000000U
LTDC timings used in this demo

The following timing values worked for this setup:

HSYNC = 10
HBP = 46
HFP = 210
VSYNC = 10
VBP = 33
VFP = 22

Note: even displays with the same resolution and connector style may require different timings depending on the panel.

Why RGB565

An initial ARGB8888 test produced incorrect colors in this setup, while RGB565 worked correctly and reliably.

RGB565 was chosen for this demo because it offers:

simpler bring-up
lower memory usage
stable operation
good compatibility with LVGL
easier debugging during early development

For this specific setup, RGB565 is the most practical baseline.

Clock configuration

This project uses STM32CubeIDE / CubeMX-generated initialization as a base.

Main system clock
External oscillator (HSE) enabled
PLL enabled
SYSCLK sourced from PLL
LTDC clock
LTDC clock generated through PLL3

This configuration is sufficient to:

run the MCU reliably
initialize SDRAM
drive LTDC
generate a stable video signal for the LCD
MPU configuration

The project includes MPU configuration so the external SDRAM region can be safely used as a framebuffer.

Correct MPU setup is important because incorrect memory attributes can lead to:

corrupted display output
unstable rendering
hard-to-debug graphics issues

In this demo, the framebuffer is placed in SDRAM and used by LTDC without requiring a complex graphics stack.

Demo behavior

On startup, the firmware performs the following sequence:

Configures the MPU
Initializes the HAL
Configures the system clock
Initializes GPIO
Initializes FMC and SDRAM
Initializes LTDC
Initializes PWM for the LCD backlight
Draws color bars into the framebuffer
Enables the LCD output
Toggles LED PH7 every 500 ms
Color bar test

The color bar pattern is intentionally simple, but very useful.

It confirms that:

SDRAM is working
LTDC is reading the framebuffer correctly
the LCD is receiving valid timing
color output is correct
the display path is functional end-to-end

If the bars display correctly, the platform is ready for higher-level graphics development.

Software environment
STM32CubeIDE
STM32 HAL drivers
CubeMX-generated project base
Manual framebuffer rendering
LTDC output in RGB565


Main files of interest:

main.c
Main application logic, SDRAM usage, test pattern drawing, LED blink, PWM startup
stm32h7xx_hal_msp.c
LTDC GPIO configuration and peripheral MSP init
.ioc file
CubeMX project configuration
How to build
Open the project in STM32CubeIDE
Make sure all generated files are present
Verify the .ioc configuration matches the intended hardware
Build the project
Flash it to the FK743M2-IIT6
Power the board and LCD properly
Observe:
PH7 LED blinking every 500 ms
LCD backlight enabled
vertical color bars on the screen
How to verify that everything is working

A successful bring-up should show:

the user LED blinking
the LCD backlight on
a stable set of vertical color bars
no obvious flicker or corrupted image

If all of these are present, the low-level display setup is working.

Troubleshooting
No image, but backlight is on

Check:

LTDC GPIO speed
LTDC timing values
SDRAM initialization
LCD connector wiring
framebuffer address
Image appears, but colors are wrong

Check:

pixel format
LCD pin mapping
whether RGB565 or ARGB8888 is actually being used
LTDC layer configuration
Image has artifacts or stripes

Check:

GPIO speed on LTDC pins
signal integrity
LCD timings
SDRAM stability
LED works but LCD stays blank

Check:

LTDC initialization
framebuffer contents
SDRAM init sequence
LCD power and backlight wiring
pixel clock settings
Known working points in this demo

This project confirms that the following are working on this setup:

PH7 LED toggle
PWM backlight at 2 kHz
LTDC output
SDRAM framebuffer
RGB565 rendering
vertical color bar display
Next step

The next planned step for this project is LVGL integration, using:

RGB565
LTDC
framebuffer in SDRAM
partial draw buffer
flush callback approach

Since the low-level display path is already working, this project provides a solid base for that next step.

Who this project may help

This repository is useful for anyone working with:

FK743M2-IIT6
STM32H743
external SDRAM
LTDC
800x480 RGB LCDs
LVGL bring-up

If you are trying to get the first stable image on this platform, this project should help reduce the amount of trial and error.

Suggested future improvements

Possible next additions to this repository:

LVGL integration
touch controller support
DMA2D acceleration
simple drawing primitives
SDRAM test utilities
display test patterns
screenshots and wiring notes
Contributing

Feel free to use this project as a base, adapt it to your own hardware, and improve it.

If you find additional working configurations, timing values, or LCD variants, contributions are welcome.

License

This project is shared as a practical reference for the community.

Use it, modify it, and improve it as needed.
