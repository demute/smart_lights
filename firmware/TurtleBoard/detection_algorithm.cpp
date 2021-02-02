#include "main.h"
#include "accumulator.h"
#include "detection_algorithm.h"
#include "timestamp.h"


static Accumulator meanPowerAccumulator;
static Accumulator acPowerDownsamplerTo10Hz;
static Accumulator dcBiasAccumulator;
static Accumulator downsamplerTo2kHz;

static int32_t idlePower_s1677721600 = 0;
static int32_t dcBias_u32768 = 0;

static void (*motion_detected_cb) (int32_t factorx128);


void on_mean_power (int32_t meanPower_s1677721600) // 0.65 Hz
{
    // * om aktuellt 1s-fönster har högre energi går vi exponentiellt mot det högre värdet, om aktuellt fönster har lägre energi uppdaterar vi lägsta värdet direkt
    if (idlePower_s1677721600 > meanPower_s1677721600 || get_timestamp_in_us () < 10000000)
    {
        //debug ("meanPower_s1677721600: %ld (flush)", meanPower_s1677721600);
        idlePower_s1677721600 = meanPower_s1677721600;
    }
    else
    {
        // in order to apply exponential smoothing with a halflife of 1 minute, we scale the factor
        // a = 2^(-0.65/60) with 2^31 and shift the result 31 positions when done. For floating
        // point numbers, this would look like a=pow(2.0,-0.65/60); smoothed=a*smoothed+(1.0-a)*newValue

        int64_t a_s32bits = 2131418384; // 2^(-0.65/60)*2^31
        int64_t aResidual_s32bits = 16065264;

        //debug ("\nidlePower_s28800: %ld (before)", idlePower_s1677721600);
        //debug ("meanPower_s1677721600: %ld (affected by)", meanPower_s1677721600);

        idlePower_s1677721600 = (int32_t) ((a_s32bits         * (int64_t) idlePower_s1677721600 +
                                            aResidual_s32bits * (int64_t) meanPower_s1677721600) >> 31);

        // if meanPower_s1677721600 is less than 1/(1-2^(-0.65/60)) = 133.67 (unlikely low)
        // aResidual_s32bits * meanPower_s1677721600 will be truncated to zero after shift.
        // Make sure that doesn't happen.
        idlePower_s1677721600 += 1;

        //debug ("idlePower_s1677721600: %ld (after)", idlePower_s1677721600);
    }
}

void on_ac_power_10Hz (int32_t acPower_s1677721600)
{
    //debug ("acPower_s1677721600: %ld (%f)", acPower_s1677721600, (double) acPower_s1677721600 / (double) (1u<<31u));
    //return;

    accumulate (& meanPowerAccumulator, acPower_s1677721600 >> 4);

    int32_t factorx128 = acPower_s1677721600 / (idlePower_s1677721600 >> 7);
    //debug ("acPower_s1677721600: %ld idlePower_s1677721600: %ld powerFactor x 128: %ld", acPower_s1677721600, idlePower_s1677721600, factorx128);

    // if current power is higher than 3.5 x idlePower, define it as motion detected
    // factorx128 has mean value 128 => 3.5 * 128 = 448

    if (factorx128 > 450)
    {
        motion_detected_cb (factorx128);
    }
}

void on_dc_bias (int32_t dcBias_u67108864)
{
    dcBias_u32768 = dcBias_u67108864 >> 11;
}

void on_mean_2khz (int32_t halfMean_u16384)
{
    // As we want to represent samples up to 1 kHz, we have to sample in 2 kHz
    // and have a pole at 1 kHz, that's why the input to this function is only
    // half.

    static int32_t lastHalfMean_u16384 = 0.0;
    int32_t mean2kHz_u32768 = lastHalfMean_u16384 + halfMean_u16384; // bandwidth of this signal is 1 kHz
    lastHalfMean_u16384 = halfMean_u16384;

    if (accumulate (& dcBiasAccumulator, mean2kHz_u32768))
    {
        //debug ("h: %ld", halfMean_u16384);
    }

    int32_t acValue2kHz_s65536  = mean2kHz_u32768 - dcBias_u32768;
    int32_t acPower2kHz_s8388608 = ((acValue2kHz_s65536 >> 1) * (acValue2kHz_s65536 >> 1)) >> 7; // (32768*96/2^7)^2/32768/2^7 = 144
    //debug ("acValue2kHz_s65536: %10ld acPower2kHz_s8388608: %10ld dcBias_u32768: %10ld mean2kHz_u32768: %10ld", acValue2kHz_s65536, acPower2kHz_s8388608, dcBias_u32768, mean2kHz_u32768);
    accumulate (& acPowerDownsamplerTo10Hz, acPower2kHz_s8388608);

}

void detection_algorithm_init (void (*_motion_detected_cb) (int32_t factorx128))
{
    motion_detected_cb = _motion_detected_cb;
    init_accumulator (& meanPowerAccumulator, on_mean_power, 16);
    init_accumulator (& acPowerDownsamplerTo10Hz, on_ac_power_10Hz, 200);
    init_accumulator (& dcBiasAccumulator, on_dc_bias, 2048);
    init_accumulator (& downsamplerTo2kHz, on_mean_2khz, 4);
}

void detection_algorithm_feed (int16_t val_u4096) // feed this at 8 kHz
{
    accumulate (& downsamplerTo2kHz, (int32_t) val_u4096);
    //debug ("detection algo feed %d", val_u4096);
}
