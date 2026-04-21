/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file           : main.c
  * @brief          : Main program body
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
#include "main.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */
#include "lv_conf.h"
#include <stdint.h>
/* USER CODE END Includes */

/* Private typedef -----------------------------------------------------------*/
/* USER CODE BEGIN PTD */

/* USER CODE END PTD */

/* Private define ------------------------------------------------------------*/
/* USER CODE BEGIN PD */
#define LCD_HOR_RES   800
#define LCD_VER_RES   480
#define LCD_FB_ADDR   0xC0000000U   // SDRAM Bank1
#define RGB565_BLACK   0x0000
#define RGB565_WHITE   0xFFFF
#define RGB565_RED     0xF800
#define RGB565_GREEN   0x07E0
#define RGB565_BLUE    0x001F
#define RGB565_YELLOW  0xFFE0
#define RGB565_CYAN    0x07FF
#define RGB565_MAGENTA 0xF81F

/* USER CODE END PD */

/* Private macro -------------------------------------------------------------*/
/* USER CODE BEGIN PM */

/* USER CODE END PM */

/* Private variables ---------------------------------------------------------*/

DMA2D_HandleTypeDef hdma2d;

I2C_HandleTypeDef hi2c1;

LTDC_HandleTypeDef hltdc;

QSPI_HandleTypeDef hqspi;

SD_HandleTypeDef hsd1;

TIM_HandleTypeDef htim12;

UART_HandleTypeDef huart1;

PCD_HandleTypeDef hpcd_USB_OTG_FS;

SDRAM_HandleTypeDef hsdram1;

/* USER CODE BEGIN PV */
uint8_t sd_present = 0;

/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/

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
void SystemClock_Config(void);

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

    mode = 0
         | (0x0 << 0)   // burst length = 1
         | (0x0 << 3)   // sequential
         | (0x2 << 4)   // CAS latency = 3
         | (0x0 << 7)   // standard operating mode
         | (0x1 << 9);  // single write burst

    cmd.CommandMode = FMC_SDRAM_CMD_LOAD_MODE;
    cmd.CommandTarget = FMC_SDRAM_CMD_TARGET_BANK1;
    cmd.AutoRefreshNumber = 1;
    cmd.ModeRegisterDefinition = mode;
    HAL_SDRAM_SendCommand(hsdram, &cmd, HAL_MAX_DELAY);

    HAL_SDRAM_ProgramRefreshRate(hsdram, 761);
}


static uint16_t *fb = (uint16_t *)LCD_FB_ADDR;

void fill_screen(uint16_t color)
{
    for (uint32_t y = 0; y < LCD_VER_RES; y++)
    {
        for (uint32_t x = 0; x < LCD_HOR_RES; x++)
        {
            fb[y * LCD_HOR_RES + x] = color;
        }
    }
}



/* USER CODE END PFP */

/* Private user code ---------------------------------------------------------*/
/* USER CODE BEGIN 0 */

/* USER CODE END 0 */

/**
  * @brief  The application entry point.
  * @retval int
  */
int main(void)
{

  /* USER CODE BEGIN 1 */

  /* USER CODE END 1 */

  /* MPU Configuration--------------------------------------------------------*/
  MPU_Config();

  /* MCU Configuration--------------------------------------------------------*/

  /* Reset of all peripherals, Initializes the Flash interface and the Systick. */
  HAL_Init();

  /* USER CODE BEGIN Init */

  /* USER CODE END Init */

  /* Configure the system clock */
  SystemClock_Config();

  /* USER CODE BEGIN SysInit */

  /* USER CODE END SysInit */

  /* Initialize all configured peripherals */
  MX_GPIO_Init();
  MX_FMC_Init();
  MX_LTDC_Init();
  MX_QUADSPI_Init();
  MX_SDMMC1_SD_Init();
  MX_TIM12_Init();
  MX_USART1_UART_Init();
  MX_USB_OTG_FS_PCD_Init();
  MX_I2C1_Init();
  MX_DMA2D_Init();
  /* USER CODE BEGIN 2 */



  //Enable LCD Backlight; Backlight is a PWM signal @2Khz, where brightness is handling the DutyCicle of the signal
  //this duty cicly is handled 0%->0; 100%->500; So 250 is 50% DutyCicly/Brightness
  HAL_TIM_PWM_Start(&htim12, TIM_CHANNEL_1);
  __HAL_TIM_SET_COMPARE(&htim12, TIM_CHANNEL_1, 499);   // 50% duty at 2 kHz



  // 2. Clear/Fill the buffer in memory with color bars!

  for (uint32_t y = 0; y < LCD_VER_RES; y++)
     {
         for (uint32_t x = 0; x < LCD_HOR_RES; x++)
         {
             uint16_t color;

             if (x < LCD_HOR_RES / 8) color = 0x0000;      // black
             else if (x < 2 * LCD_HOR_RES / 8) color = 0xF800; // red
             else if (x < 3 * LCD_HOR_RES / 8) color = 0x07E0; // green
             else if (x < 4 * LCD_HOR_RES / 8) color = 0x001F; // blue
             else if (x < 5 * LCD_HOR_RES / 8) color = 0xFFE0; // yellow
             else if (x < 6 * LCD_HOR_RES / 8) color = 0xF81F; // magenta
             else if (x < 7 * LCD_HOR_RES / 8) color = 0x07FF; // cyan
             else color = 0xFFFF; // white

             fb[y * LCD_HOR_RES + x] = color;
         }
     }

  HAL_Delay(2000);

  //here we have to initialize LVGL

  /* USER CODE END 2 */

  /* Infinite loop */
  /* USER CODE BEGIN WHILE */
  while (1)
  {
	  HAL_GPIO_TogglePin(GPIOH, GPIO_PIN_7);
	  HAL_Delay(500);
    /* USER CODE END WHILE */

    /* USER CODE BEGIN 3 */
  }
  /* USER CODE END 3 */
}

/**
  * @brief System Clock Configuration
  * @retval None
  */
void SystemClock_Config(void)
{
  RCC_OscInitTypeDef RCC_OscInitStruct = {0};
  RCC_ClkInitTypeDef RCC_ClkInitStruct = {0};

  /** Supply configuration update enable
  */
  HAL_PWREx_ConfigSupply(PWR_LDO_SUPPLY);

  /** Configure the main internal regulator output voltage
  */
  __HAL_PWR_VOLTAGESCALING_CONFIG(PWR_REGULATOR_VOLTAGE_SCALE0);

  while(!__HAL_PWR_GET_FLAG(PWR_FLAG_VOSRDY)) {}

  /** Initializes the RCC Oscillators according to the specified parameters
  * in the RCC_OscInitTypeDef structure.
  */
  RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSI48|RCC_OSCILLATORTYPE_HSE;
  RCC_OscInitStruct.HSEState = RCC_HSE_ON;
  RCC_OscInitStruct.HSI48State = RCC_HSI48_ON;
  RCC_OscInitStruct.PLL.PLLState = RCC_PLL_ON;
  RCC_OscInitStruct.PLL.PLLSource = RCC_PLLSOURCE_HSE;
  RCC_OscInitStruct.PLL.PLLM = 5;
  RCC_OscInitStruct.PLL.PLLN = 192;
  RCC_OscInitStruct.PLL.PLLP = 2;
  RCC_OscInitStruct.PLL.PLLQ = 2;
  RCC_OscInitStruct.PLL.PLLR = 2;
  RCC_OscInitStruct.PLL.PLLRGE = RCC_PLL1VCIRANGE_2;
  RCC_OscInitStruct.PLL.PLLVCOSEL = RCC_PLL1VCOWIDE;
  RCC_OscInitStruct.PLL.PLLFRACN = 0;
  if (HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK)
  {
    Error_Handler();
  }


  /** Initializes the CPU, AHB and APB buses clocks
  */
  RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK|RCC_CLOCKTYPE_SYSCLK
                              |RCC_CLOCKTYPE_PCLK1|RCC_CLOCKTYPE_PCLK2
                              |RCC_CLOCKTYPE_D3PCLK1|RCC_CLOCKTYPE_D1PCLK1;
  RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_PLLCLK;
  RCC_ClkInitStruct.SYSCLKDivider = RCC_SYSCLK_DIV1;
  RCC_ClkInitStruct.AHBCLKDivider = RCC_HCLK_DIV2;
  RCC_ClkInitStruct.APB3CLKDivider = RCC_APB3_DIV2;
  RCC_ClkInitStruct.APB1CLKDivider = RCC_APB1_DIV2;
  RCC_ClkInitStruct.APB2CLKDivider = RCC_APB2_DIV2;
  RCC_ClkInitStruct.APB4CLKDivider = RCC_APB4_DIV2;

  if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_4) != HAL_OK)
  {
    Error_Handler();
  }
}


/**
  * @brief DMA2D Initialization Function
  * @param None
  * @retval None
  */
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


/**
  * @brief I2C1 Initialization Function
  * @param None
  * @retval None
  */
static void MX_I2C1_Init(void)
{

  /* USER CODE BEGIN I2C1_Init 0 */

  /* USER CODE END I2C1_Init 0 */

  /* USER CODE BEGIN I2C1_Init 1 */

  /* USER CODE END I2C1_Init 1 */
  hi2c1.Instance = I2C1;
  hi2c1.Init.Timing = 0x307075B1;
  hi2c1.Init.OwnAddress1 = 0;
  hi2c1.Init.AddressingMode = I2C_ADDRESSINGMODE_7BIT;
  hi2c1.Init.DualAddressMode = I2C_DUALADDRESS_DISABLE;
  hi2c1.Init.OwnAddress2 = 0;
  hi2c1.Init.OwnAddress2Masks = I2C_OA2_NOMASK;
  hi2c1.Init.GeneralCallMode = I2C_GENERALCALL_DISABLE;
  hi2c1.Init.NoStretchMode = I2C_NOSTRETCH_DISABLE;
  if (HAL_I2C_Init(&hi2c1) != HAL_OK)
  {
    Error_Handler();
  }

  /** Configure Analogue filter
  */
  if (HAL_I2CEx_ConfigAnalogFilter(&hi2c1, I2C_ANALOGFILTER_ENABLE) != HAL_OK)
  {
    Error_Handler();
  }

  /** Configure Digital filter
  */
  if (HAL_I2CEx_ConfigDigitalFilter(&hi2c1, 0) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN I2C1_Init 2 */

  /* USER CODE END I2C1_Init 2 */

}

/**
  * @brief LTDC Initialization Function
  * @param None
  * @retval None
  */
static void MX_LTDC_Init(void)
{
  /* HSync, VSync, back/front porch calculados para 800x480 */
  /* Valores típicos RK043FN48H:
   * HSYNC = 10
   * HBP   = 46
   * HFP   = 210
   * VSYNC = 10
   * VBP   = 33
   * VFP   = 22
   */

  LTDC_LayerCfgTypeDef pLayerCfg = {0};

  /* Habilitar clock de LTDC (por si acaso) */
  __HAL_RCC_LTDC_CLK_ENABLE();

  hltdc.Instance = LTDC;
  hltdc.Init.HSPolarity      = LTDC_HSPOLARITY_AL;
  hltdc.Init.VSPolarity      = LTDC_VSPOLARITY_AL;
  hltdc.Init.DEPolarity      = LTDC_DEPOLARITY_AL;
  hltdc.Init.PCPolarity      = LTDC_PCPOLARITY_IPC;

  /* Timings horizontales */
  hltdc.Init.HorizontalSync      = 10 - 1;                     // 9
  hltdc.Init.AccumulatedHBP      = 10 + 46 - 1;                // 55
  hltdc.Init.AccumulatedActiveW  = 10 + 46 + 800 - 1;          // 855
  hltdc.Init.TotalWidth          = 10 + 46 + 800 + 210 - 1;    // 1065

  /* Timings verticales */
  hltdc.Init.VerticalSync        = 10 - 1;                     // 9
  hltdc.Init.AccumulatedVBP      = 10 + 33 - 1;                // 42
  hltdc.Init.AccumulatedActiveH  = 10 + 33 + 480 - 1;          // 522
  hltdc.Init.TotalHeigh          = 10 + 33 + 480 + 22 - 1;     // 544

  hltdc.Init.Backcolor.Blue  = 0;
  hltdc.Init.Backcolor.Green = 0;
  hltdc.Init.Backcolor.Red   = 0;

  if (HAL_LTDC_Init(&hltdc) != HAL_OK)
  {
    Error_Handler();
  }

  /* Configuración de la capa 0 */
  pLayerCfg.WindowX0 = 0;
  pLayerCfg.WindowX1 = LCD_HOR_RES;   // 800
  pLayerCfg.WindowY0 = 0;
  pLayerCfg.WindowY1 = LCD_VER_RES;   // 480

  pLayerCfg.PixelFormat    = LTDC_PIXEL_FORMAT_RGB565;
  pLayerCfg.FBStartAdress  = LCD_FB_ADDR;
  pLayerCfg.Alpha          = 255;
  pLayerCfg.Alpha0         = 0;
  pLayerCfg.BlendingFactor1 = LTDC_BLENDING_FACTOR1_CA;
  pLayerCfg.BlendingFactor2 = LTDC_BLENDING_FACTOR2_CA;

  pLayerCfg.ImageWidth  = LCD_HOR_RES;
  pLayerCfg.ImageHeight = LCD_VER_RES;

  pLayerCfg.Backcolor.Blue  = 0;
  pLayerCfg.Backcolor.Green = 0;
  pLayerCfg.Backcolor.Red   = 0;

  if (HAL_LTDC_ConfigLayer(&hltdc, &pLayerCfg, 0) != HAL_OK)
  {
    Error_Handler();
  }
}

/**
  * @brief QUADSPI Initialization Function
  * @param None
  * @retval None
  */
static void MX_QUADSPI_Init(void)
{

  /* USER CODE BEGIN QUADSPI_Init 0 */

  /* USER CODE END QUADSPI_Init 0 */

  /* USER CODE BEGIN QUADSPI_Init 1 */

  /* USER CODE END QUADSPI_Init 1 */
  /* QUADSPI parameter configuration*/
  hqspi.Instance = QUADSPI;
  hqspi.Init.ClockPrescaler = 255;
  hqspi.Init.FifoThreshold = 1;
  hqspi.Init.SampleShifting = QSPI_SAMPLE_SHIFTING_NONE;
  hqspi.Init.FlashSize = 1;
  hqspi.Init.ChipSelectHighTime = QSPI_CS_HIGH_TIME_1_CYCLE;
  hqspi.Init.ClockMode = QSPI_CLOCK_MODE_0;
  hqspi.Init.FlashID = QSPI_FLASH_ID_1;
  hqspi.Init.DualFlash = QSPI_DUALFLASH_DISABLE;
  if (HAL_QSPI_Init(&hqspi) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN QUADSPI_Init 2 */

  /* USER CODE END QUADSPI_Init 2 */

}

/**
  * @brief SDMMC1 Initialization Function
  * @param None
  * @retval None
  */


static void MX_SDMMC1_SD_Init(void)
{

  /* USER CODE BEGIN SDMMC1_Init 0 */

  /* USER CODE END SDMMC1_Init 0 */

  /* USER CODE BEGIN SDMMC1_Init 1 */

  /* USER CODE END SDMMC1_Init 1 */
  hsd1.Instance = SDMMC1;
  hsd1.Init.ClockEdge = SDMMC_CLOCK_EDGE_RISING;
  hsd1.Init.ClockPowerSave = SDMMC_CLOCK_POWER_SAVE_DISABLE;
  hsd1.Init.BusWide = SDMMC_BUS_WIDE_4B;
  hsd1.Init.HardwareFlowControl = SDMMC_HARDWARE_FLOW_CONTROL_DISABLE;
  hsd1.Init.ClockDiv = 0;
  if (HAL_SD_Init(&hsd1) == HAL_OK){
    sd_present = 1;
    if (HAL_SD_ConfigWideBusOperation(&hsd1, SDMMC_BUS_WIDE_4B) != HAL_OK){
      sd_present = 0;
    }
  }else{
    sd_present = 0;
  }

  /* USER CODE BEGIN SDMMC1_Init 2 */

  /* USER CODE END SDMMC1_Init 2 */

}

/**
  * @brief TIM12 Initialization Function
  * @param None
  * @retval None
  */
static void MX_TIM12_Init(void)
{

  /* USER CODE BEGIN TIM12_Init 0 */

  /* USER CODE END TIM12_Init 0 */

  TIM_ClockConfigTypeDef sClockSourceConfig = {0};
  TIM_MasterConfigTypeDef sMasterConfig = {0};
  TIM_OC_InitTypeDef sConfigOC = {0};

  /* USER CODE BEGIN TIM12_Init 1 */

  /* USER CODE END TIM12_Init 1 */
  htim12.Instance = TIM12;
  htim12.Init.Prescaler = 239;
  htim12.Init.CounterMode = TIM_COUNTERMODE_UP;
  htim12.Init.Period = 499;
  htim12.Init.ClockDivision = TIM_CLOCKDIVISION_DIV1;
  htim12.Init.AutoReloadPreload = TIM_AUTORELOAD_PRELOAD_ENABLE;
  if (HAL_TIM_Base_Init(&htim12) != HAL_OK)
  {
    Error_Handler();
  }
  sClockSourceConfig.ClockSource = TIM_CLOCKSOURCE_INTERNAL;
  if (HAL_TIM_ConfigClockSource(&htim12, &sClockSourceConfig) != HAL_OK)
  {
    Error_Handler();
  }
  if (HAL_TIM_PWM_Init(&htim12) != HAL_OK)
  {
    Error_Handler();
  }
  sMasterConfig.MasterOutputTrigger = TIM_TRGO_RESET;
  sMasterConfig.MasterSlaveMode = TIM_MASTERSLAVEMODE_DISABLE;
  if (HAL_TIMEx_MasterConfigSynchronization(&htim12, &sMasterConfig) != HAL_OK)
  {
    Error_Handler();
  }
  sConfigOC.OCMode = TIM_OCMODE_PWM1;
  sConfigOC.Pulse = 499;
  sConfigOC.OCPolarity = TIM_OCPOLARITY_HIGH;
  sConfigOC.OCFastMode = TIM_OCFAST_DISABLE;
  if (HAL_TIM_PWM_ConfigChannel(&htim12, &sConfigOC, TIM_CHANNEL_1) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN TIM12_Init 2 */

  /* USER CODE END TIM12_Init 2 */
  HAL_TIM_MspPostInit(&htim12);

}

/**
  * @brief USART1 Initialization Function
  * @param None
  * @retval None
  */
static void MX_USART1_UART_Init(void)
{

  /* USER CODE BEGIN USART1_Init 0 */

  /* USER CODE END USART1_Init 0 */

  /* USER CODE BEGIN USART1_Init 1 */

  /* USER CODE END USART1_Init 1 */
  huart1.Instance = USART1;
  huart1.Init.BaudRate = 115200;
  huart1.Init.WordLength = UART_WORDLENGTH_8B;
  huart1.Init.StopBits = UART_STOPBITS_1;
  huart1.Init.Parity = UART_PARITY_NONE;
  huart1.Init.Mode = UART_MODE_TX_RX;
  huart1.Init.HwFlowCtl = UART_HWCONTROL_NONE;
  huart1.Init.OverSampling = UART_OVERSAMPLING_16;
  huart1.Init.OneBitSampling = UART_ONE_BIT_SAMPLE_DISABLE;
  huart1.Init.ClockPrescaler = UART_PRESCALER_DIV1;
  huart1.AdvancedInit.AdvFeatureInit = UART_ADVFEATURE_NO_INIT;
  if (HAL_UART_Init(&huart1) != HAL_OK)
  {
    Error_Handler();
  }
  if (HAL_UARTEx_SetTxFifoThreshold(&huart1, UART_TXFIFO_THRESHOLD_1_8) != HAL_OK)
  {
    Error_Handler();
  }
  if (HAL_UARTEx_SetRxFifoThreshold(&huart1, UART_RXFIFO_THRESHOLD_1_8) != HAL_OK)
  {
    Error_Handler();
  }
  if (HAL_UARTEx_DisableFifoMode(&huart1) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN USART1_Init 2 */

  /* USER CODE END USART1_Init 2 */

}

/**
  * @brief USB_OTG_FS Initialization Function
  * @param None
  * @retval None
  */
static void MX_USB_OTG_FS_PCD_Init(void)
{

  /* USER CODE BEGIN USB_OTG_FS_PCD_Init 0 */

  /* USER CODE END USB_OTG_FS_PCD_Init 0 */

  /* USER CODE BEGIN USB_OTG_FS_PCD_Init 1 */

  /* USER CODE END USB_OTG_FS_PCD_Init 1 */
  hpcd_USB_OTG_FS.Instance = USB_OTG_FS;
  hpcd_USB_OTG_FS.Init.dev_endpoints = 9;
  hpcd_USB_OTG_FS.Init.speed = PCD_SPEED_FULL;
  hpcd_USB_OTG_FS.Init.dma_enable = DISABLE;
  hpcd_USB_OTG_FS.Init.phy_itface = PCD_PHY_EMBEDDED;
  hpcd_USB_OTG_FS.Init.Sof_enable = DISABLE;
  hpcd_USB_OTG_FS.Init.low_power_enable = DISABLE;
  hpcd_USB_OTG_FS.Init.lpm_enable = DISABLE;
  hpcd_USB_OTG_FS.Init.battery_charging_enable = DISABLE;
  hpcd_USB_OTG_FS.Init.vbus_sensing_enable = DISABLE;
  hpcd_USB_OTG_FS.Init.use_dedicated_ep1 = DISABLE;
  if (HAL_PCD_Init(&hpcd_USB_OTG_FS) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN USB_OTG_FS_PCD_Init 2 */

  /* USER CODE END USB_OTG_FS_PCD_Init 2 */

}

/* FMC initialization function */
static void MX_FMC_Init(void)
{

  /* USER CODE BEGIN FMC_Init 0 */

  /* USER CODE END FMC_Init 0 */

  FMC_SDRAM_TimingTypeDef SdramTiming = {0};

  /* USER CODE BEGIN FMC_Init 1 */

  /* USER CODE END FMC_Init 1 */

  /** Perform the SDRAM1 memory initialization sequence
  */
  hsdram1.Instance = FMC_SDRAM_DEVICE;
  /* hsdram1.Init */
  hsdram1.Init.SDBank = FMC_SDRAM_BANK1;
  hsdram1.Init.ColumnBitsNumber = FMC_SDRAM_COLUMN_BITS_NUM_9;
  hsdram1.Init.RowBitsNumber = FMC_SDRAM_ROW_BITS_NUM_13;
  hsdram1.Init.MemoryDataWidth = FMC_SDRAM_MEM_BUS_WIDTH_16;
  hsdram1.Init.InternalBankNumber = FMC_SDRAM_INTERN_BANKS_NUM_4;
  hsdram1.Init.CASLatency = FMC_SDRAM_CAS_LATENCY_3;
  hsdram1.Init.WriteProtection = FMC_SDRAM_WRITE_PROTECTION_DISABLE;
  hsdram1.Init.SDClockPeriod = FMC_SDRAM_CLOCK_PERIOD_2;
  hsdram1.Init.ReadBurst = FMC_SDRAM_RBURST_ENABLE;
  hsdram1.Init.ReadPipeDelay = FMC_SDRAM_RPIPE_DELAY_0;
  /* SdramTiming */
  SdramTiming.LoadToActiveDelay = 2;
  SdramTiming.ExitSelfRefreshDelay = 9;
  SdramTiming.SelfRefreshTime = 6;
  SdramTiming.RowCycleDelay = 8;
  SdramTiming.WriteRecoveryTime = 3;
  SdramTiming.RPDelay = 3;
  SdramTiming.RCDDelay = 3;

  if (HAL_SDRAM_Init(&hsdram1, &SdramTiming) != HAL_OK)
  {
    Error_Handler( );
  }

  /* USER CODE BEGIN FMC_Init 2 */
    SDRAM_Initialization_Sequence(&hsdram1);
  /* USER CODE END FMC_Init 2 */
}

/**
  * @brief GPIO Initialization Function
  * @param None
  * @retval None
  */
static void MX_GPIO_Init(void)
{
  GPIO_InitTypeDef GPIO_InitStruct = {0};
  /* USER CODE BEGIN MX_GPIO_Init_1 */

  /* USER CODE END MX_GPIO_Init_1 */

  /* GPIO Ports Clock Enable */
  __HAL_RCC_GPIOE_CLK_ENABLE();
  __HAL_RCC_GPIOI_CLK_ENABLE();
  __HAL_RCC_GPIOF_CLK_ENABLE();
  __HAL_RCC_GPIOH_CLK_ENABLE();
  __HAL_RCC_GPIOA_CLK_ENABLE();
  __HAL_RCC_GPIOB_CLK_ENABLE();
  __HAL_RCC_GPIOG_CLK_ENABLE();
  __HAL_RCC_GPIOD_CLK_ENABLE();
  __HAL_RCC_GPIOC_CLK_ENABLE();

  /*Configure GPIO pin Output Level */
  HAL_GPIO_WritePin(GPIOI, TOUCH_SDA_Pin|TOUCH_SCLK_Pin, GPIO_PIN_RESET);

  /*Configure GPIO pin Output Level */
  HAL_GPIO_WritePin(GPIOH, TOUCH_RST_Pin|LED_Pin, GPIO_PIN_RESET);

  /*Configure GPIO pin Output Level */
  HAL_GPIO_WritePin(TOUCH_INT_GPIO_Port, TOUCH_INT_Pin, GPIO_PIN_RESET);

  /*Configure GPIO pins : TOUCH_SDA_Pin TOUCH_SCLK_Pin */
  GPIO_InitStruct.Pin = TOUCH_SDA_Pin|TOUCH_SCLK_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
  HAL_GPIO_Init(GPIOI, &GPIO_InitStruct);

  /*Configure GPIO pins : TOUCH_RST_Pin LED_Pin */
  GPIO_InitStruct.Pin = TOUCH_RST_Pin|LED_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
  HAL_GPIO_Init(GPIOH, &GPIO_InitStruct);

  /*Configure GPIO pin : TOUCH_INT_Pin */
  GPIO_InitStruct.Pin = TOUCH_INT_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
  HAL_GPIO_Init(TOUCH_INT_GPIO_Port, &GPIO_InitStruct);

  /* USER CODE BEGIN MX_GPIO_Init_2 */

  /* USER CODE END MX_GPIO_Init_2 */
}

/* USER CODE BEGIN 4 */

/* USER CODE END 4 */

 /* MPU Configuration */

void MPU_Config(void)
{
    MPU_Region_InitTypeDef MPU_InitStruct = {0};

    /* Disable MPU */
    HAL_MPU_Disable();

    /*------------------------------------------------------------------*/
    /* Region 0: Default deny-all (background region)                   */
    /*------------------------------------------------------------------*/
    MPU_InitStruct.Enable = MPU_REGION_ENABLE;
    MPU_InitStruct.Number = MPU_REGION_NUMBER0;
    MPU_InitStruct.BaseAddress = 0x00000000;
    MPU_InitStruct.Size = MPU_REGION_SIZE_4GB;
    MPU_InitStruct.SubRegionDisable = 0x00;
    MPU_InitStruct.TypeExtField = MPU_TEX_LEVEL0;
    MPU_InitStruct.AccessPermission = MPU_REGION_NO_ACCESS;
    MPU_InitStruct.DisableExec = MPU_INSTRUCTION_ACCESS_DISABLE;
    MPU_InitStruct.IsShareable = MPU_ACCESS_NOT_SHAREABLE;
    MPU_InitStruct.IsCacheable = MPU_ACCESS_NOT_CACHEABLE;
    MPU_InitStruct.IsBufferable = MPU_ACCESS_NOT_BUFFERABLE;
    HAL_MPU_ConfigRegion(&MPU_InitStruct);

    /*------------------------------------------------------------------*/
    /* Region 1: FLASH (0x08000000, 2MB)                                */
    /*------------------------------------------------------------------*/
    MPU_InitStruct.Enable = MPU_REGION_ENABLE;
    MPU_InitStruct.Number = MPU_REGION_NUMBER1;
    MPU_InitStruct.BaseAddress = 0x08000000;
    MPU_InitStruct.Size = MPU_REGION_SIZE_2MB;
    MPU_InitStruct.TypeExtField = MPU_TEX_LEVEL1;
    MPU_InitStruct.AccessPermission = MPU_REGION_FULL_ACCESS;
    MPU_InitStruct.DisableExec = MPU_INSTRUCTION_ACCESS_ENABLE; // Executable
    MPU_InitStruct.IsShareable = MPU_ACCESS_NOT_SHAREABLE;
    MPU_InitStruct.IsCacheable = MPU_ACCESS_CACHEABLE;
    MPU_InitStruct.IsBufferable = MPU_ACCESS_NOT_BUFFERABLE;
    HAL_MPU_ConfigRegion(&MPU_InitStruct);

    /*------------------------------------------------------------------*/
    /* Region 2: DTCM RAM (0x20000000, 128KB)                           */
    /*------------------------------------------------------------------*/
    MPU_InitStruct.Enable = MPU_REGION_ENABLE;
    MPU_InitStruct.Number = MPU_REGION_NUMBER2;
    MPU_InitStruct.BaseAddress = 0x20000000;
    MPU_InitStruct.Size = MPU_REGION_SIZE_128KB;
    MPU_InitStruct.TypeExtField = MPU_TEX_LEVEL0;
    MPU_InitStruct.AccessPermission = MPU_REGION_FULL_ACCESS;
    MPU_InitStruct.DisableExec = MPU_INSTRUCTION_ACCESS_DISABLE;
    MPU_InitStruct.IsShareable = MPU_ACCESS_NOT_SHAREABLE;
    MPU_InitStruct.IsCacheable = MPU_ACCESS_CACHEABLE;
    MPU_InitStruct.IsBufferable = MPU_ACCESS_NOT_BUFFERABLE;
    HAL_MPU_ConfigRegion(&MPU_InitStruct);

    /*------------------------------------------------------------------*/
    /* Region 3: AXI SRAM (0x24000000, 512KB)                           */
    /*------------------------------------------------------------------*/
    MPU_InitStruct.Enable = MPU_REGION_ENABLE;
    MPU_InitStruct.Number = MPU_REGION_NUMBER3;
    MPU_InitStruct.BaseAddress = 0x24000000;
    MPU_InitStruct.Size = MPU_REGION_SIZE_512KB;
    MPU_InitStruct.TypeExtField = MPU_TEX_LEVEL0;
    MPU_InitStruct.AccessPermission = MPU_REGION_FULL_ACCESS;
    MPU_InitStruct.DisableExec = MPU_INSTRUCTION_ACCESS_DISABLE;
    MPU_InitStruct.IsShareable = MPU_ACCESS_NOT_SHAREABLE;
    MPU_InitStruct.IsCacheable = MPU_ACCESS_CACHEABLE;
    MPU_InitStruct.IsBufferable = MPU_ACCESS_NOT_BUFFERABLE;
    HAL_MPU_ConfigRegion(&MPU_InitStruct);

    /*------------------------------------------------------------------*/
    /* Region 4: SRAM D2 (0x30000000, 288KB)                            */
    /*------------------------------------------------------------------*/
    MPU_InitStruct.Enable = MPU_REGION_ENABLE;
    MPU_InitStruct.Number = MPU_REGION_NUMBER4;
    MPU_InitStruct.BaseAddress = 0x30000000;
    MPU_InitStruct.Size = MPU_REGION_SIZE_256KB; // closest valid size
    MPU_InitStruct.TypeExtField = MPU_TEX_LEVEL0;
    MPU_InitStruct.AccessPermission = MPU_REGION_FULL_ACCESS;
    MPU_InitStruct.DisableExec = MPU_INSTRUCTION_ACCESS_DISABLE;
    MPU_InitStruct.IsShareable = MPU_ACCESS_NOT_SHAREABLE;
    MPU_InitStruct.IsCacheable = MPU_ACCESS_CACHEABLE;
    MPU_InitStruct.IsBufferable = MPU_ACCESS_NOT_BUFFERABLE;
    HAL_MPU_ConfigRegion(&MPU_InitStruct);

    /*------------------------------------------------------------------*/
    /* Region 5: SRAM D3 (0x38000000, 64KB)                             */
    /*------------------------------------------------------------------*/
    MPU_InitStruct.Enable = MPU_REGION_ENABLE;
    MPU_InitStruct.Number = MPU_REGION_NUMBER5;
    MPU_InitStruct.BaseAddress = 0x38000000;
    MPU_InitStruct.Size = MPU_REGION_SIZE_64KB;
    MPU_InitStruct.TypeExtField = MPU_TEX_LEVEL0;
    MPU_InitStruct.AccessPermission = MPU_REGION_FULL_ACCESS;
    MPU_InitStruct.DisableExec = MPU_INSTRUCTION_ACCESS_DISABLE;
    MPU_InitStruct.IsShareable = MPU_ACCESS_NOT_SHAREABLE;
    MPU_InitStruct.IsCacheable = MPU_ACCESS_CACHEABLE;
    MPU_InitStruct.IsBufferable = MPU_ACCESS_NOT_BUFFERABLE;
    HAL_MPU_ConfigRegion(&MPU_InitStruct);

    /*------------------------------------------------------------------*/
    /* Region 6: Peripherals (0x40000000, 512MB)                        */
    /*------------------------------------------------------------------*/
    MPU_InitStruct.Enable = MPU_REGION_ENABLE;
    MPU_InitStruct.Number = MPU_REGION_NUMBER6;
    MPU_InitStruct.BaseAddress = 0x40000000;
    MPU_InitStruct.Size = MPU_REGION_SIZE_512MB;
    MPU_InitStruct.TypeExtField = MPU_TEX_LEVEL0;
    MPU_InitStruct.AccessPermission = MPU_REGION_FULL_ACCESS;
    MPU_InitStruct.DisableExec = MPU_INSTRUCTION_ACCESS_DISABLE; // No exec
    MPU_InitStruct.IsShareable = MPU_ACCESS_SHAREABLE;
    MPU_InitStruct.IsCacheable = MPU_ACCESS_NOT_CACHEABLE;
    MPU_InitStruct.IsBufferable = MPU_ACCESS_BUFFERABLE;
    HAL_MPU_ConfigRegion(&MPU_InitStruct);

    /*------------------------------------------------------------------*/
    /* Region 7: SDRAM (0xC0000000, 32MB)                               */
    /*------------------------------------------------------------------*/
    MPU_InitStruct.Enable = MPU_REGION_ENABLE;
    MPU_InitStruct.Number = MPU_REGION_NUMBER7;
    MPU_InitStruct.BaseAddress = 0xC0000000;
    MPU_InitStruct.Size = MPU_REGION_SIZE_32MB;
    MPU_InitStruct.TypeExtField = MPU_TEX_LEVEL1;
    MPU_InitStruct.AccessPermission = MPU_REGION_FULL_ACCESS;
    MPU_InitStruct.DisableExec = MPU_INSTRUCTION_ACCESS_DISABLE;
    MPU_InitStruct.IsShareable = MPU_ACCESS_NOT_SHAREABLE;
    MPU_InitStruct.IsCacheable = MPU_ACCESS_CACHEABLE; // IMPORTANT for LTDC
    MPU_InitStruct.IsBufferable = MPU_ACCESS_NOT_BUFFERABLE;
    HAL_MPU_ConfigRegion(&MPU_InitStruct);

    /* Enable MPU */
    HAL_MPU_Enable(MPU_PRIVILEGED_DEFAULT);
}



/**
  * @brief  This function is executed in case of error occurrence.
  * @retval None
  */
void Error_Handler(void)
{
  /* USER CODE BEGIN Error_Handler_Debug */
  /* User can add his own implementation to report the HAL error return state */
  __disable_irq();
  while (1)
  {
	  HAL_GPIO_TogglePin(GPIOH, GPIO_PIN_7);
	  HAL_Delay(100);
  }
  /* USER CODE END Error_Handler_Debug */
}
#ifdef USE_FULL_ASSERT
/**
  * @brief  Reports the name of the source file and the source line number
  *         where the assert_param error has occurred.
  * @param  file: pointer to the source file name
  * @param  line: assert_param error line source number
  * @retval None
  */
void assert_failed(uint8_t *file, uint32_t line)
{
  /* USER CODE BEGIN 6 */
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */
  /* USER CODE END 6 */
}
#endif /* USE_FULL_ASSERT */
