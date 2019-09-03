/*
 * process_entry.h
 *
 *  Created on: Jan 18, 2014 3:35:54 PM
 *      Author: Mike
 */

#ifndef PROCESS_ENTRY_H_
#define PROCESS_ENTRY_H_

void vProcessNewKey(alt_u8 ubChar);
void vInitializePWMs(void);
void processing(alt_u32 a,alt_u32 b, alt_u32 c, alt_u32 d, alt_u32 e, alt_u32 f, alt_u32 g );
alt_u32 filter(alt_u32 a, alt_u32 b);
void vSetThrottle(alt_u32 ulPwmValue);
void vSetServoPWM(alt_u32 ulPwmValue);
#endif /* PROCESS_ENTRY_H_ */
