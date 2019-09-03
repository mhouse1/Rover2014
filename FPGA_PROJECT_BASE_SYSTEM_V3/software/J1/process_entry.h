/*
 * process_entry.h
 *
 *  Created on: Jan 18, 2014 3:35:54 PM
 *      Author: Mike
 */

#ifndef PROCESS_ENTRY_H_
#define PROCESS_ENTRY_H_

void vProcessNewKey(UBYTE ubChar);
void vInitializePWMs(void);
void processing(ULONG a,ULONG b, ULONG c, ULONG d, ULONG e, ULONG f, ULONG g );
ULONG filter(ULONG a, ULONG b);
void vSetThrottle(ULONG ulPwmValue);
void vSetServoPWM(ULONG ulPwmValue);
#endif /* PROCESS_ENTRY_H_ */
