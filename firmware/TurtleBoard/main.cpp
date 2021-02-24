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

#define MOTION_TIMEOUT_US (40 * 1000000)

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
uint64_t lastStateChangeTsp = 0;
uint64_t lastTurnOnTsp = 0;
uint64_t lastMotionTsp = 0;
uint64_t lastTurnOffTsp = 0;
uint64_t lastTransmissionTsp = 0;
int      nodeState = STATE_OFF;

void turn_light_on (void)
{
    lightOff.output ();
    lightOff = 0;
    //redLED = 1;
}

void turn_light_off (void)
{
    lightOff.input ();
    //redLED = 0;
}

int update_node_state (uint8_t newState)
{
    switch (newState)
    {
     case STATE_OFF:                 turn_light_off (); break;
     case STATE_ON_DUE_TO_MOTION:    turn_light_on (); break;
     case STATE_ON_DUE_TO_NEIGHBOUR: turn_light_on (); break;
     default: dprintf ("unknown state"); return 0;
    }
    int stateChanged = (nodeState != newState);
    nodeState = newState;
    if (stateChanged)
        lastStateChangeTsp = get_timestamp_in_us ();
    return stateChanged;
}

void on_motion_detected (int32_t powerAboveBackround_s1677721600)
{
    dprintf ("MOTION DETECTED! powerAboveBackround_s1677721600: %lf", powerAboveBackround_s1677721600 * 1e-6);
    lastMotionTsp = get_timestamp_in_us ();
    if (lastMotionTsp == 0)
        lastMotionTsp = 1;
}

void switchInput(void) {
    on_motion_detected (-1);
}

int get_node_id (uint16_t addr)
{                                    //    0       1       2       3       4       5       6       7       8       9
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
    InitSerial(15*1000, &greenLED, &buttonIntr);
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

    update_node_state (STATE_OFF);

    uint16_t adcVal=0;

    slightlight_init ();

    extern NodeCache cache[NUM_NODES];
    int id = get_node_id (deviceId);

    while(true)
    {
        slightlight_poll ();
        //uint32_t elapsedUsSinceTurnOn = (uint32_t) (get_timestamp_in_us () - lastTurnOnTsp);
        //if (transmitting)
        //{
        //    if (elapsedUsSinceTurnOn < 5000000)
        //        wait_ms (500);
        //    //dprintf ("curbuf: %d", adc_buf_len ());
        //    adc_empty_buffer ();
        //    //dprintf ("newbuf: %d", adc_buf_len ());
        //}

        static uint64_t lastPrintTsp = us_ticker_read ();
        if (us_ticker_read () - lastPrintTsp > 1000000)
        {
            lastPrintTsp = us_ticker_read ();
            char header[32] = {0};
            char states[32] = {0};
            char *ph = header, *ps = states;
            cache[id].packet.state = nodeState;
            for (int id2=0; id2<10; id2++)
            {
                char s;
                switch (cache[id2].packet.state)
                {
                 case STATE_UNDEFINED:
                     continue;
                 case STATE_OFF:
                     s = '-';
                     break;
                 case STATE_ON_DUE_TO_MOTION:
                 {
                     uint32_t timeSincePacketReceived = (uint32_t) ((get_timestamp_in_us () - cache[id2].tsp));
                     uint32_t timeSinceLastMotion = timeSincePacketReceived + cache[id2].packet.timeSinceLastMotion * 1000000;
                     s = (timeSinceLastMotion < MOTION_TIMEOUT_US) ? '#' : '-';
                     break;
                 }
                 case STATE_ON_DUE_TO_NEIGHBOUR:
                     s = '+';
                     break;
                 default:
                     s = '?';
                     break;
                }

                ph += sprintf (ph, "%s%d", (id2?" ":""), id2);
                ps += sprintf (ps, "%s%c", (id2?" ":""), s);
            }
            dprintf ("Luminaire id:    %s", header);
            dprintf ("Luminaire state: %s", states);
        }

        uint64_t tsp = get_timestamp_in_us ();
        int neighbourDetectedMotion = 0;
        int leftNeighbourId  = id - 1;
        int rightNeighbourId = id + 1;
        while (leftNeighbourId >= 0 && cache[leftNeighbourId].packet.state == STATE_UNDEFINED)
            leftNeighbourId--;
        while (rightNeighbourId < NUM_NODES && cache[rightNeighbourId].packet.state == STATE_UNDEFINED)
            rightNeighbourId++;

        if (leftNeighbourId >= 0)
        {
            uint32_t timeSincePacketReceived = (uint32_t) ((get_timestamp_in_us () - cache[leftNeighbourId].tsp));
            uint32_t timeSinceLastMotion     = timeSincePacketReceived + cache[leftNeighbourId].packet.timeSinceLastMotion * 1000000;
            if (timeSinceLastMotion < MOTION_TIMEOUT_US)
                neighbourDetectedMotion = 1;
        }
        if (rightNeighbourId < NUM_NODES)
        {
            uint32_t timeSincePacketReceived = (uint32_t) ((get_timestamp_in_us () - cache[rightNeighbourId].tsp));
            uint32_t timeSinceLastMotion     = timeSincePacketReceived + (uint32_t) cache[rightNeighbourId].packet.timeSinceLastMotion * 1000000;
            if (timeSinceLastMotion < MOTION_TIMEOUT_US)
                neighbourDetectedMotion = 1;
        }

        if (tsp - lastMotionTsp < MOTION_TIMEOUT_US)
        {
            int lastState = nodeState;
            if (update_node_state (STATE_ON_DUE_TO_MOTION))
            {
                dprintf ("changed state to STATE_ON_DUE_TO_MOTION");
                if (lastState == STATE_OFF)
                    lastTurnOnTsp = tsp;
            }
        }
        else if (neighbourDetectedMotion)
        {
            int lastState = nodeState;
            if (update_node_state (STATE_ON_DUE_TO_NEIGHBOUR))
            {
                dprintf ("changed state to STATE_ON_DUE_TO_NEIGHBOUR");
                if (lastState == STATE_OFF)
                    lastTurnOnTsp = tsp;
            }
        }
        else
        {
            if (update_node_state (STATE_OFF))
            {
                lastTurnOffTsp = tsp;
                dprintf ("TURNING LIGHT OFF");
            }
        }

        if (adc_get_and_reset_oflow_flag ())
        {
            for (int i=0; i<40; i++)
                dprintf ("OVERFLOW");
        }

        int transientsMayExist =  (tsp - lastTurnOnTsp       < 500000) ||
                                  (tsp - lastTurnOffTsp      < 500000) ||
                                  (tsp - lastTransmissionTsp < 500000);

        if (transientsMayExist)
            adc_empty_buffer ();
        else
        {
            int i=0;
            for (i=0; i<ADC_BUF_SIZE && adc_get_noblock (& adcVal); i++)
                detection_algorithm_feed (adcVal);
            if (i == ADC_BUF_SIZE)
                dprintf ("queue_pop error? oflow=%d", adc_get_and_reset_oflow_flag ());
        }

        wait_ms (1);
    }
}
