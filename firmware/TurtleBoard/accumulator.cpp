#include "main.h"
#include "accumulator.h"

void init_accumulator (Accumulator *acc, void (*on_accumulation_done) (int32_t value), int nSamples)
{
    acc->on_accumulation_done = on_accumulation_done;
    acc->nSamples = nSamples;
    acc->sum = 0.0;
    acc->cnt = 0;
}

int accumulate (Accumulator *acc, int32_t value)
{
    acc->sum += value;
    acc->cnt ++;

    if (acc->cnt >= acc->nSamples)
    {
        acc->on_accumulation_done (acc->sum);
        acc->sum = 0;
        acc->cnt = 0;
        return 1;
    }

    return 0;
}

