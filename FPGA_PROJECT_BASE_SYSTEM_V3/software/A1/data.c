/*
 * data.c
 *
 *  Created on: Jan 18, 2014 3:46:25 PM
 *      Author: Mike
 */

#include "alt_types.h"
#include "data.h"



/*----------------------------------------------------------------------------
**  Global Variable Declarations
**
**  Public variables declared in this module that can be used by other modules
**--------------------------------------------------------------------------*/
struct SUI_STRUCT	sSUI;	// Serial User Interface
struct RCVR_STRUCT sRCVR;	// DX6 Spektrum receiver PWM width
struct ADC_STRUCT	sADC;	// 8 channel ADC values
struct DATA_STRUCT	sDATA;	// General data
struct ADC_STRUCT	sADC_F;
