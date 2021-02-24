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
        // is slightly lower than lastUs, even if us_ticker_read has not overflowed...
        // as a workaround, make sure us is less than lastUs for the reason of overflow
        // and not just small fluctuations. That's why we're comparing
        // (us + 1000000 < lastUs) as well.
        //
        // however, for data type reasons we want get_timestamp_in_us to report
        // a time which is monotonically increasing. If us < lastUs not due to an overflow,
        // we want to use lastUs instead.

        offset += ((uint64_t) 1) << ((uint64_t) 32);
        lastUs = us;
    }
    else if (us > lastUs)
        lastUs = us;

    return offset + lastUs;
}

uint64_t get_timestamp_in_ms (void)
{
    return get_timestamp_in_us () / 1000;
}

uint32_t get_timestamp_in_sec (void)
{
    return (uint32_t) (get_timestamp_in_us () / 1000000);
}

