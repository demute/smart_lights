#ifndef _DETECTION_ALGORITHM_H_
#define _DETECTION_ALGORITHM_H_

#include "main.h"

void detection_algorithm_init (void (*_motion_detected_cb) (int32_t factorx1024));
void detection_algorithm_feed (int16_t val);

#endif /* _DETECTION_ALGORITHM_H_ */
