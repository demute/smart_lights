#ifndef _ACCUMULATOR_H_
#define _ACCUMULATOR_H_

#include "main.h"

typedef struct
{
    void (*on_accumulation_done) (int32_t value);
    int   nSamples;

    int32_t sum;
    int      cnt;

} Accumulator;

void init_accumulator (Accumulator *acc, void (*on_accumulation_done) (int32_t value), int nSamples);
int accumulate (Accumulator *acc, int32_t value);

#endif /* _ACCUMULATOR_H_ */
