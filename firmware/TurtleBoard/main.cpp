/*
 * TODO:
 * Compiler Date/Time is not set correctly on startup using gcc
 */
#include "main.h"
#include "RadioTest.h"
#include <vector>
#include "ProgramInterface.h"
#include "mbed.h"
#include "accumulator.h"
#include "adc.h"
#include "detection_algorithm.h"
#include "SlightlightProtocol.h"
#include "timestamp.h"

#ifdef  FEATURE_NVPROPERTY
#include <NVPropertyProviderInterface.h>
#include "NVProperty.h"
#endif

// saker vi behöver till nästa rev:
// lågpassfilter på båda adc-ingångarna
// sladdarna rätt dragna

extern void RunCommands(int timeout_ms);

DigitalOut greenLED(PB_7);
DigitalOut redLED(PB_5);
InterruptIn buttonIntr(USER_BUTTON);

DigitalInOut radarOff (PB_4);
DigitalInOut lightOff (PB_6);

uint16_t deviceId = 0;
uint64_t lastTurnOnTsp = 0;
uint64_t lastMotionTsp = 0;
uint64_t lastTurnOffTsp = 0;
uint64_t lastTransmissionTsp = 0;

int lightIsOn = 0;

enum
{
    LIGHT_STATE_ON,
    LIGHT_STATE_OFF
};


void on_motion_detected (int32_t factorx128)
{
    dprintf ("MOTION DETECTED! factorx128: %ld", factorx128);
    lastMotionTsp = get_timestamp_in_us ();
    if (lastMotionTsp == 0)
        lastMotionTsp = 1;
}

void switchInput(void) {
    on_motion_detected (-1);
}

int get_node_id (uint16_t addr)
{
    static uint16_t nodes[NUM_NODES] = {0x2bc5, 0x2bc6, 0x2bc7, 0x2bc8, 0x2bc9, 0x2bca, 0x2bcb, 0x2bce, 0x2bcf, 0x2bd0};
    for (int id=0; id<NUM_NODES; id++)
        if (nodes[id] == addr)
            return id;
    return -1;
}

int main()
{
    /*
     * inits the Serial or USBSerial when available (230400 baud).
     * If the serial uart is not is not connected it swiches to USB Serial
     * blinking LED means USBSerial detected, waiting for a connect.
     * It waits up to 30 seconds for a USB terminal connections 
     */

    NVProperty prop;
    uint32_t deviceIdU32 = prop.GetProperty(prop.LORA_DEVICE_ID, 0);
    deviceId = (uint16_t) deviceIdU32;
    if (deviceId != deviceIdU32)
        deviceId = 0xffff; // if we have any nodes with this id in the system we know 16 bits is not enough (and we need to increase)

    detection_algorithm_init (on_motion_detected);
    InitSerial(3*1000, &greenLED, &buttonIntr);
    RunStartup();
    adc_init ();

    dprintf("Welcome to RadioShuttle v%d.%d deviceId:%04lx", RS_MAJOR, RS_MINOR, deviceIdU32);

#if defined (USER_BUTTON_RISE)
    buttonIntr.rise(& switchInput);
#else
    //buttonIntr.fall(& switchInput);
#endif

    //RunCommands(10000);	// check 10 secs for any commands

    radarOff.output ();
    radarOff = 0;

    lightOff.output ();
    lightOff = 0;

    uint16_t adcVal=0;

    slightlight_init ();

    extern NodeCache cache[NUM_NODES];
    int id = get_node_id (deviceId);

    while(true)
    {
        int transmitted = slightlight_poll ();
        if (transmitted)
        {
            wait_ms (500);
            //dprintf ("curbuf: %d", adc_buf_len ());
            adc_empty_buffer ();
            //dprintf ("newbuf: %d", adc_buf_len ());
        }


#undef VERIFY_ADC_FREQUENCY
#ifdef VERIFY_ADC_FREQUENCY
        static uint64_t lastPrintTsp = us_ticker_read ();
        if (us_ticker_read () - lastPrintTsp > 200000)
        {
            lastPrintTsp = us_ticker_read ();
            int sps = adc_get_actual_sample_frequency ();
            dprintf("foo %u sps: %d", adcVal, sps);
        }
#endif

        uint64_t tsp = get_timestamp_in_us ();
        int neighbourIsLit = 0;
        if (id > 0)
        {
            uint32_t timeSincePacketReceived = (uint32_t) ((get_timestamp_in_us () - cache[id - 1].tsp));
            uint32_t timeSinceLastMotion     = timeSincePacketReceived + cache[id - 1].packet.timeSinceLastMotion * 1000000;
            if (timeSinceLastMotion < 5000000)
                neighbourIsLit = 1;
        }
        if (id < NUM_NODES - 1)
        {
            uint32_t timeSincePacketReceived = (uint32_t) ((get_timestamp_in_us () - cache[id + 1].tsp));
            uint32_t timeSinceLastMotion     = timeSincePacketReceived + (uint32_t) cache[id + 1].packet.timeSinceLastMotion * 1000000;
            if (timeSinceLastMotion < 5000000)
                neighbourIsLit = 1;
        }

        if (((tsp - lastMotionTsp < 5000000) || neighbourIsLit) && get_timestamp_in_us () > 5000000)
        {
            lightOff.output ();
            lightOff = 0;
            redLED = 1;
            if (!lightIsOn)
            {
                lightIsOn = 1;
                lastTurnOnTsp = tsp;
                dprintf ("TURNING LIGHT ON self:%d neighbour:%d", tsp - lastMotionTsp < 5000000, neighbourIsLit);
                wait_ms (500);
                adc_empty_buffer ();
            }
        }
        else
        {
            redLED = 0;
            lightOff.input ();
            if (lightIsOn)
            {
                lightIsOn = 0;
                lastTurnOffTsp = tsp;
                dprintf ("TURNING LIGHT OFF");
                wait_ms (500);
                adc_empty_buffer ();
            }
        }

        if (adc_get_and_reset_oflow_flag ())
        {
            for (int i=0; i<40; i++)
                dprintf ("OVERFLOW");
        }

        int i=0;
        for (i=0; i<ADC_BUF_SIZE && adc_get_noblock (& adcVal); i++)
            detection_algorithm_feed (adcVal);
        if (i == ADC_BUF_SIZE)
            dprintf ("queue_pop error? oflow=%d", adc_get_and_reset_oflow_flag ());
        wait_ms (1);
    }
}
