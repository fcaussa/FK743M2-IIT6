# FK743M2-IIT6 + 7" RGB LCD Bring-Up Demo

A minimal **STM32CubeIDE** bring-up project for the **FK743M2-IIT6** development board featuring the **STM32H743IIT6**, external **SDRAM**, and a **7-inch 800x480 RGB LCD**.

This repository provides a **known-good starting point** for this specific board/display combination. Because documentation is scarce, this project aims to save developers significant debugging time by providing a validated hardware configuration.

---

## 🚀 Overview

This demo validates the complete low-level display path:
* Core: STM32H743IIT6 initialization.
* Memory: FMC + External SDRAM setup.
* Display: LTDC configuration & RGB LCD output.
* Control: PWM backlight and GPIO signal integrity.
* Rendering: Basic framebuffer validation (Color Bars).

---

## 🛠 Hardware Specifications

| Component | Detail |
| :--- | :--- |
| MCU | STM32H743IIT6 (High-Performance ARM Cortex-M7) |
| Board | FK743M2-IIT6 |
| SDRAM | W9825G6KH (32MB: 4M x 4 banks x 16 bits) |
| QSPI Flash | W25Q64JV (8MB) |
| LCD Panel | 7-inch TFT LCD (800x480) |
| Interface | 24-bit Parallel RGB via LTDC |

---

## ⚡ Key Findings & Critical Settings

### 1. GPIO Speed Requirement
**LTDC GPIO speed must be set to "Very High Speed".**
Using "Low" or "Medium" speeds results in no image, unstable colors, or significant artifacts due to the high pixel clock frequency.

### 2. Why RGB565?
While the hardware supports ARGB8888, **RGB565** was chosen for this demo because it offers lower bandwidth requirements, uses 50% less memory, and provides better stability during early bring-up.

---

## 📺 Display Configuration

### Timings
The following values are optimized for the 800x480 panel:

| Parameter | Value | Parameter | Value |
| :--- | :--- | :--- | :--- |
| HSYNC | 10 | VSYNC | 10 |
| HBP | 46 | VBP | 33 |
| HFP | 210 | VFP | 22 |

### Framebuffer Mapping
The framebuffer is mapped to the beginning of the external SDRAM bank.

Address: 0xC0000000 (SDRAM Bank 1)

---

## 🏃 Demo Behavior

Upon startup, the firmware performs the following sequence:
1. **MPU Configuration:** Sets memory attributes for SDRAM to ensure cache coherency.
2. **Peripherals:** Initializes HAL, System Clock (via HSE), FMC, and LTDC.
3. **Backlight:** Starts PWM at 2 kHz to enable the display backlight.
4. **Graphics:** Fills the SDRAM framebuffer with a Vertical Color Bar pattern.
5. **Heartbeat:** Toggles the onboard User LED (PH7) every 500ms.

---

## 📁 Project Structure

* `main.c`: Application logic and test pattern drawing.
* `stm32h7xx_hal_msp.c`: Low-level LTDC GPIO and clock initialization.
* `*.ioc`: STM32CubeMX configuration file.

---

## 🛠 How to Build & Verify

1. Open the project in **STM32CubeIDE**.
2. Build the project.
3. Flash the binary to the FK743M2 board.
4. **Observe:** PH7 LED blinking and stable color bars on the LCD.

---

## 🔍 Troubleshooting

| Issue | Potential Cause |
| :--- | :--- |
| Blank Screen | Check LTDC GPIO Speeds or Timing values. |
| Wrong Colors | Verify Pixel Format (RGB565) and Pin Mapping. |
| Artifacts | Check SDRAM initialization or MPU settings. |
| No Backlight | Check PWM signal on the backlight enable pin. |

---

## 🛣 Next Steps
- [ ] LVGL Integration
- [ ] Touch Support
- [ ] DMA2D Acceleration

---

## 📄 License
This project is shared as a practical reference for the community. Use, modify, and improve it as needed.
