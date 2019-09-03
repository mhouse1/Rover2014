/*
 * main.c
 *
 *  Created on: Jan 18, 2014 3:42:49 PM
 *      Author: Mike
 */



#include "alt_types.h"
#include "system.h"
#include "slave_template_macros.h"
#include "altera_avalon_pio_regs.h"
#include "altera_avalon_uart_regs.h"
#include "altera_avalon_uart.h"

#include "print_screens.h"
#include "hardware_map.h"
#include "process_entry.h"
#include "data.h"
#include "constants.h"
#include <stdio.h>
#include <fcntl.h>
//#include <stdio.h>
// Define pointer to Serial IO
//struct UART_HW_struct *pUART;

/*----------------------------------------------------------------------------
 **  External Variable References
 **
 **  Public variables declared in other modules and used in this module
 **--------------------------------------------------------------------------*/
extern struct SUI_STRUCT		sSUI;	// Serial User Interface
extern struct RCVR_STRUCT 		sRCVR;	// DX6 Spektrum receiver PWM width
extern struct ADC_STRUCT 		sADC;
extern struct ADC_STRUCT 		sADC_F;
extern struct DATA_STRUCT		sDATA;

int main()
{
	//enum Bool { FALSE =0, TRUE };
	//enum Bool up = TRUE;

	//int PWM_Steering = 205;

	sSUI.ubEntryMode = ENTRY_MODE_D;
	//cout<<"Hello World! 122713"<<endl;
	//printf("Executing 2914");
//	pUART = (struct UART_HW_struct *)(0x4005420 | 0x4000000);
//	pUART->sControl.word = 192;
//	pUART->sStatus.word =0;
//	pUART->txdata = 0;
//	pUART->rxdata = 0;
	//pUART->txdata = 96;
	vInitializePWMs();
	//vPrintStaticScreen1();
	sSUI.ubEnableDisplay = 1;			// Start with update enabled =1, disabled=0

	sDATA.ulDistance_Old = sDATA.ulDistance_Real;
	IOWR_ALTERA_AVALON_UART_CONTROL(UART_BASE,0x00);
	int count = 0;
	//printf("\033[2J\033[1;1H");
	vPrintStaticScreen1();
	while(1)
	{

		IOWR_ALTERA_AVALON_PIO_DATA(PIO_0_BASE, count&0xFF);
		count++;

		//hall effect sensor counter
		sDATA.ulDistance_Real= IORD_32DIRECT(SLAVE_TEMPLATE_1_BASE, DATA_IN_0 * 4);
		// Else print the dynamic values
		sRCVR.ulChannel1= IORD_32DIRECT(SLAVE_TEMPLATE_0_BASE, DATA_IN_0 * 4); // channel 1
		sRCVR.ulChannel2= IORD_32DIRECT(SLAVE_TEMPLATE_0_BASE, DATA_IN_1 * 4); // channel 2
		sRCVR.ulChannel3= IORD_32DIRECT(SLAVE_TEMPLATE_0_BASE, DATA_IN_2 * 4); // channel 3
		sRCVR.ulChannel4= IORD_32DIRECT(SLAVE_TEMPLATE_0_BASE, DATA_IN_3 * 4); // channel 4
		sRCVR.ulChannel5= IORD_32DIRECT(SLAVE_TEMPLATE_0_BASE, DATA_IN_4 * 4); // channel 5
		sRCVR.ulChannel6= IORD_32DIRECT(SLAVE_TEMPLATE_0_BASE, DATA_IN_5 * 4); // channel 6

		sADC.ulADC1 = IORD_32DIRECT(SLAVE_TEMPLATE_0_BASE, DATA_IN_6 * 4);//ADC channel 1
		sADC.ulADC2 = IORD_32DIRECT(SLAVE_TEMPLATE_0_BASE, DATA_IN_7 * 4);//ADC channel 2
		sADC.ulADC3 = IORD_32DIRECT(SLAVE_TEMPLATE_0_BASE, DATA_IN_8 * 4);//ADC channel  3
		sADC.ulADC4 = IORD_32DIRECT(SLAVE_TEMPLATE_0_BASE, DATA_IN_9 * 4);//ADC channel  4
		sADC.ulADC5 = IORD_32DIRECT(SLAVE_TEMPLATE_0_BASE, DATA_IN_10 * 4);//ADC channel  5
		sADC.ulADC6 = IORD_32DIRECT(SLAVE_TEMPLATE_0_BASE, DATA_IN_11 * 4);//ADC channel  6
		sADC.ulADC7 = IORD_32DIRECT(SLAVE_TEMPLATE_0_BASE, DATA_IN_12 * 4);//ADC channel  7
		//sADC.ulADC8 = IORD_32DIRECT(SLAVE_TEMPLATE_0_BASE, DATA_IN_13 * 4);//ADC channel  8

		//automatic control if transmitter channel 5 toggled low
		sDATA.sBits.automatic = sRCVR.ulChannel5 < 75000 ? 1 : 0;

		//reset distance if channel 6 toggled high
		if (sRCVR.ulChannel6 < 75000)
		{
			sDATA.sBits.distance_reset = 1;
		}
		else
		{
			sDATA.sBits.distance_reset = 0;
			sDATA.ulDistance_Old = sDATA.ulDistance_Real; //reset distance delta
		}

		//if normal mode engaged run baljeets firmware control
		if (sDATA.sBits.testOrNormal == NORMAL)
		{

			if (sRCVR.ulChannel5 < 75000)
			{

				sADC_F.ulADC1 = filter(sADC.ulADC1,sADC_F.ulADC1);
				sADC_F.ulADC2 = filter(sADC.ulADC2,sADC_F.ulADC2);
				sADC_F.ulADC3 = filter(sADC.ulADC3,sADC_F.ulADC3);
				sADC_F.ulADC4 = filter(sADC.ulADC4,sADC_F.ulADC4);
				sADC_F.ulADC5 = filter(sADC.ulADC5,sADC_F.ulADC5);
				sADC_F.ulADC6 = filter(sADC.ulADC6,sADC_F.ulADC6);
				sADC_F.ulADC7 = filter(sADC.ulADC7,sADC_F.ulADC7);

				processing(sADC_F.ulADC1,sADC_F.ulADC2,sADC_F.ulADC3,sADC_F.ulADC4,sADC_F.ulADC5,sADC_F.ulADC6,sADC_F.ulADC7);
				if ((sDATA.ulDistance_Real - sDATA.ulDistance_Old) >= sDATA.ulDistanceLimit)
				{
					//stop
					vSetThrottle(sDATA.ulThrottleNeutral);
				}
				else //until distance limit set throttle and servo
				{
					vSetServoPWM(sDATA.ulServoPWM_C);
					vSetThrottle(sDATA.ulThrottlePWM_C);
				}
			}
			else //Manual control by remote
			{
				vSetServoPWM(((sRCVR.ulChannel4*2457)/75000));
				vSetThrottle(((sRCVR.ulChannel4*2457)/75000));
			}

		}
		// else run Mike's Test mode control
		else //(sDATA.sBits.testOrNormal == TEST)
		{
			//set throttle neutral if distance limit reached
			if ((sDATA.ulDistance_Real - sDATA.ulDistance_Old) >= sDATA.ulDistanceLimit)
			{
				//stop
				vSetThrottle(sDATA.ulThrottleNeutral);
				sDATA.ulDistance_Old = sDATA.ulDistance_Real; //reset distance delta
			}
		}

//
//		// If entry from key board
		if ((IORD_ALTERA_AVALON_UART_STATUS(UART_BASE)&0x80)==0x80)
		{

			// Then read the character and perform the action
			vProcessNewKey(IORD_ALTERA_AVALON_UART_RXDATA(UART_BASE));
		}
		else if (sSUI.ubEnableDisplay)
		{vPrintDynamicScreen1();}

//		else if (sSUI.ubEnableDisplay)
//		{
//			//printf("Dis");
//			//prints continuously changing values
//			//vPrintDynamicScreen1();
//			 // while(!pUART->sStatus.sBits.trdy);
//			//  pUART->txdata = 96;
//				if (pUART->sStatus.sBits.rrdy)
//				{
//					printf("received %c\n",pUART->rxdata);
//				}
//			if((pUART->sStatus.sBits.trdy==1))
//			{
//				printf("transmit");
//				pUART->txdata = 99;
//			//	pUART->sStatus.sBits.trdy =0;
//			//	pUART->sControl.sBits.irrdy = 1;
//			}
//			else
//			{
//				//pUART->sStatus.sBits.trdy =1;
//				//printf("else");
//				pUART->sControl.sBits.itrdy=1;
//				pUART->sControl.word=0xFF;
//			}
//		}
		//printf("   %d   ",pUART->sControl.word);
		//printf("%d\n",pUART->sStatus.word);

//		int c = getchar();
//		//while(c = getchar());
//		printf("%c",c);
	}



	return 0;
}
