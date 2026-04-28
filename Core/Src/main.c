/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file           : main.c
  * @brief          : Main program body — STM32H743 + LVGL 9.x + LTDC/SDRAM
  ******************************************************************************
  * @attention
  *
  * Copyright (c) 2026 STMicroelectronics.
  * All rights reserved.
  *
  * This software is licensed under terms that can be found in the LICENSE file
  * in the root directory of this software component.
  * If no LICENSE file comes with this software, it is provided AS-IS.
  *
  ******************************************************************************
  */
/* USER CODE END Header */

/* Includes ------------------------------------------------------------------*/
#include <lv_fatfs/lv_fs_fatfs.h>    /* LVGL FatFS filesystem driver */
#include "main.h"
#include "fatfs.h"          /* CubeMX FATFS — must stay outside USER CODE */

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */
#include "lvgl.h"
#include "ui.h"             /* EEZ generated */
#include "actions.h"        /* EEZ UI Actions */
#include "gt911.h"          /* Touch Driver */
#include <stdint.h>
#include <string.h>
/* USER CODE END Includes */

/* Private typedef -----------------------------------------------------------*/
/* USER CODE BEGIN PTD */
/* USER CODE END PTD */

/* Private define ------------------------------------------------------------*/
/* USER CODE BEGIN PD */

#define LCD_HOR_RES         800
#define LCD_VER_RES         480
#define LCD_FB_ADDR         0xC0000000U

#define LVGL_BUF_LINES      40
#define BYTES_PER_PIXEL     2
#define LVGL_BUF_SIZE       (LCD_HOR_RES * LVGL_BUF_LINES * BYTES_PER_PIXEL)

#define LVGL_BUF_1_ADDR     0x24060000UL
#define LVGL_BUF_2_ADDR     0x24070000UL

#define QSPI_FLASH_ADDR         0x90000000U
#define QSPI_PAGE_SIZE          256
#define QSPI_SECTOR_SIZE        4096
#define QSPI_MAGIC              0xDEADBEEF
#define QSPI_MAGIC_ADDR         0x00000000U  /* first 4 bytes = magic number */
#define QSPI_IMAGE_ADDR         0x00001000U  /* image starts at sector 1 (4KB offset) */


/* USER CODE END PD */

/* Private macro -------------------------------------------------------------*/
/* USER CODE BEGIN PM */
/* USER CODE END PM */

/* Private variables ---------------------------------------------------------*/
I2C_HandleTypeDef hi2c1;
LTDC_HandleTypeDef hltdc;
QSPI_HandleTypeDef hqspi;
SD_HandleTypeDef hsd1;
TIM_HandleTypeDef htim12;
UART_HandleTypeDef huart1;
PCD_HandleTypeDef hpcd_USB_OTG_FS;
SDRAM_HandleTypeDef hsdram1;
DMA2D_HandleTypeDef hdma2d;   /* add to private variables */
/* USER CODE BEGIN PV */
uint8_t sd_present = 0;
/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/
void SystemClock_Config(void);
static void MPU_Config(void);
static void MX_GPIO_Init(void);
static void MX_FMC_Init(void);
static void MX_LTDC_Init(void);
static void MX_QUADSPI_Init(void);
static void MX_SDMMC1_SD_Init(void);
static void MX_TIM12_Init(void);
static void MX_USART1_UART_Init(void);
static void MX_USB_OTG_FS_PCD_Init(void);
static void MX_I2C1_Init(void);
static void MX_DMA2D_Init(void);
/* USER CODE BEGIN PFP */
static void SDRAM_Initialization_Sequence(SDRAM_HandleTypeDef *hsdram);
static void lvgl_initialization(void);
static void flush_cb(lv_display_t *disp, const lv_area_t *area, uint8_t *px_map);
/* USER CODE END PFP */

/* USER CODE BEGIN 0 */

static void SDRAM_Initialization_Sequence(SDRAM_HandleTypeDef *hsdram)
{
    FMC_SDRAM_CommandTypeDef cmd = {0};
    uint32_t mode = 0;

    HAL_Delay(1);
    cmd.CommandMode = FMC_SDRAM_CMD_CLK_ENABLE;
    cmd.CommandTarget = FMC_SDRAM_CMD_TARGET_BANK1;
    cmd.AutoRefreshNumber = 1;
    cmd.ModeRegisterDefinition = 0;
    HAL_SDRAM_SendCommand(hsdram, &cmd, HAL_MAX_DELAY);

    HAL_Delay(1);
    cmd.CommandMode = FMC_SDRAM_CMD_PALL;
    cmd.CommandTarget = FMC_SDRAM_CMD_TARGET_BANK1;
    cmd.AutoRefreshNumber = 1;
    cmd.ModeRegisterDefinition = 0;
    HAL_SDRAM_SendCommand(hsdram, &cmd, HAL_MAX_DELAY);

    cmd.CommandMode = FMC_SDRAM_CMD_AUTOREFRESH_MODE;
    cmd.CommandTarget = FMC_SDRAM_CMD_TARGET_BANK1;
    cmd.AutoRefreshNumber = 8;
    cmd.ModeRegisterDefinition = 0;
    HAL_SDRAM_SendCommand(hsdram, &cmd, HAL_MAX_DELAY);

    mode = (0x0 << 0) | (0x0 << 3) | (0x2 << 4) | (0x0 << 7) | (0x1 << 9);
    cmd.CommandMode = FMC_SDRAM_CMD_LOAD_MODE;
    cmd.CommandTarget = FMC_SDRAM_CMD_TARGET_BANK1;
    cmd.AutoRefreshNumber = 1;
    cmd.ModeRegisterDefinition = mode;
    HAL_SDRAM_SendCommand(hsdram, &cmd, HAL_MAX_DELAY);

    HAL_SDRAM_ProgramRefreshRate(hsdram, 761);
}

static void QSPI_WaitBusy(void)
{
    QSPI_CommandTypeDef cmd = {0};
    uint8_t status = 0;
    cmd.InstructionMode = QSPI_INSTRUCTION_1_LINE;
    cmd.Instruction     = 0x05;  /* Read Status Register */
    cmd.DataMode        = QSPI_DATA_1_LINE;
    cmd.NbData          = 1;
    cmd.DdrMode         = QSPI_DDR_MODE_DISABLE;
    cmd.DdrHoldHalfCycle= QSPI_DDR_HHC_ANALOG_DELAY;
    cmd.SIOOMode        = QSPI_SIOO_INST_EVERY_CMD;
    do {
        HAL_QSPI_Command(&hqspi, &cmd, HAL_MAX_DELAY);
        HAL_QSPI_Receive(&hqspi, &status, HAL_MAX_DELAY);
    } while (status & 0x01);  /* WIP bit */
}

static void QSPI_WriteEnable(void)
{
    QSPI_CommandTypeDef cmd = {0};
    cmd.InstructionMode = QSPI_INSTRUCTION_1_LINE;
    cmd.Instruction     = 0x06;  /* Write Enable */
    cmd.DataMode        = QSPI_DATA_NONE;
    cmd.DdrMode         = QSPI_DDR_MODE_DISABLE;
    cmd.DdrHoldHalfCycle= QSPI_DDR_HHC_ANALOG_DELAY;
    cmd.SIOOMode        = QSPI_SIOO_INST_EVERY_CMD;
    HAL_QSPI_Command(&hqspi, &cmd, HAL_MAX_DELAY);
}

static void QSPI_EraseSector(uint32_t addr)
{
    QSPI_CommandTypeDef cmd = {0};
    QSPI_WriteEnable();
    cmd.InstructionMode = QSPI_INSTRUCTION_1_LINE;
    cmd.Instruction     = 0x20;  /* Sector Erase 4KB */
    cmd.AddressMode     = QSPI_ADDRESS_1_LINE;
    cmd.AddressSize     = QSPI_ADDRESS_24_BITS;
    cmd.Address         = addr;
    cmd.DataMode        = QSPI_DATA_NONE;
    cmd.DdrMode         = QSPI_DDR_MODE_DISABLE;
    cmd.DdrHoldHalfCycle= QSPI_DDR_HHC_ANALOG_DELAY;
    cmd.SIOOMode        = QSPI_SIOO_INST_EVERY_CMD;
    HAL_QSPI_Command(&hqspi, &cmd, HAL_MAX_DELAY);
    QSPI_WaitBusy();
}

static void QSPI_WritePage(uint32_t addr, uint8_t *data, uint32_t size)
{
    QSPI_CommandTypeDef cmd = {0};
    QSPI_WriteEnable();
    cmd.InstructionMode = QSPI_INSTRUCTION_1_LINE;
    cmd.Instruction     = 0x02;  /* Page Program */
    cmd.AddressMode     = QSPI_ADDRESS_1_LINE;
    cmd.AddressSize     = QSPI_ADDRESS_24_BITS;
    cmd.Address         = addr;
    cmd.DataMode        = QSPI_DATA_1_LINE;
    cmd.NbData          = size;
    cmd.DdrMode         = QSPI_DDR_MODE_DISABLE;
    cmd.DdrHoldHalfCycle= QSPI_DDR_HHC_ANALOG_DELAY;
    cmd.SIOOMode        = QSPI_SIOO_INST_EVERY_CMD;
    HAL_QSPI_Command(&hqspi, &cmd, HAL_MAX_DELAY);
    HAL_QSPI_Transmit(&hqspi, data, HAL_MAX_DELAY);
    QSPI_WaitBusy();
}

static void QSPI_ReadData(uint32_t addr, uint8_t *buf, uint32_t size)
{
    QSPI_CommandTypeDef cmd = {0};
    cmd.InstructionMode = QSPI_INSTRUCTION_1_LINE;
    cmd.Instruction     = 0x03;  /* Read Data */
    cmd.AddressMode     = QSPI_ADDRESS_1_LINE;
    cmd.AddressSize     = QSPI_ADDRESS_24_BITS;
    cmd.Address         = addr;
    cmd.DataMode        = QSPI_DATA_1_LINE;
    cmd.NbData          = size;
    cmd.DdrMode         = QSPI_DDR_MODE_DISABLE;
    cmd.DdrHoldHalfCycle= QSPI_DDR_HHC_ANALOG_DELAY;
    cmd.SIOOMode        = QSPI_SIOO_INST_EVERY_CMD;
    HAL_QSPI_Command(&hqspi, &cmd, HAL_MAX_DELAY);
    HAL_QSPI_Receive(&hqspi, buf, HAL_MAX_DELAY);
}

static void QSPI_EnableMemoryMapped(void)
{
    QSPI_CommandTypeDef      cmd = {0};
    QSPI_MemoryMappedTypeDef cfg = {0};
    cmd.InstructionMode    = QSPI_INSTRUCTION_1_LINE;
    cmd.Instruction        = 0xEB;  /* Fast Read Quad I/O */
    cmd.AddressMode        = QSPI_ADDRESS_4_LINES;
    cmd.AddressSize        = QSPI_ADDRESS_24_BITS;
    cmd.AlternateByteMode  = QSPI_ALTERNATE_BYTES_4_LINES;
    cmd.AlternateBytesSize = QSPI_ALTERNATE_BYTES_8_BITS;
    cmd.AlternateBytes     = 0xF0;
    cmd.DataMode           = QSPI_DATA_4_LINES;
    cmd.DummyCycles        = 4;
    cmd.DdrMode            = QSPI_DDR_MODE_DISABLE;
    cmd.DdrHoldHalfCycle   = QSPI_DDR_HHC_ANALOG_DELAY;
    cmd.SIOOMode           = QSPI_SIOO_INST_EVERY_CMD;
    cfg.TimeOutActivation  = QSPI_TIMEOUT_COUNTER_DISABLE;
    if (HAL_QSPI_MemoryMapped(&hqspi, &cmd, &cfg) != HAL_OK) Error_Handler();
}

static void QSPI_ProgramSplashFromSD(void)
{
    uint8_t page_buf[QSPI_PAGE_SIZE];
    UINT br;
    uint32_t file_size = 768012;
    uint32_t addr = QSPI_IMAGE_ADDR;  /* start at sector 1 */
    uint32_t sectors_needed = (file_size + QSPI_SECTOR_SIZE - 1) / QSPI_SECTOR_SIZE;

    FIL fil;
    if (f_open(&fil, "0:/splash.bin", FA_READ) != FR_OK) return;

    /* Erase magic sector first */
    QSPI_EraseSector(0x00000000);

    /* Erase image sectors */
    for (uint32_t s = 0; s < sectors_needed; s++) {
        QSPI_EraseSector(QSPI_IMAGE_ADDR + s * QSPI_SECTOR_SIZE);
    }

    /* Program image page by page */
    while (addr < QSPI_IMAGE_ADDR + file_size) {
        uint32_t chunk = (QSPI_IMAGE_ADDR + file_size - addr) > QSPI_PAGE_SIZE ?
                          QSPI_PAGE_SIZE : (QSPI_IMAGE_ADDR + file_size - addr);
        f_read(&fil, page_buf, chunk, &br);
        if (br == 0) break;
        QSPI_WritePage(addr, page_buf, br);
        addr += br;
    }
    f_close(&fil);

    /* Write magic to mark flash as programmed */
    uint32_t magic = QSPI_MAGIC;
    QSPI_WritePage(QSPI_MAGIC_ADDR, (uint8_t *)&magic, 4);
}



/* Read JEDEC ID — should return 0xEF4017 for W25Q64JV */
static uint32_t QSPI_ReadID(void)
{
    QSPI_CommandTypeDef cmd = {0};
    uint8_t id[3] = {0};

    cmd.InstructionMode   = QSPI_INSTRUCTION_1_LINE;
    cmd.Instruction       = 0x9F;  /* JEDEC ID */
    cmd.AddressMode       = QSPI_ADDRESS_NONE;
    cmd.AlternateByteMode = QSPI_ALTERNATE_BYTES_NONE;
    cmd.DataMode          = QSPI_DATA_1_LINE;
    cmd.DummyCycles       = 0;
    cmd.NbData            = 3;
    cmd.DdrMode           = QSPI_DDR_MODE_DISABLE;
    cmd.DdrHoldHalfCycle  = QSPI_DDR_HHC_ANALOG_DELAY;
    cmd.SIOOMode          = QSPI_SIOO_INST_EVERY_CMD;

    if (HAL_QSPI_Command(&hqspi, &cmd, HAL_MAX_DELAY) != HAL_OK) return 0;
    if (HAL_QSPI_Receive(&hqspi, id, HAL_MAX_DELAY) != HAL_OK) return 0;

    return ((uint32_t)id[0] << 16) | ((uint32_t)id[1] << 8) | id[2];
}


static void flush_cb(lv_display_t *disp, const lv_area_t *area, uint8_t *px_map)
{
    int32_t w = area->x2 - area->x1 + 1;
    int32_t h = area->y2 - area->y1 + 1;

    uint32_t dst = LCD_FB_ADDR
                 + ((uint32_t)area->y1 * LCD_HOR_RES + (uint32_t)area->x1)
                   * sizeof(uint16_t);

    hdma2d.Init.OutputOffset       = LCD_HOR_RES - w;
    hdma2d.LayerCfg[1].InputOffset = 0;
    hdma2d.LayerCfg[1].RedBlueSwap = DMA2D_RB_REGULAR;

    HAL_DMA2D_Init(&hdma2d);
    HAL_DMA2D_ConfigLayer(&hdma2d, 1);

    HAL_DMA2D_Start(&hdma2d, (uint32_t)px_map, dst, (uint32_t)w, (uint32_t)h);
    HAL_DMA2D_PollForTransfer(&hdma2d, HAL_MAX_DELAY);

    /* HAL flag clears early — wait for true hardware completion */
    while (DMA2D->CR & DMA2D_CR_START);
    __DSB();

    lv_display_flush_ready(disp);
}


static void lvgl_initialization(void)
{
    lv_init();
    lv_tick_set_cb(HAL_GetTick);
    uint8_t *buf1 = (uint8_t *)LVGL_BUF_1_ADDR;
    uint8_t *buf2 = (uint8_t *)LVGL_BUF_2_ADDR;  /* restore second buffer */
    lv_display_t *disp = lv_display_create(LCD_HOR_RES, LCD_VER_RES);
    if (disp == NULL) return;
    lv_display_set_buffers(disp, buf1, buf2, LVGL_BUF_SIZE, LV_DISPLAY_RENDER_MODE_PARTIAL);
    lv_display_set_flush_cb(disp, flush_cb);
}

/* USER CODE END 0 */

int main(void)
{
    /* USER CODE BEGIN 1 */
    /* USER CODE END 1 */

    MPU_Config();
    HAL_Init();

    /* USER CODE BEGIN Init */
    /* USER CODE END Init */

    SystemClock_Config();

    /* USER CODE BEGIN SysInit */
    /* USER CODE END SysInit */

    MX_GPIO_Init();
    MX_FMC_Init();
    MX_LTDC_Init();
    MX_DMA2D_Init();
    MX_QUADSPI_Init();
    MX_SDMMC1_SD_Init();
    MX_TIM12_Init();
    MX_USART1_UART_Init();
    MX_USB_OTG_FS_PCD_Init();
    MX_I2C1_Init();
    MX_FATFS_Init();

    /* USER CODE BEGIN 2 */

    HAL_TIM_PWM_Start(&htim12, TIM_CHANNEL_1);
    __HAL_TIM_SET_COMPARE(&htim12, TIM_CHANNEL_1, 375);

    /* Verify QSPI flash communication */
    uint32_t qspi_id = QSPI_ReadID();
    /* qspi_id should be 0xEF4017 — check in debugger */


    /* Clear framebuffer before LVGL starts */
    memset((void *)LCD_FB_ADDR, 0x00, LCD_HOR_RES * LCD_VER_RES * BYTES_PER_PIXEL);


    lvgl_initialization();


    uint32_t magic = 0;
	QSPI_ReadData(QSPI_MAGIC_ADDR, (uint8_t *)&magic, 4);

	/* If flash not programmed yet and SD is present, program it */
	if (magic != QSPI_MAGIC && sd_present) {
		FRESULT mount_res = f_mount(&SDFatFS, SDPath, 1);
		if (mount_res == FR_OK) {
			lv_fs_fatfs_init();
			QSPI_ProgramSplashFromSD();
			/* Verify */
			QSPI_ReadData(QSPI_MAGIC_ADDR, (uint8_t *)&magic, 4);
		}
	}

	/* Show splash regardless of SD — as long as QSPI is programmed */
	if (magic == QSPI_MAGIC) {
	    QSPI_EnableMemoryMapped();

	    /* DMA2D direct copy from QSPI flash to framebuffer — skip the 12-byte header */
	    uint32_t src = QSPI_FLASH_ADDR + QSPI_IMAGE_ADDR + 12;  /* skip header */
	    uint32_t dst = LCD_FB_ADDR;

	    hdma2d.Init.Mode         = DMA2D_M2M;
	    hdma2d.Init.ColorMode    = DMA2D_OUTPUT_RGB565;
	    hdma2d.Init.OutputOffset = 0;
	    hdma2d.LayerCfg[1].InputOffset    = 0;
	    hdma2d.LayerCfg[1].InputColorMode = DMA2D_INPUT_RGB565;
	    hdma2d.LayerCfg[1].AlphaMode      = DMA2D_NO_MODIF_ALPHA;
	    hdma2d.LayerCfg[1].RedBlueSwap    = DMA2D_RB_REGULAR;
	    HAL_DMA2D_Init(&hdma2d);
	    HAL_DMA2D_ConfigLayer(&hdma2d, 1);

	    HAL_DMA2D_Start(&hdma2d, src, dst, LCD_HOR_RES, LCD_VER_RES);
	    HAL_DMA2D_PollForTransfer(&hdma2d, HAL_MAX_DELAY);
	    while (DMA2D->CR & DMA2D_CR_START);
	    __DSB();

	    HAL_Delay(3000);
	    HAL_QSPI_Abort(&hqspi);
	    MX_QUADSPI_Init();  /* reinitialize QSPI peripheral cleanly */
	}

	/* Mount SD for LVGL filesystem if present (after QSPI is done) */
	if (sd_present) {
	    FRESULT mount_res = f_mount(&SDFatFS, SDPath, 1);
	    if (mount_res == FR_OK) {
	        lv_fs_fatfs_init();
	    }
	}


    gt911_init();
    gt911_lvgl_indev_init();

    ui_init();
    //lv_screen_load(objects.main);

    /* USER CODE END 2 */

    /* USER CODE BEGIN WHILE */
    uint32_t heartbeat = HAL_GetTick();

    while (1)
    {
        lv_timer_handler();
        HAL_Delay(5);

        if (HAL_GetTick() - heartbeat >= 500) {
            heartbeat = HAL_GetTick();
            HAL_GPIO_TogglePin(GPIOH, GPIO_PIN_7);
        }

        /* USER CODE END WHILE */
        /* USER CODE BEGIN 3 */
    }
    /* USER CODE END 3 */
}

void SystemClock_Config(void)
{
    RCC_OscInitTypeDef RCC_OscInitStruct = {0};
    RCC_ClkInitTypeDef RCC_ClkInitStruct = {0};

    HAL_PWREx_ConfigSupply(PWR_LDO_SUPPLY);
    __HAL_PWR_VOLTAGESCALING_CONFIG(PWR_REGULATOR_VOLTAGE_SCALE0);
    while (!__HAL_PWR_GET_FLAG(PWR_FLAG_VOSRDY)) {}

    RCC_OscInitStruct.OscillatorType  = RCC_OSCILLATORTYPE_HSI48 | RCC_OSCILLATORTYPE_HSE;
    RCC_OscInitStruct.HSEState        = RCC_HSE_ON;
    RCC_OscInitStruct.HSI48State      = RCC_HSI48_ON;
    RCC_OscInitStruct.PLL.PLLState    = RCC_PLL_ON;
    RCC_OscInitStruct.PLL.PLLSource   = RCC_PLLSOURCE_HSE;
    RCC_OscInitStruct.PLL.PLLM        = 5;
    RCC_OscInitStruct.PLL.PLLN        = 192;
    RCC_OscInitStruct.PLL.PLLP        = 2;
    RCC_OscInitStruct.PLL.PLLQ        = 2;
    RCC_OscInitStruct.PLL.PLLR        = 2;
    RCC_OscInitStruct.PLL.PLLRGE     = RCC_PLL1VCIRANGE_2;
    RCC_OscInitStruct.PLL.PLLVCOSEL  = RCC_PLL1VCOWIDE;
    RCC_OscInitStruct.PLL.PLLFRACN   = 0;
    if (HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK) Error_Handler();

    RCC_ClkInitStruct.ClockType      = RCC_CLOCKTYPE_HCLK | RCC_CLOCKTYPE_SYSCLK
                                     | RCC_CLOCKTYPE_PCLK1 | RCC_CLOCKTYPE_PCLK2
                                     | RCC_CLOCKTYPE_D3PCLK1 | RCC_CLOCKTYPE_D1PCLK1;
    RCC_ClkInitStruct.SYSCLKSource   = RCC_SYSCLKSOURCE_PLLCLK;
    RCC_ClkInitStruct.SYSCLKDivider  = RCC_SYSCLK_DIV1;
    RCC_ClkInitStruct.AHBCLKDivider  = RCC_HCLK_DIV2;
    RCC_ClkInitStruct.APB3CLKDivider = RCC_APB3_DIV2;
    RCC_ClkInitStruct.APB1CLKDivider = RCC_APB1_DIV2;
    RCC_ClkInitStruct.APB2CLKDivider = RCC_APB2_DIV2;
    RCC_ClkInitStruct.APB4CLKDivider = RCC_APB4_DIV2;
    if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_4) != HAL_OK) Error_Handler();
}

void MPU_Config(void)
{
    MPU_Region_InitTypeDef MPU_InitStruct = {0};
    HAL_MPU_Disable();

    /* Region 0: FLASH */
    MPU_InitStruct.Enable = MPU_REGION_ENABLE; MPU_InitStruct.Number = MPU_REGION_NUMBER0;
    MPU_InitStruct.BaseAddress = 0x08000000; MPU_InitStruct.Size = MPU_REGION_SIZE_2MB;
    MPU_InitStruct.SubRegionDisable = 0x00; MPU_InitStruct.TypeExtField = MPU_TEX_LEVEL0;
    MPU_InitStruct.AccessPermission = MPU_REGION_PRIV_RO_URO;
    MPU_InitStruct.DisableExec = MPU_INSTRUCTION_ACCESS_ENABLE;
    MPU_InitStruct.IsShareable = MPU_ACCESS_NOT_SHAREABLE;
    MPU_InitStruct.IsCacheable = MPU_ACCESS_CACHEABLE;
    MPU_InitStruct.IsBufferable = MPU_ACCESS_NOT_BUFFERABLE;
    HAL_MPU_ConfigRegion(&MPU_InitStruct);

    /* Region 1: DTCMRAM */
    MPU_InitStruct.Enable = MPU_REGION_ENABLE; MPU_InitStruct.Number = MPU_REGION_NUMBER1;
    MPU_InitStruct.BaseAddress = 0x20000000; MPU_InitStruct.Size = MPU_REGION_SIZE_128KB;
    MPU_InitStruct.SubRegionDisable = 0x00; MPU_InitStruct.TypeExtField = MPU_TEX_LEVEL1;
    MPU_InitStruct.AccessPermission = MPU_REGION_FULL_ACCESS;
    MPU_InitStruct.DisableExec = MPU_INSTRUCTION_ACCESS_DISABLE;
    MPU_InitStruct.IsShareable = MPU_ACCESS_NOT_SHAREABLE;
    MPU_InitStruct.IsCacheable = MPU_ACCESS_NOT_CACHEABLE;
    MPU_InitStruct.IsBufferable = MPU_ACCESS_NOT_BUFFERABLE;
    HAL_MPU_ConfigRegion(&MPU_InitStruct);

    /* Region 2: AXI SRAM cacheable (top 128KB disabled — falls to Region 4) */
    MPU_InitStruct.Enable = MPU_REGION_ENABLE; MPU_InitStruct.Number = MPU_REGION_NUMBER2;
    MPU_InitStruct.BaseAddress = 0x24000000; MPU_InitStruct.Size = MPU_REGION_SIZE_512KB;
    MPU_InitStruct.SubRegionDisable = 0xC0; MPU_InitStruct.TypeExtField = MPU_TEX_LEVEL1;
    MPU_InitStruct.AccessPermission = MPU_REGION_FULL_ACCESS;
    MPU_InitStruct.DisableExec = MPU_INSTRUCTION_ACCESS_DISABLE;
    MPU_InitStruct.IsShareable = MPU_ACCESS_NOT_SHAREABLE;
    MPU_InitStruct.IsCacheable = MPU_ACCESS_CACHEABLE;
    MPU_InitStruct.IsBufferable = MPU_ACCESS_NOT_BUFFERABLE;
    HAL_MPU_ConfigRegion(&MPU_InitStruct);

    /* Region 3: RAM_D2 */
    MPU_InitStruct.Enable = MPU_REGION_ENABLE; MPU_InitStruct.Number = MPU_REGION_NUMBER3;
    MPU_InitStruct.BaseAddress = 0x30000000; MPU_InitStruct.Size = MPU_REGION_SIZE_512KB;
    MPU_InitStruct.SubRegionDisable = 0x00; MPU_InitStruct.TypeExtField = MPU_TEX_LEVEL1;
    MPU_InitStruct.AccessPermission = MPU_REGION_FULL_ACCESS;
    MPU_InitStruct.DisableExec = MPU_INSTRUCTION_ACCESS_DISABLE;
    MPU_InitStruct.IsShareable = MPU_ACCESS_NOT_SHAREABLE;
    MPU_InitStruct.IsCacheable = MPU_ACCESS_CACHEABLE;
    MPU_InitStruct.IsBufferable = MPU_ACCESS_NOT_BUFFERABLE;
    HAL_MPU_ConfigRegion(&MPU_InitStruct);

    /* Region 4: AXI SRAM NON-cacheable — LVGL buffers */
    MPU_InitStruct.Enable = MPU_REGION_ENABLE; MPU_InitStruct.Number = MPU_REGION_NUMBER4;
    MPU_InitStruct.BaseAddress = 0x24060000; MPU_InitStruct.Size = MPU_REGION_SIZE_128KB;
    MPU_InitStruct.SubRegionDisable = 0x00; MPU_InitStruct.TypeExtField = MPU_TEX_LEVEL1;
    MPU_InitStruct.AccessPermission = MPU_REGION_FULL_ACCESS;
    MPU_InitStruct.DisableExec = MPU_INSTRUCTION_ACCESS_DISABLE;
    MPU_InitStruct.IsShareable = MPU_ACCESS_NOT_SHAREABLE;
    MPU_InitStruct.IsCacheable = MPU_ACCESS_NOT_CACHEABLE;
    MPU_InitStruct.IsBufferable = MPU_ACCESS_NOT_BUFFERABLE;
    HAL_MPU_ConfigRegion(&MPU_InitStruct);

    /* Region 5: RAM_D3 */
    MPU_InitStruct.Enable = MPU_REGION_ENABLE; MPU_InitStruct.Number = MPU_REGION_NUMBER5;
    MPU_InitStruct.BaseAddress = 0x38000000; MPU_InitStruct.Size = MPU_REGION_SIZE_64KB;
    MPU_InitStruct.SubRegionDisable = 0x00; MPU_InitStruct.TypeExtField = MPU_TEX_LEVEL1;
    MPU_InitStruct.AccessPermission = MPU_REGION_FULL_ACCESS;
    MPU_InitStruct.DisableExec = MPU_INSTRUCTION_ACCESS_DISABLE;
    MPU_InitStruct.IsShareable = MPU_ACCESS_NOT_SHAREABLE;
    MPU_InitStruct.IsCacheable = MPU_ACCESS_CACHEABLE;
    MPU_InitStruct.IsBufferable = MPU_ACCESS_NOT_BUFFERABLE;
    HAL_MPU_ConfigRegion(&MPU_InitStruct);

    /* Region 6: Peripherals */
    MPU_InitStruct.Enable = MPU_REGION_ENABLE; MPU_InitStruct.Number = MPU_REGION_NUMBER6;
    MPU_InitStruct.BaseAddress = 0x40000000; MPU_InitStruct.Size = MPU_REGION_SIZE_512MB;
    MPU_InitStruct.SubRegionDisable = 0x00; MPU_InitStruct.TypeExtField = MPU_TEX_LEVEL0;
    MPU_InitStruct.AccessPermission = MPU_REGION_FULL_ACCESS;
    MPU_InitStruct.DisableExec = MPU_INSTRUCTION_ACCESS_DISABLE;
    MPU_InitStruct.IsShareable = MPU_ACCESS_SHAREABLE;
    MPU_InitStruct.IsCacheable = MPU_ACCESS_NOT_CACHEABLE;
    MPU_InitStruct.IsBufferable = MPU_ACCESS_BUFFERABLE;
    HAL_MPU_ConfigRegion(&MPU_InitStruct);

    /* Region 7: SDRAM framebuffer — NON-cacheable */
    MPU_InitStruct.Enable = MPU_REGION_ENABLE; MPU_InitStruct.Number = MPU_REGION_NUMBER7;
    MPU_InitStruct.BaseAddress = 0xC0000000; MPU_InitStruct.Size = MPU_REGION_SIZE_32MB;
    MPU_InitStruct.SubRegionDisable = 0x00; MPU_InitStruct.TypeExtField = MPU_TEX_LEVEL1;
    MPU_InitStruct.AccessPermission = MPU_REGION_FULL_ACCESS;
    MPU_InitStruct.DisableExec = MPU_INSTRUCTION_ACCESS_DISABLE;
    MPU_InitStruct.IsShareable = MPU_ACCESS_NOT_SHAREABLE;
    MPU_InitStruct.IsCacheable = MPU_ACCESS_NOT_CACHEABLE;
    MPU_InitStruct.IsBufferable = MPU_ACCESS_NOT_BUFFERABLE;
    HAL_MPU_ConfigRegion(&MPU_InitStruct);

    HAL_MPU_Enable(MPU_PRIVILEGED_DEFAULT);
}

static void MX_I2C1_Init(void)
{
    hi2c1.Instance = I2C1; hi2c1.Init.Timing = 0x307075B1;
    hi2c1.Init.OwnAddress1 = 0; hi2c1.Init.AddressingMode = I2C_ADDRESSINGMODE_7BIT;
    hi2c1.Init.DualAddressMode = I2C_DUALADDRESS_DISABLE; hi2c1.Init.OwnAddress2 = 0;
    hi2c1.Init.OwnAddress2Masks = I2C_OA2_NOMASK;
    hi2c1.Init.GeneralCallMode = I2C_GENERALCALL_DISABLE;
    hi2c1.Init.NoStretchMode = I2C_NOSTRETCH_DISABLE;
    if (HAL_I2C_Init(&hi2c1) != HAL_OK) Error_Handler();
    if (HAL_I2CEx_ConfigAnalogFilter(&hi2c1, I2C_ANALOGFILTER_ENABLE) != HAL_OK) Error_Handler();
    if (HAL_I2CEx_ConfigDigitalFilter(&hi2c1, 0) != HAL_OK) Error_Handler();
}

static void MX_LTDC_Init(void)
{
    LTDC_LayerCfgTypeDef pLayerCfg = {0};
    __HAL_RCC_LTDC_CLK_ENABLE();
    hltdc.Instance = LTDC;
    hltdc.Init.HSPolarity = LTDC_HSPOLARITY_AL; hltdc.Init.VSPolarity = LTDC_VSPOLARITY_AL;
    hltdc.Init.DEPolarity = LTDC_DEPOLARITY_AL; hltdc.Init.PCPolarity = LTDC_PCPOLARITY_IPC;
    hltdc.Init.HorizontalSync = 9; hltdc.Init.AccumulatedHBP = 55;
    hltdc.Init.AccumulatedActiveW = 855; hltdc.Init.TotalWidth = 1065;
    hltdc.Init.VerticalSync = 9; hltdc.Init.AccumulatedVBP = 42;
    hltdc.Init.AccumulatedActiveH = 522; hltdc.Init.TotalHeigh = 544;
    hltdc.Init.Backcolor.Blue = 0; hltdc.Init.Backcolor.Green = 0; hltdc.Init.Backcolor.Red = 0;
    if (HAL_LTDC_Init(&hltdc) != HAL_OK) Error_Handler();

    pLayerCfg.WindowX0 = 0; pLayerCfg.WindowX1 = LCD_HOR_RES;
    pLayerCfg.WindowY0 = 0; pLayerCfg.WindowY1 = LCD_VER_RES;
    pLayerCfg.PixelFormat = LTDC_PIXEL_FORMAT_RGB565;
    pLayerCfg.FBStartAdress = LCD_FB_ADDR;
    pLayerCfg.Alpha = 255; pLayerCfg.Alpha0 = 0;
    pLayerCfg.BlendingFactor1 = LTDC_BLENDING_FACTOR1_CA;
    pLayerCfg.BlendingFactor2 = LTDC_BLENDING_FACTOR2_CA;
    pLayerCfg.ImageWidth = LCD_HOR_RES; pLayerCfg.ImageHeight = LCD_VER_RES;
    pLayerCfg.Backcolor.Blue = 0; pLayerCfg.Backcolor.Green = 0; pLayerCfg.Backcolor.Red = 0;
    if (HAL_LTDC_ConfigLayer(&hltdc, &pLayerCfg, 0) != HAL_OK) Error_Handler();
}

static void MX_QUADSPI_Init(void)
{
    /* W25Q64JV: 64Mbit, 133MHz max
     * AHB clock = 240MHz, prescaler 1 → 120MHz (safe for W25Q64JV) */
    hqspi.Instance = QUADSPI;
    hqspi.Init.ClockPrescaler     = 1;          /* 240/(1+1) = 120MHz */
    hqspi.Init.FifoThreshold      = 4;
    hqspi.Init.SampleShifting     = QSPI_SAMPLE_SHIFTING_HALFCYCLE;
    hqspi.Init.FlashSize          = 22;         /* 2^(22+1) = 8MB */
    hqspi.Init.ChipSelectHighTime = QSPI_CS_HIGH_TIME_2_CYCLE;
    hqspi.Init.ClockMode          = QSPI_CLOCK_MODE_0;
    hqspi.Init.FlashID            = QSPI_FLASH_ID_1;
    hqspi.Init.DualFlash          = QSPI_DUALFLASH_DISABLE;
    if (HAL_QSPI_Init(&hqspi) != HAL_OK) Error_Handler();
}

static void MX_SDMMC1_SD_Init(void)
{
    hsd1.Instance = SDMMC1;
    hsd1.Init.ClockEdge = SDMMC_CLOCK_EDGE_RISING;
    hsd1.Init.ClockPowerSave = SDMMC_CLOCK_POWER_SAVE_DISABLE;

    /*
     * Start in 1-bit mode.
     * Do NOT start directly in 4-bit mode.
     */
    hsd1.Init.BusWide = SDMMC_BUS_WIDE_1B;

    hsd1.Init.HardwareFlowControl = SDMMC_HARDWARE_FLOW_CONTROL_ENABLE;

    /*
     * Start slow. After everything works, you can reduce this.
     * Try 8, 10, 16 or even 20 while debugging.
     */
    hsd1.Init.ClockDiv = 16;

    if (HAL_SD_Init(&hsd1) != HAL_OK) {
        sd_present = 0;
        return;
    }

    /*
     * Only switch to 4-bit after the card was initialized successfully.
     * This requires CMD/D0/D1/D2/D3 lines and pull-ups to be correct.
     */
    if (HAL_SD_ConfigWideBusOperation(&hsd1, SDMMC_BUS_WIDE_4B) != HAL_OK) {
        /*
         * For debugging, do not fail here yet.
         * Keep the card working in 1-bit mode.
         */
        hsd1.Init.BusWide = SDMMC_BUS_WIDE_1B;
    }

    sd_present = 1;
}

static void MX_TIM12_Init(void)
{
    TIM_ClockConfigTypeDef sClockSourceConfig = {0};
    TIM_MasterConfigTypeDef sMasterConfig = {0};
    TIM_OC_InitTypeDef sConfigOC = {0};
    htim12.Instance = TIM12; htim12.Init.Prescaler = 239;
    htim12.Init.CounterMode = TIM_COUNTERMODE_UP; htim12.Init.Period = 499;
    htim12.Init.ClockDivision = TIM_CLOCKDIVISION_DIV1;
    htim12.Init.AutoReloadPreload = TIM_AUTORELOAD_PRELOAD_ENABLE;
    if (HAL_TIM_Base_Init(&htim12) != HAL_OK) Error_Handler();
    sClockSourceConfig.ClockSource = TIM_CLOCKSOURCE_INTERNAL;
    if (HAL_TIM_ConfigClockSource(&htim12, &sClockSourceConfig) != HAL_OK) Error_Handler();
    if (HAL_TIM_PWM_Init(&htim12) != HAL_OK) Error_Handler();
    sMasterConfig.MasterOutputTrigger = TIM_TRGO_RESET;
    sMasterConfig.MasterSlaveMode = TIM_MASTERSLAVEMODE_DISABLE;
    if (HAL_TIMEx_MasterConfigSynchronization(&htim12, &sMasterConfig) != HAL_OK) Error_Handler();
    sConfigOC.OCMode = TIM_OCMODE_PWM1; sConfigOC.Pulse = 499;
    sConfigOC.OCPolarity = TIM_OCPOLARITY_HIGH; sConfigOC.OCFastMode = TIM_OCFAST_DISABLE;
    if (HAL_TIM_PWM_ConfigChannel(&htim12, &sConfigOC, TIM_CHANNEL_1) != HAL_OK) Error_Handler();
    HAL_TIM_MspPostInit(&htim12);
}

static void MX_USART1_UART_Init(void)
{
    huart1.Instance = USART1; huart1.Init.BaudRate = 115200;
    huart1.Init.WordLength = UART_WORDLENGTH_8B; huart1.Init.StopBits = UART_STOPBITS_1;
    huart1.Init.Parity = UART_PARITY_NONE; huart1.Init.Mode = UART_MODE_TX_RX;
    huart1.Init.HwFlowCtl = UART_HWCONTROL_NONE; huart1.Init.OverSampling = UART_OVERSAMPLING_16;
    huart1.Init.OneBitSampling = UART_ONE_BIT_SAMPLE_DISABLE;
    huart1.Init.ClockPrescaler = UART_PRESCALER_DIV1;
    huart1.AdvancedInit.AdvFeatureInit = UART_ADVFEATURE_NO_INIT;
    if (HAL_UART_Init(&huart1) != HAL_OK) Error_Handler();
    if (HAL_UARTEx_SetTxFifoThreshold(&huart1, UART_TXFIFO_THRESHOLD_1_8) != HAL_OK) Error_Handler();
    if (HAL_UARTEx_SetRxFifoThreshold(&huart1, UART_RXFIFO_THRESHOLD_1_8) != HAL_OK) Error_Handler();
    if (HAL_UARTEx_DisableFifoMode(&huart1) != HAL_OK) Error_Handler();
}

static void MX_USB_OTG_FS_PCD_Init(void)
{
    hpcd_USB_OTG_FS.Instance = USB_OTG_FS; hpcd_USB_OTG_FS.Init.dev_endpoints = 9;
    hpcd_USB_OTG_FS.Init.speed = PCD_SPEED_FULL; hpcd_USB_OTG_FS.Init.dma_enable = DISABLE;
    hpcd_USB_OTG_FS.Init.phy_itface = PCD_PHY_EMBEDDED; hpcd_USB_OTG_FS.Init.Sof_enable = DISABLE;
    hpcd_USB_OTG_FS.Init.low_power_enable = DISABLE; hpcd_USB_OTG_FS.Init.lpm_enable = DISABLE;
    hpcd_USB_OTG_FS.Init.battery_charging_enable = DISABLE;
    hpcd_USB_OTG_FS.Init.vbus_sensing_enable = DISABLE;
    hpcd_USB_OTG_FS.Init.use_dedicated_ep1 = DISABLE;
    if (HAL_PCD_Init(&hpcd_USB_OTG_FS) != HAL_OK) Error_Handler();
}

static void MX_FMC_Init(void)
{
    FMC_SDRAM_TimingTypeDef SdramTiming = {0};
    hsdram1.Instance = FMC_SDRAM_DEVICE; hsdram1.Init.SDBank = FMC_SDRAM_BANK1;
    hsdram1.Init.ColumnBitsNumber = FMC_SDRAM_COLUMN_BITS_NUM_9;
    hsdram1.Init.RowBitsNumber = FMC_SDRAM_ROW_BITS_NUM_13;
    hsdram1.Init.MemoryDataWidth = FMC_SDRAM_MEM_BUS_WIDTH_16;
    hsdram1.Init.InternalBankNumber = FMC_SDRAM_INTERN_BANKS_NUM_4;
    hsdram1.Init.CASLatency = FMC_SDRAM_CAS_LATENCY_3;
    hsdram1.Init.WriteProtection = FMC_SDRAM_WRITE_PROTECTION_DISABLE;
    hsdram1.Init.SDClockPeriod = FMC_SDRAM_CLOCK_PERIOD_2;
    hsdram1.Init.ReadBurst = FMC_SDRAM_RBURST_ENABLE;
    hsdram1.Init.ReadPipeDelay = FMC_SDRAM_RPIPE_DELAY_0;
    SdramTiming.LoadToActiveDelay = 2; SdramTiming.ExitSelfRefreshDelay = 9;
    SdramTiming.SelfRefreshTime = 6; SdramTiming.RowCycleDelay = 8;
    SdramTiming.WriteRecoveryTime = 3; SdramTiming.RPDelay = 3; SdramTiming.RCDDelay = 3;
    if (HAL_SDRAM_Init(&hsdram1, &SdramTiming) != HAL_OK) Error_Handler();
    SDRAM_Initialization_Sequence(&hsdram1);  /* CRITICAL — must not be removed */
}

static void MX_GPIO_Init(void)
{
    GPIO_InitTypeDef GPIO_InitStruct = {0};
    __HAL_RCC_GPIOE_CLK_ENABLE(); __HAL_RCC_GPIOI_CLK_ENABLE();
    __HAL_RCC_GPIOF_CLK_ENABLE(); __HAL_RCC_GPIOH_CLK_ENABLE();
    __HAL_RCC_GPIOA_CLK_ENABLE(); __HAL_RCC_GPIOB_CLK_ENABLE();
    __HAL_RCC_GPIOG_CLK_ENABLE(); __HAL_RCC_GPIOD_CLK_ENABLE();
    __HAL_RCC_GPIOC_CLK_ENABLE();

    HAL_GPIO_WritePin(GPIOI, TOUCH_SDA_Pin | TOUCH_SCLK_Pin, GPIO_PIN_RESET);
    HAL_GPIO_WritePin(GPIOH, TOUCH_RST_Pin | LED_Pin, GPIO_PIN_RESET);
    HAL_GPIO_WritePin(TOUCH_INT_GPIO_Port, TOUCH_INT_Pin, GPIO_PIN_RESET);

    GPIO_InitStruct.Pin = TOUCH_SDA_Pin | TOUCH_SCLK_Pin;
    GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP; GPIO_InitStruct.Pull = GPIO_NOPULL;
    GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
    HAL_GPIO_Init(GPIOI, &GPIO_InitStruct);

    GPIO_InitStruct.Pin = TOUCH_RST_Pin | LED_Pin;
    HAL_GPIO_Init(GPIOH, &GPIO_InitStruct);

    /* TOUCH_INT — input (GT911 drives it) */
    GPIO_InitStruct.Pin = TOUCH_INT_Pin;
    GPIO_InitStruct.Mode = GPIO_MODE_INPUT; GPIO_InitStruct.Pull = GPIO_NOPULL;
    HAL_GPIO_Init(TOUCH_INT_GPIO_Port, &GPIO_InitStruct);
}

/* USER CODE BEGIN 4 */
static void MX_DMA2D_Init(void)
{

  /* USER CODE BEGIN DMA2D_Init 0 */

  /* USER CODE END DMA2D_Init 0 */

  /* USER CODE BEGIN DMA2D_Init 1 */

  /* USER CODE END DMA2D_Init 1 */
  hdma2d.Instance = DMA2D;
  hdma2d.Init.Mode = DMA2D_M2M;
  hdma2d.Init.ColorMode = DMA2D_OUTPUT_RGB565;
  hdma2d.Init.OutputOffset = 0;
  hdma2d.LayerCfg[1].InputOffset = 0;
  hdma2d.LayerCfg[1].InputColorMode = DMA2D_INPUT_RGB565;
  hdma2d.LayerCfg[1].AlphaMode = DMA2D_NO_MODIF_ALPHA;
  hdma2d.LayerCfg[1].InputAlpha = 0;
  hdma2d.LayerCfg[1].AlphaInverted = DMA2D_REGULAR_ALPHA;
  hdma2d.LayerCfg[1].RedBlueSwap = DMA2D_RB_REGULAR;
  hdma2d.LayerCfg[1].ChromaSubSampling = DMA2D_NO_CSS;
  if (HAL_DMA2D_Init(&hdma2d) != HAL_OK)
  {
    Error_Handler();
  }
  if (HAL_DMA2D_ConfigLayer(&hdma2d, 1) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN DMA2D_Init 2 */

  /* USER CODE END DMA2D_Init 2 */

}
/* USER CODE END 4 */

void Error_Handler(void)
{
    __disable_irq();
    while (1) {
        HAL_GPIO_TogglePin(GPIOH, GPIO_PIN_7);
        HAL_Delay(100);
    }
}

#ifdef USE_FULL_ASSERT
void assert_failed(uint8_t *file, uint32_t line) {}
#endif
