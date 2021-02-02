#include "main.h"
#include "mbed.h"
#include "timestamp.h"

uint64_t get_timestamp_in_us (void)
{
    uint32_t us = us_ticker_read ();
    static uint64_t offset = 0;
    static uint32_t lastUs = 0;

    if (us < lastUs && us + 1000000 < lastUs)
    {
        // sometimes, us_ticker_read can report a value which
        // is lower than lastUs, even if us_ticker_read has not overflowed...
        // that's why we're also comparing us + 1000000 < lastUs.

        offset += ((uint64_t) 1) << ((uint64_t) 32);
    }
    lastUs = us;

    return offset + us;
}

uint64_t get_timestamp_in_ms (void)
{
    return get_timestamp_in_us () / 1000;
}

uint32_t get_timestamp_in_sec (void)
{
    return (uint32_t) (get_timestamp_in_us () / 1000000);
}

