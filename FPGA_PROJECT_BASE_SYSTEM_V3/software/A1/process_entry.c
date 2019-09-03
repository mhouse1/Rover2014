/*
 * process_entry.c
 *
 *  Created on: Jan 18, 2014 3:36:51 PM
 *      Author: Mike
 */

#include "alt_types.h"
#include "data.h"
#include "process_entry.h"
#include "print_functions.h"
#include "print_screens.h"
#include "constants.h"
#include "slave_template_macros.h"
#include "system.h"
#include "altera_avalon_pio_regs.h"
/*----------------------------------------------------------------------------
 **  External Variable References
 **
 **  Public variables declared in other modules and used in this module
 **--------------------------------------------------------------------------*/
extern struct SUI_STRUCT		sSUI;	// Serial User Interface
extern struct DATA_STRUCT	sDATA;	// General data

void vEchoChar(alt_u8 ubChar);
void vEraseCommand(void);
void vMonitorDiagnostic(alt_u8 ubChar);
void vProcessInputValue(alt_u8 ubChar);


/*!
 * @brief 	Key has been entered, decide what to do with it.
 * @note 	Serial User Interface updated
 * @param  	[in] ubChar The key entered.
 */
void vProcessNewKey(alt_u8 ubChar)
{
	// Test for Control C to toggle display update
	if (ubChar == 3)
	{
		sSUI.ubEnableDisplay  = sSUI.ubEnableDisplay ? 0 : 1;
		//when display is toggle, if toggled to on, refresh the display
		if (sSUI.ubEnableDisplay)
		{
			vPrintStaticScreen1();
		}
		return;
	}
	switch(sSUI.ubEntryMode)
	{
	case ENTRY_MODE_D: 			// Development screen is being displayed
		vMonitorDiagnostic(ubChar); 	// set Dev screen input entry mode
		break;
		//-----------------------------------------------------------------
		// build a decimal value for these entry modes
		//-----------------------------------------------------------------
	case ENTRY_MODE_S:
	case ENTRY_MODE_T:
	case ENTRY_MODE_X:

		vProcessInputValue(ubChar);
		break;
	}
}
void vMonitorDiagnostic(alt_u8 ubChar)
{
	// Test for s for servo control
	if (ubChar == 'v')
	{
		sSUI.ubEntryMode = ENTRY_MODE_S;
	}
	else if (ubChar == 'V')
	{
		sSUI.ubEntryMode = ENTRY_MODE_T;
	}
	else if (ubChar == 'x')
	{

		sSUI.ubEntryMode = ENTRY_MODE_X;
	}
	else if(ubChar == 't')
	{
					//now in test mode
		            //edit header
					//          1         2         3         4         5         6         7         8
					// 12345678901234567890123456789012345678901234567890123456789012345678901234567890
                                                  vPrintTxt( 1, 51, 80, "Press [n] to enter normal mode"); // 1
 sDATA.sBits.testOrNormal = TEST;
	}
	else if(ubChar == 'n')
	{
		           //normal

		           //now in normal mode
				   //edit header
		           //          1         2         3         4         5         6         7         8
		           // 12345678901234567890123456789012345678901234567890123456789012345678901234567890
                                                 vPrintTxt( 1, 51, 80, "Press [t] to enter test mode  "); // 1
sDATA.sBits.testOrNormal = NORMAL;
	}
	else
	{	//not a valid input for diagnostic screen
		vEchoChar(7);	 				// sound bell (echo Control G)
		return;
	}
	vEchoChar(ubChar); //echo the valid character just entered
}

/*!
 * @brief	Process input character, when enter key is pressed perform an action
 * @param 	ubChar input character from HyperTerminal
 */
void vProcessInputValue(alt_u8 ubChar)
{

	// Test for 0..9 to build the decimal value
	if ((ubChar >= '0') && (ubChar <= '9'))
	{
		vCursor(2,2+sSUI.ubCount);
		vPutChar(ubChar);					// Echo the numeric value

		sSUI.ulAccumulate = sSUI.ulAccumulate * 10 + ubChar - '0';
		sSUI.ubCount++;
		//printf("accumulated value %d\n", sSUI.swAccum);
	}

	else if (ubChar == 13)//13 is enter key
	{
		vEraseCommand();				// Erase the command line
		switch(sSUI.ubEntryMode)
		{
		case ENTRY_MODE_S:
			vSetServoPWM(sSUI.ulAccumulate);
			break;
		case ENTRY_MODE_T:
			vSetThrottle(sSUI.ulAccumulate);
			break;
		case ENTRY_MODE_X:
			sDATA.ulDistanceLimit = sSUI.ulAccumulate;
			break;
		}

		sSUI.ulAccumulate = 0;
		sSUI.ubEntryMode = ENTRY_MODE_D;
	} // end of <Enter Key>

	// Invalid entry, abort entry of decimal value
	else
	{
		vEraseCommand();				// Erase the command line
		sSUI.ulAccumulate = 0;
		sSUI.ubEntryMode = ENTRY_MODE_D;
	}
}

void vInitializePWMs()
{
	sDATA.ulServoNeutral = 2458;//1.5ms
	sDATA.ulServoPWM_C = sDATA.ulServoNeutral;
	sDATA.ulServoMax = 2703; //1.65ms
	sDATA.ulServoMin = 1966; //1.2ms

	sDATA.ulDistanceLimit = 10;
	sDATA.ulThrottleNeutral = 2457; //1.5ms
	sDATA.ulThrottlePWM_C = sDATA.ulThrottleNeutral;
	sDATA.ulThrottleMax = 3276;
	sDATA.ulThrottleMin = 1638;

	sDATA.sBits.testOrNormal = TEST;

	IOWR_32DIRECT(SLAVE_TEMPLATE_0_BASE, (DATA_OUT_14 * 4), (alt_u32)sDATA.ulServoPWM_C);//PWM_Steering);
	IOWR_32DIRECT(SLAVE_TEMPLATE_0_BASE, (DATA_OUT_15 * 4), (alt_u32)sDATA.ulThrottlePWM_C);//PWM throttle
}

/*!
 * takes in all photo-transistor sensor value, adjust servo and throttle based on those values
 */
void processing(alt_u32 a,alt_u32 b, alt_u32 c, alt_u32 d, alt_u32 e, alt_u32 f, alt_u32 g ){
	sDATA.ulServoPWM_O = sDATA.ulServoPWM_C; //current servo value become old servo value

	//@todo this is inefficient, effectively calculating minimum value 7 times
	//will change so calculate minimum value once then use switch case statement to set values
																   //Sensor array, [n*] is the lowest value
	if (a <= b && a <= c && a <= d && a <= e && a <= f && a <= g){ //[a*]--[b]--[c]--[d]--[e]--[f]--[g]
		sDATA.ulServoPWM_C = 2703;
		sDATA.ulThrottlePWM_C = 2531;
	}
	if (b <= a && b <= c && b <= d && b <= e && b <= f && b <= g){//[a]--[b*]--[c]--[d]--[e]--[f]--[g]
		sDATA.ulServoPWM_C = 2533;
		sDATA.ulThrottlePWM_C = 2533;
	}
	if (c <= a && c <= b && c <= d && c <= e && c <= f && c <= g){//[a]--[b]--[c*]--[d]--[e]--[f]--[g]
		sDATA.ulServoPWM_C = 2539;
		sDATA.ulThrottlePWM_C = 2535;
	}
	if (d <= a && d <= b && d <= c && d <= e && d <= f && d <= g){//[a]--[b]--[c]--[d*]--[e]--[f]--[g]
		sDATA.ulServoPWM_C = 2457;
		sDATA.ulThrottlePWM_C = 2537;
	}
	if (e <= a && e <= b && e <= c && e <= d && e <= f && e <= g){//[a]--[b]--[c]--[d]--[e*]--[f]--[g]
		sDATA.ulServoPWM_C = 2293;
		sDATA.ulThrottlePWM_C = 2535;
	}
	if (f <= a && f <= b && f <= c && f <= d && f <= e && f <= g){//[a]--[b]--[c]--[d]--[e]--[f*]--[g]
		sDATA.ulServoPWM_C = 2129;
		sDATA.ulThrottlePWM_C = 2533;
	}
	if (g <= a && g <= b && g <= c && g <= d && g <= e && g <= f){//[a]--[b]--[c]--[d]--[e]--[f]--[g*]
		sDATA.ulServoPWM_C = 1966;
		sDATA.ulThrottlePWM_C = 2531;
	}

}


alt_u32 filter(alt_u32 raw_value, alt_u32 filtered_value)
{
	alt_u32 difference;
	difference = raw_value - filtered_value;
	//check if difference of raw to filtered value is positive,
	//if positive return positive copy if negative return negative copy
	//then check if the copy is greater than 50, if greater than 50 use raw value
	// if less than 50 use filtered value
	return ((difference > 0 ? difference : -difference) > 50) ? raw_value : filtered_value;
}


void vSetServoPWM(alt_u32 ulPwmValue)
{
	alt_u32 new_value, old_value;
	//12 bit 50Hz PWM signal = 4095 , so 4095 = 20ms
	//want a 1ms minimum pulse width: 1ms/20ms=0.05 then 4095*0.05=204.75
	//PWM_Steering = 307 for 1.5ms pulse width
	//note: might want to increase the resolution to 32 bits later

	//set servo only if within range of servo travel limits
	if((sDATA.ulServoMin <= ulPwmValue) && (ulPwmValue <= sDATA.ulServoMax))
	{


	new_value = ulPwmValue; //new value to bring steering servo up/down to.

	old_value = sDATA.ulServoPWM_O;//present value becomes old_value value

	//gradually change from old value to new value
	//gradually in this case meaning the change will be pretty quick
	if (new_value > old_value)
	{
		//ramp the old_value value up to the new value
		while(new_value != old_value)
		{
			old_value++;
			IOWR_32DIRECT(SLAVE_TEMPLATE_0_BASE, (DATA_OUT_14 * 4), (alt_u32)old_value);//PWM_Steering

		}
	}
	else if(new_value < old_value)
	{
		// ramp the old value down to the new value
		while(new_value != old_value)
		{	old_value--;
			IOWR_32DIRECT(SLAVE_TEMPLATE_0_BASE, (DATA_OUT_14 * 4), (alt_u32)old_value);//PWM_Steering
		}
	}
	//else new_value == old_value
	//	no need to write to servo register to update its value if no change from new to old

	//value change complete
	//sDATA.ulServoPWM_C = new_value;//update ram copy of present servo value

	}
}

void vSetThrottle(alt_u32 ulPwmValue)
{
	//12 bit 50Hz PWM signal = 4095 , so 4095 = 20ms
	//want a 1ms minimum pulse width: 1ms/20ms=0.05 then 4095*0.05=204.75
	//PWM_Steering = 307 for 1.5ms pulse width
	//note: might want to increase the resolution to 32 bits later

	//set throttle only if within range of throttle travel limits
	//if((sDATA.ulThrottleMin <= ulPwmValue) && (ulPwmValue <= sDATA.ulThrottleMax))
	//{
	sDATA.ulThrottlePWM_C = ulPwmValue;
	IOWR_32DIRECT(SLAVE_TEMPLATE_0_BASE, (DATA_OUT_15 * 4), (alt_u32)sDATA.ulThrottlePWM_C);//PWM_Steering
	//}
}



/*!
 * @brief 	Echo the "legal" command line key that was entered
 * @note 	Accumulated value is reset
 * @param 	[in] ubChar Character value
 */
void vEchoChar(alt_u8 ubChar)
{
	vCursor(2,1);
	vPutChar(ubChar);

	sSUI.ulAccumulate = 0;				// Init the accumulated value
	sSUI.ubCount = 0;
}

/*!
 * @brief Erase any command line characters
 *
 */
void vEraseCommand(void)
{
	vPrintTxt(2, 1, 80, "                                                                                ");
}
