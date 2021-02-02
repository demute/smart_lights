#include "adc.h"
#include "timestamp.h"


// FIXME: This whole file is a big fixme: We don't want to use the ADC in this way,
// instead, we should do it in the "mbed os"-way whatever that is. Problem is, I haven't
// found any documentation describing how I can use interrupt driven ADC in continuous
// conversion mode, sampling frequency 8000 SPS. That said, this whole file should be
// refactored.

static ADC_HandleTypeDef hadc1;
static uint16_t buf[ADC_BUF_SIZE];
static int bufHead = 0;
static int bufTail = 0;

static uint32_t m = 0;
static uint64_t nextTsp = 0;
static uint32_t lc = 0;

static uint64_t startTsp = 0;

int oflow = 0;
uint16_t raw = 0;

static void queue_push (uint16_t val)
{
    buf[bufHead] = val;
    bufHead = (bufHead + 1) % ADC_BUF_SIZE;
    if (bufHead == bufTail)
        oflow = 1;
}

int adc_get_noblock (uint16_t *val)
{
    if (bufHead == bufTail)
        return 0;
    else
    {
        *val = buf[bufTail];
        bufTail = (bufTail + 1) % ADC_BUF_SIZE;
        return 1;
    }
}

void adc_empty_buffer (void)
{
    __disable_irq ();
    bufHead = 0;
    bufTail = 0;
    __enable_irq ();
}

int adc_buf_len (void)
{
    return (ADC_BUF_SIZE + bufHead - bufTail) % ADC_BUF_SIZE;
}

extern "C" void ADC1_IRQHandler()
{
    HAL_ADC_IRQHandler(&hadc1);
}

void Error_Handler (void)
{
    while (1)
        dprintf ("error");
}


void adc_init (void)
{
    // FIXME: This function does not do all the magic!
    // If the line below is not being run, the adc gets
    // inside the Error_Handler...
    AnalogIn adc(PB_1);

    ADC_ChannelConfTypeDef sConfig = {0};
    hadc1.Instance = ADC1;
    hadc1.Init.ScanConvMode = ADC_SCAN_DISABLE;
    hadc1.Init.ContinuousConvMode = DISABLE;
    hadc1.Init.DiscontinuousConvMode = DISABLE;
    hadc1.Init.ExternalTrigConv = ADC_SOFTWARE_START;
    hadc1.Init.DataAlign = ADC_DATAALIGN_RIGHT;
    hadc1.Init.NbrOfConversion = 1;
    if (HAL_ADC_Init(&hadc1) != HAL_OK)
    {
        Error_Handler();
    }

    sConfig.Channel = ADC_CHANNEL_16;
    sConfig.Rank = ADC_REGULAR_RANK_1;
    sConfig.SamplingTime = ADC_SAMPLETIME_640CYCLES_5;
    if (HAL_ADC_ConfigChannel(&hadc1, &sConfig) != HAL_OK)
    {
        Error_Handler();
    }


    NVIC_SetVector(ADC1_IRQn, (uint32_t)& ADC1_IRQHandler);      //Attach ADC interrupt service routine
    NVIC_EnableIRQ(ADC1_IRQn);                                  //Enable ADC interrupt requests    
    HAL_ADCEx_Calibration_Start(&hadc1, ADC_SINGLE_ENDED);

    nextTsp = get_timestamp_in_us ();
    startTsp = nextTsp;
    HAL_ADC_Start_IT(&hadc1);
}

void HAL_ADC_ConvCpltCallback(ADC_HandleTypeDef* hadc)
{
    static uint16_t sum = 0;
    static uint16_t cnt = 0;

    if (cnt < 8)
    {
        sum += HAL_ADC_GetValue(&hadc1);
        cnt++;
    }

    uint64_t tsp = get_timestamp_in_us ();
    if (tsp > nextTsp)
    {
        nextTsp += PERIOD_TIME_US;
        raw = (cnt == 8) ? sum >> 3 : sum / cnt;
        if (cnt != 8)
            debug ("CNT %d", cnt);
        lc = cnt;
        sum = 0;
        cnt = 0;
        m++;
        queue_push (raw);
    }
    HAL_ADC_Start_IT(&hadc1);
}

int adc_get_actual_sample_frequency (void)
{
    uint64_t tsp = get_timestamp_in_us ();
    int sps = (1000000 * (uint64_t) m) / (tsp - startTsp);
    //dprintf ("(1000000 * (uint64_t) %llu) / (%llx - %llx) = %d", (uint64_t) m, tsp, startTsp, sps);
    return sps;
}

int adc_get_and_reset_oflow_flag (void)
{
    int ret = oflow;
    oflow = 0;
    return ret;
}
