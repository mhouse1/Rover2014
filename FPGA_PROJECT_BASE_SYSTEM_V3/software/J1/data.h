/*
 * data.h
 *
 *  Created on: Jan 18, 2014 3:45:44 PM
 *      Author: Mike
 */

#ifndef DATA_H_
#define DATA_H_

/*! Serial User Interface */
struct SUI_STRUCT
{
	UBYTE	ubEnableDisplay;
	UBYTE	ubEntryMode;
	UWORD ubCount;
	ULONG	ulAccumulate;
};

struct DATA_STRUCT
{
	ULONG ulServoPWM_C;//Current value
	ULONG ulServoPWM_O;//Old value
	ULONG	ulServoMin;
	ULONG	ulServoMax;
	ULONG ulServoNeutral;
	ULONG ulDistance_Real;
	ULONG ulDistance_Old;
	ULONG ulDistanceLimit;
	ULONG ulThrottlePWM_C;//current value
	ULONG ulThrottleMin;
	ULONG ulThrottleMax;
	ULONG ulThrottleNeutral;
	union
	{
		ULONG ulControl;
	    struct
	    {
	    	ULONG  testOrNormal:1; //bit 1
	    	ULONG  distance_reset:1;
	    	ULONG  automatic:1;
	    	ULONG  unused     :29; //bit 2 to 32
	    } sBits;
	};
};
/*! 6 channel receiver */
struct RCVR_STRUCT
{
	ULONG ulChannel1;
	ULONG ulChannel2;
	ULONG ulChannel3;
	ULONG ulChannel4;
	ULONG ulChannel5;
	ULONG ulChannel6;
};

/*! 8 channel ADC values */
struct ADC_STRUCT
{
	ULONG ulADC1;
	ULONG ulADC2;
	ULONG ulADC3;
	ULONG ulADC4;
	ULONG ulADC5;
	ULONG ulADC6;
	ULONG ulADC7;
	ULONG ulADC8;

};
#endif /* DATA_H_ */
