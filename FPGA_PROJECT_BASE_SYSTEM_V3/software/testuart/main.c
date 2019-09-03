/*
 * main.c
 *
 *  Created on: Feb 9, 2014 2:05:25 PM
 *      Author: Mike
 */
#include <alt_types.h>
#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#include "sys/alt_stdio.h"
#include "system.h"
#include "altera_avalon_pio_regs.h"
#include "altera_avalon_uart_regs.h"
#include "altera_avalon_uart.h"

// global variables
int count = 0,ch,n,status,txd,led=0xff;
int rx_cnt,rx_buf[16];

void transmit(alt_u8 ch)
{
	//IOWR_ALTERA_AVALON_UART_CONTROL(UART_BASE,0x40); //tell control we want to transmit
//while (!(IORD_ALTERA_AVALON_UART_STATUS(UART_BASE)&0x40)==0x40);//wait for transmit ready status
	IOWR_ALTERA_AVALON_UART_TXDATA(UART_BASE,ch); //transmit the data
	//IOWR_ALTERA_AVALON_UART_CONTROL(UART_BASE,0); //turn off transmit after finish transmitting
}
int main()
{
alt_printf("1.Hello from Nios II!\n");

while(1)
{ // printf("Hello from Nios II!\n");
	IOWR_ALTERA_AVALON_UART_CONTROL(UART_BASE,0);
// send 4 bytes via UART0 (with waiting 100us)
	transmit(46);
// read bytes from UART and wait 20ms
//rx_cnt=0;
//alt_printf("enter rx data now\n");
//for(n=0;n<1000;n++)
//{
	//usleep(1000);
//alt_printf(".");
ch = IORD_ALTERA_AVALON_UART_STATUS(UART_BASE);
// if received some byte, read it
if ((ch&0x80)==0x80)
{ ch = IORD_ALTERA_AVALON_UART_RXDATA(UART_BASE);
alt_printf("read\n");
transmit(ch);
status = IORD_ALTERA_AVALON_UART_STATUS(UART_BASE);

if (!(status&0x40)==0x40){alt_printf("not active\n");}//wait for transmit ready signal
txd =  IORD_ALTERA_AVALON_UART_TXDATA(UART_BASE);
alt_printf("%c",txd);
//transmit(ch);

//rx_buf[rx_cnt]= ch;
//rx_cnt++;
}
//}

//// print the bytes to terminal
//if (rx_cnt>0)
//{ alt_printf("rx_data:");
//for(n=0;n<rx_cnt;n++)
//{ alt_printf("%x ",rx_buf[n]);
//IOWR_ALTERA_AVALON_UART_TXDATA(UART_BASE,rx_buf[n]);
//}
//alt_printf("\n");
//}

}
return 0;
}
