/*
 / _____)             _              | |
( (____  _____ ____ _| |_ _____  ____| |__
 \____ \| ___ |    (_   _) ___ |/ ___)  _ \
 _____) ) ____| | | || |_| ____( (___| | | |
(______/|_____)_|_|_| \__)_____)\____)_| |_|
    ( C )2014 Semtech

Description: Contains the callbacks for the IRQs and any application related details

License: Revised BSD License, see LICENSE.TXT file include in the project

Maintainer: Miguel Luis and Gregory Cristian
*/
#ifndef __SX1276PINGPONG_H__
#define __SX1276PINGPONG_H__

int SX1276BasicTXRX(void);
#ifdef FEATURE_LORA_PING_PONG
 int SX1276PingPong(void);
#else
 #define  SX1276PingPong(x)   void()
#endif
/*
 * Callback functions prototypes
 */
/*!
 * @brief Function to be executed on Radio Tx Done event
 */
void OnTxDone(void *radio, void *userThisPtr, void *userData);

/*!
 * @brief Function to be executed on Radio Rx Done event
 */
void OnRxDone(void *radio, void *userThisPtr, void *userData, uint8_t *payload, uint16_t size, int16_t rssi, int8_t snr );

/*!
 * @brief Function executed on Radio Tx Timeout event
 */
void OnTxTimeout(void *radio, void *userThisPtr, void *userData);

/*!
 * @brief Function executed on Radio Rx Timeout event
 */
void OnRxTimeout(void *radio, void *userThisPtr, void *userData);

/*!
 * @brief Function executed on Radio Rx Error event
 */
void OnRxError(void *radio, void *userThisPtr, void *userData);

void OnFhssChangeChannel (void *radio, void *userThisPtr, void *userData, uint8_t currentChannel );
void OnCadDone (void *radio, void *userThisPtr, void *userData, bool channelActivityDetected );

/*!
 * @brief Function executed on Radio Fhss Change Channel event
 */
void OnFhssChangeChannel(void *radio, void *userThisPtr, void *userData, uint8_t channelIndex );

enum
{
    STATE_UNDEFINED,
    STATE_OFF,
    STATE_ON_DUE_TO_MOTION,
    STATE_ON_DUE_TO_NEIGHBOUR
};

typedef struct
{
    uint8_t value;
    uint8_t age; // seconds
} Parameter;

typedef struct
{
    uint32_t  magic0;
    uint16_t  srcAddress;
    uint16_t  timeSinceLastMotion;
    uint8_t   state;
    Parameter params[3];
    uint32_t  crc32;
} Packet;

typedef struct
{
    Packet packet;
    uint64_t tsp;
} NodeCache;

void slightlight_init (void);
int  slightlight_poll (void);

#endif // __MAIN_H__
