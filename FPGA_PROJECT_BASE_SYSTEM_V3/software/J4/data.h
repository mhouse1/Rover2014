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
	alt_u8	ubEnableDisplay;
	alt_u8	ubEntryMode;
	alt_u16 ubCount;
	alt_u32	ulAccumulate;
};

struct DATA_STRUCT
{
	alt_u32 ulServoPWM_C;//Current value
	alt_u32 ulServoPWM_O;//Old value
	alt_u32	ulServoMin;
	alt_u32	ulServoMax;
	alt_u32 ulServoNeutral;
	alt_u32 ulDistance_Real;
	alt_u32 ulDistance_Old;
	alt_u32 ulDistanceLimit;
	alt_u32 ulThrottlePWM_C;//current value
	alt_u32 ulThrottleMin;
	alt_u32 ulThrottleMax;
	alt_u32 ulThrottleNeutral;
	union
	{
		alt_u32 ulControl;
	    struct
	    {
	    	alt_u32  testOrNormal:1; //bit 1
	    	alt_u32  distance_reset:1;
	    	alt_u32  automatic:1;
	    	alt_u32  unused     :29; //bit 2 to 32
	    } sBits;
	};
};
/*! 6 channel receiver */
struct RCVR_STRUCT
{
	alt_u32 ulChannel1;
	alt_u32 ulChannel2;
	alt_u32 ulChannel3;
	alt_u32 ulChannel4;
	alt_u32 ulChannel5;
	alt_u32 ulChannel6;
};

/*! 8 channel ADC values */
struct ADC_STRUCT
{
	alt_u32 ulADC1;
	alt_u32 ulADC2;
	alt_u32 ulADC3;
	alt_u32 ulADC4;
	alt_u32 ulADC5;
	alt_u32 ulADC6;
	alt_u32 ulADC7;
	alt_u32 ulADC8;

};
#endif /* DATA_H_ */
