#ifndef _ADC_H_
#define _ADC_H_

#include "main.h"

#define ADC_BUF_SIZE 16384
#define SAMPLE_FREQUENCY 8000
#define PERIOD_TIME_US (1000000 / SAMPLE_FREQUENCY)

void adc_init (void);
int  adc_get_noblock (uint16_t *val);
int  adc_get_actual_sample_frequency (void);
int  adc_get_and_reset_oflow_flag (void);
void adc_empty_buffer (void);
int adc_buf_len (void);

#endif /* _ADC_H_ */
