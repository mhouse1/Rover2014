/*
 * hardware_map.h
 *
 *  Created on: Jan 18, 2014 3:44:32 PM
 *      Author: Mike
 */

#ifndef HARDWARE_MAP_H_
#define HARDWARE_MAP_H_

/*! Define structure of debugger UART, 16-bit registers on 32-bit boundaries,
 * 	upper words are not used.
 */
struct UART_HW_struct
{
  UWORD rxdata;					// Receive Data
  UWORD rxdata_unused;
  UWORD txdata;					// Transmit Data
  UWORD txdata_unused;
  union
  {
    UWORD word;
    struct
    {
    	UWORD  pe         : 1;
    	UWORD  fe         : 1;
    	UWORD  brk        : 1;
    	UWORD  roe        : 1;

    	UWORD  toe        : 1;
    	UWORD  tmt        : 1;
    	UWORD  trdy       : 1;
    	UWORD  rrdy       : 1;

    	UWORD  e          : 1;
    	UWORD  unused     : 1;
    	UWORD  dcts       : 1;
    	UWORD  cts        : 1;

    	UWORD  eop        : 1;
    	UWORD  reserved   : 3;
    } sBits;
  } sStatus;					// Status Bits
  UWORD status_unused;

  union
  {
	  UWORD word;
    struct
    {
		  UWORD  ipe        : 1;
		  UWORD  ife        : 1;
		  UWORD  ibrk       : 1;
		  UWORD  iroe       : 1;

		  UWORD  itoe       : 1;
		  UWORD  itmt       : 1;
		  UWORD  itrdy      : 1;
		  UWORD  irrdy      : 1;

		  UWORD  ie         : 1;
		  UWORD  trbk       : 1;
		  UWORD  idcts      : 1;
		  UWORD  rts        : 1;

		  UWORD  ieop       : 1;
		  UWORD  reserved   : 3;
    } sBits;
  } sControl;					// Control Bits
  UWORD control_unused;

  UWORD divisor;
  UWORD divisor_unused;
  UWORD end_of_packet;
  UWORD end_of_packet_unused;
};

#endif /* HARDWARE_MAP_H_ */
