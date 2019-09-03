/*
 * print_screens.c
 *
 *  Created on: Jan 18, 2014 3:39:18 PM
 *      Author: Mike
 */
#include "alt_types.h"
#include "print_screens.h"
#include "print_functions.h"
#include "data.h"
#include <math.h>
#include "slave_template_macros.h"
#include "system.h"
#include "altera_avalon_pio_regs.h"
/*----------------------------------------------------------------------------
**  External Variable References
**
**  Public variables declared in other modules and used in this module
**--------------------------------------------------------------------------*/
extern struct RCVR_STRUCT sRCVR;	// DX6 Spektrum receiver PWM width
extern struct ADC_STRUCT 		sADC;
extern struct DATA_STRUCT	sDATA;	// General data

void vPrintStaticScreen1(void)
{
	vPutChar(27);     // Start with a clear screen
	vPutChar('[');
	vPutChar('2');
	vPutChar('J');
	vPutChar(0);


	vPutChar(27);     // set display attributes
	vPutChar('[');
	vPutChar('1');	// Bright
	vPutChar(';');
	vPutChar('3');	// red foreground
	vPutChar('1');
	vPutChar('m');
	vPutChar(0);
	vPutChar(0);

                       //          1         2         3         4         5         6         7         8
                       // 12345678901234567890123456789012345678901234567890123456789012345678901234567890
	vPrintTxt( 1, 1, 80, "Engineers Week 2014 DE0-NANO Rover Firmware V0.8  Press [t] to enter test mode  "); // 1
    //THIS LINE IS RESERVED FOR CURSOR                                                                                                      // 2
	vPrintTxt( 3, 1, 79, "Firmware_PWM_Outputs___| Calibration: Adjust Min/Max PWM, and Neutral Position,");
    vPrintTxt( 4, 1, 79, "Throttle = ##### ms    |              enter letter followed by values ex: A1234");
    vPrintTxt( 5, 1, 79, "Steering = ##### ms    |              |Min__||Max__||Nuet_||Value|             ");
    vPrintTxt( 6, 1, 79, "                       |   Throttle = |A####||B####||C####|  ####              ");//6      Min/Max PWM, Offset from neutral, va
    vPrintTxt( 7, 1, 79, "Receiver_Ch(n)_PWM_In__|   Steering = |a####||b####||c####|  ####              ");
    vPrintTxt( 8, 1, 79, "Throttle(3) = ##### ms |-------------------------------------------------------");
    vPrintTxt( 9, 1, 79, "Steering(4) = ##### ms | Distance Limit = ####                                 ");
    vPrintTxt(10, 1, 79, "Channel(5)  = ##### ms | Distance Delta = #####                                ");
    vPrintTxt(11, 1, 79, "Channel(6)  = ##### ms | Distance Overal= #####                                ");
    vPrintTxt(12, 1, 24, "                       |");
    vPrintTxt(13, 1, 24, "Receiver_Toggle_Switch_|");
    vPrintTxt(14, 1, 24, "Channel 6 D_Rst  = #   |");
	vPrintTxt(15, 1, 24, "Auto(1)/Manual(0)= #   |");
	vPrintTxt(16, 1, 24, "                       |");
	vPrintTxt(17, 1, 24, "Line_Sensor_ADC_Counts_|");
    vPrintTxt(18, 1, 24, "Sensor 1 = ####        |");
    vPrintTxt(19, 1, 24, "Sensor 2 = ####        |");
	vPrintTxt(20, 1, 24, "Sensor 3 = ####        |");
	vPrintTxt(21, 1, 24, "Sensor 4 = ####        |");
	vPrintTxt(22, 1, 24, "Sensor 5 = ####        |");
    vPrintTxt(23, 1, 24, "Sensor 6 = ####        |");
    vPrintTxt(24, 1, 24, "Sensor 7 = ####        |");//8





}
void vPrintDynamicScreen1(void)
{
	/*!
	 * Print values left section of screen
	 */
	//convert counts back to ms duty_counts*period/full counts
	//where for 15bit resoltuion full counts =32767
	vPrintFix( 4, 12,13, (alt_u32)(sDATA.ulThrottlePWM_C*20000/32767));//FW throttle PWM out
	vPrintFix( 5, 12,13, (alt_u32)(sDATA.ulServoPWM_C *20000/32767)); //FW servo PWM out


	//print receiver values
	vPrintFix( 8,15,13,(alt_32)(sRCVR.ulChannel3*20*pow(10,-3)));// channel 3 throttle PWM
	vPrintFix( 9,15,13,(alt_32)(sRCVR.ulChannel4*20*pow(10,-3)));// channel 4 steering PWM
	vPrintFix( 10,15,13,(alt_32)(sRCVR.ulChannel5*20*pow(10,-3)));// channel 5
	vPrintFix( 11,15,13,(alt_32)(sRCVR.ulChannel6*20*pow(10,-3)));// channel 6

	vPrintNlz(14, 20, 4, (alt_32) sDATA.sBits.distance_reset);
	vPrintNlz(15, 20, 4, (alt_32) sDATA.sBits.automatic);

	vPrintNlz(18, 12, 4, (alt_32) sADC.ulADC1 );
	vPrintNlz(19, 12, 4, (alt_32) sADC.ulADC2 );
	vPrintNlz(20, 12, 4, (alt_32) sADC.ulADC3 );
	vPrintNlz(21, 12, 4, (alt_32) sADC.ulADC4 );
	vPrintNlz(22, 12, 4, (alt_32) sADC.ulADC5 );
	vPrintNlz(23, 12, 4, (alt_32) sADC.ulADC6 );
	vPrintNlz(24, 12, 4, (alt_32) sADC.ulADC7 );

	/*!
	 * print values Configuration section of screen
	 */
	vPrintNlz(6, 41, 4, (alt_32) sDATA.ulThrottleMin    );
	vPrintNlz(6, 48, 4, (alt_32) sDATA.ulThrottleMax    );
	vPrintNlz(6, 55, 4, (alt_32) sDATA.ulThrottleNeutral);
	vPrintNlz(6, 62, 4, (alt_32) sDATA.ulThrottlePWM_C  );
	vPrintNlz(7, 41, 4, (alt_32) sDATA.ulServoMin );
	vPrintNlz(7, 48, 4, (alt_32) sDATA.ulServoMax );
	vPrintNlz(7, 55, 4, (alt_32) sDATA.ulServoNeutral);
	vPrintNlz(7, 62, 4, (alt_32) sDATA.ulServoPWM_C );

	//print distance data
	vPrintNlz(9, 43, 5, (alt_32) sDATA.ulDistanceLimit);
	vPrintNlz(10, 43, 5, (alt_32) sDATA.ulDistance_Real - sDATA.ulDistance_Old); // distance delta
	vPrintNlz(11, 43, 5, (alt_32) sDATA.ulDistance_Real); //OVERALL distance

}


