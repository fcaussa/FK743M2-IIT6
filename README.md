# FK743M2-IIT6 + LVGL 9.4 Integration Notes

## Hardware
| Component | Detail |
|---|---|
| MCU | STM32H743IIT6 @ 480MHz |
| Board | FK743M2-IIT6 (反客科技) |
| Display | 800x480 RGB LCD (MY-RGB 40-pin) |
| Touch IC | Goodix GT911 (bit-banged I2C) |
| SDRAM | W9825G6 (32MB @ 0xC0000000) |
| Flash | 2MB internal |
| SD Card | microSD via SDMMC1 |

---

## Critical Fixes & Lessons Learned

### 1. `-mno-unaligned-access` Compiler Flag — MANDATORY

**Problem:** LVGL 9.x changed `lv_color_t` to a **3-byte struct** (RGB888 internally)
regardless of `LV_COLOR_DEPTH`. With `LV_COLOR_DEPTH 16`, the struct is still
3 bytes. When the compiler emits `strh` (store halfword) instructions to
3-byte-aligned struct fields, Cortex-M7 raises a HardFault (UNDEFINSTR).

**Symptom:** HardFault immediately on `lv_display_create()` inside
`lv_theme_default_init()` at a `strh` instruction.

**Fix:** Add to compiler flags in STM32CubeIDE:
```
Project → Properties → C/C++ Build → Settings
→ MCU GCC Compiler → Miscellaneous → Other flags
→ Add: -mno-unaligned-access
```

This forces GCC to use byte-by-byte stores for unaligned fields,
eliminating the fault. Slightly slower but functionally correct.

---

### 2. Stack Must Be in Cacheable RAM Region

**Problem:** `_estack` defaulting to `ORIGIN(RAM_D1) + LENGTH(RAM_D1)` places
the stack at `0x2407FFFF` — inside the non-cacheable LVGL buffer region
(`0x24060000–0x2407FFFF`). On Cortex-M7, non-cacheable stack writes cause
speculative prefetch to read stale LR values → `lr = 0x0` → UNDEFINSTR HardFault.

**Symptom:** `lr = 0x0` on every HardFault, crash inside LVGL functions.

**Fix:** In `STM32H743IITX_FLASH.ld`:
```ld
/* WRONG — puts stack in non-cacheable region */
_estack = ORIGIN(RAM_D1) + LENGTH(RAM_D1);

/* CORRECT — stack stays in cacheable region */
_estack = 0x24060000;
```

---

### 3. MPU Configuration

AXI SRAM (RAM_D1, 512KB) is split into two zones via MPU:

| Address Range | Size | Cache | Purpose |
|---|---|---|---|
| `0x24000000–0x2405FFFF` | 384KB | Cacheable (WT) | .data, .bss, LVGL heap, stack |
| `0x24060000–0x2407FFFF` | 128KB | NON-cacheable | LVGL render buffers |

The split is achieved using `SubRegionDisable = 0xC0` on the 512KB cacheable
region (disables top 2 sub-regions of 64KB each), with a higher-priority
non-cacheable region covering `0x24060000`.

**SDRAM framebuffer must be NON-cacheable** — LTDC reads directly via AHB
and would see stale cached data otherwise.

**Peripherals must use Device memory** (TEX=0, S=1, B=1) — not Normal memory.

---

### 4. LVGL Render Buffers at Fixed Addresses

LVGL render buffers must be in the non-cacheable MPU region.
Using linker section attributes (`__attribute__((section(".lvgl_buf")))`)
caused heap/buffer collisions. The reliable solution is fixed absolute pointers:

```c
#define LVGL_BUF_1_ADDR  0x24060000UL
#define LVGL_BUF_2_ADDR  0x24070000UL

uint8_t *buf1 = (uint8_t *)LVGL_BUF_1_ADDR;
uint8_t *buf2 = (uint8_t *)LVGL_BUF_2_ADDR;
```

---

### 5. LVGL Heap Size

With `LV_MEM_ADR 0`, LVGL heap lives in `.bss` in RAM_D1.
`_ebss ≈ 0x24020B10` leaves ~253KB before the non-cacheable region.

```c
#define LV_MEM_SIZE (256U * 1024U)   /* safe maximum — do not exceed */
```

Going above 256KB causes the heap to spill into the non-cacheable region,
corrupting LVGL internal state and causing HardFaults.

---

### 6. Do NOT Call `lv_theme_default_init()` Manually

`lv_display_create()` calls `lv_theme_default_init()` internally.
Calling it again from EEZ-generated `screens.c` or `ui.c` causes
double-initialization, heap corruption and HardFault.

**Fix:** Delete these lines from EEZ-generated `create_screens()`:
```c
// DELETE these — lv_display_create() already handles theme init
lv_display_t *dispp = lv_display_get_default();
lv_theme_t *theme = lv_theme_default_init(dispp, ...);
lv_display_set_theme(dispp, theme);
```

---

### 7. LTDC GPIO Speed Must Be VERY HIGH

CubeMX regeneration resets LTDC GPIO pins from `GPIO_SPEED_FREQ_VERY_HIGH`
to `GPIO_SPEED_FREQ_LOW`. At 32MHz pixel clock, low-speed GPIO cannot
switch fast enough — the display goes blank.

**After every CubeMX regeneration**, restore `stm32h7xx_hal_msp.c` from
backup, or manually set all LTDC pins back to `GPIO_SPEED_FREQ_VERY_HIGH`.

---

### 8. GT911 Touch Controller (Bit-Banged I2C)

Touch pins are NOT connected to hardware I2C on this board:

| Signal | Pin | Direction |
|---|---|---|
| TOUCH_SDA | PI8 | Bit-bang I2C |
| TOUCH_SCLK | PI11 | Bit-bang I2C |
| TOUCH_RST | PH4 | Output |
| TOUCH_INT | PG3 | Input |

I2C address is selected by INT pin state during reset:
- INT low during reset → address `0x5D`
- INT high during reset → address `0x14`

This board uses `0x5D`.

---

### 9. SD Card / FatFS

- Format: **FAT32** (use guiformat.exe for cards >32GB on Windows)
- `MX_SDMMC1_SD_Init()` must be called **before** `MX_FATFS_Init()`
- Start with `ClockDiv = 16`, 1-bit bus for bring-up; increase speed after stable
- `MX_FATFS_Init()` mounts internally — call `f_mount()` with
  `f_mount(NULL, SDPath, 0)` first to unmount, then remount cleanly
- LVGL filesystem driver letter: `'S'` → use `"S:/image.bin"` in image paths

---

### 10. LVGL Binary Image Format (v9)

The LVGL v9 online converter only outputs C arrays.
For SD card binary files, the v9 header format is:

```
Offset 0:  uint8_t  magic  = 0x19
Offset 1:  uint8_t  cf     = 4 (RGB565)
Offset 2:  uint16_t flags  = 0
Offset 4:  uint16_t width
Offset 6:  uint16_t height
Offset 8:  uint16_t stride = width * 2
Offset 10: uint16_t reserved = 0
Offset 12: pixel data (RGB565, little-endian)
```

Use the Python LVGL image converter for correct v9 binary output:
```bash
pip install lvgl-image-converter
lv_img_conv image.png -f RGB565 -o binary --lvgl-v9
```

---

### 11. CubeMX Regeneration Checklist

Every time CubeMX regenerates code, check and restore:

| File | What gets reset | Fix |
|---|---|---|
| `STM32H743IITX_FLASH.ld` | `_estack` reset to end of RAM_D1 | Restore `_estack = 0x24060000` |
| `stm32h7xx_hal_msp.c` | LTDC GPIO speed reset to LOW | Restore from backup |
| `main.c` | All custom code outside USER CODE blocks | Restore from backup |

**Always backup before regenerating.**

---

## Memory Map Summary

```
0x08000000  2MB    FLASH        Code, rodata, vectors (cacheable, executable)
0x20000000  128KB  DTCMRAM      Available (non-cacheable, tightly coupled)
0x24000000  384KB  RAM_D1 code  .data, .bss, LVGL heap, stack (cacheable)
0x24060000  64KB   LVGL buf 1   Render buffer 1 (NON-cacheable)
0x24070000  64KB   LVGL buf 2   Render buffer 2 (NON-cacheable)
0x30000000  288KB  RAM_D2       General purpose (cacheable)
0x38000000  64KB   RAM_D3       General purpose (cacheable)
0x40000000  512MB  Peripherals  Device memory (shareable, bufferable)
0xC0000000  32MB   SDRAM        LTDC framebuffer (NON-cacheable)
```

---

## Build Flags

```
-mcpu=cortex-m7
-mfpu=fpv5-d16
-mfloat-abi=hard
-mno-unaligned-access    ← CRITICAL for LVGL 9.x
-mthumb
```

---

## Software Versions

| Software | Version |
|---|---|
| STM32CubeIDE | 2.1.1 |
| STM32CubeH7 FW | V1.13.0 |
| LVGL | 9.4.0 |
| EEZ Studio | Latest |
| GCC ARM | 12.3 (arm-none-eabi) |
