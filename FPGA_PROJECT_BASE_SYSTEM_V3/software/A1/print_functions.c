/*
 * print_functions.c
 *
 *  Created on: Jan 18, 2014 3:41:47 PM
 *      Author: Mike
 */
#include "alt_types.h"
#include "hardware_map.h"
/*----------------------------------------------------------------------------
**  External Variable References
**
**  Public variables declared in other modules and used in this module
**--------------------------------------------------------------------------*/
extern struct UART_HW_struct *pUART;

void vPutChar(alt_u8 ubChar);
void vCursor(alt_u16 uwRow, alt_u16 uwCol);
void vPrintNum(alt_16 swValue);
/*!
 * @brief	Called from background to print one character
 * @param	[in] ubChar ASCII value of character to print
 */
void vPutChar(alt_u8 ubChar)
{
  // wait for xmit ready
  while(!pUART->sStatus.sBits.trdy)
    ;

  pUART->txdata = ubChar;
}

/*!
 * @brief	Print one decimal character
 * @param	[in] swValue Binary value of digit to print
 */
void vPrintNum(alt_16 swValue)
{
  vPutChar(swValue + '0');
}


/*!
 * @brief	Print control characters to position the cursor
 * @param	 uwRow Row
 * @param 	 uwCol Column
 */
void vCursor(alt_u16 uwRow, alt_u16 uwCol)
{
  vPutChar(27);		// ESC
  vPutChar('[');
  if (uwRow < 10)
  {
	vPutChar(uwRow + '0');
  }
  else
  {
	vPutChar(uwRow/10 + '0');
	vPutChar(uwRow%10 + '0');
  }
  vPutChar(';');
  if (uwCol < 10)
  {
	vPutChar(uwCol + '0');
  }
  else
  {
    vPutChar(uwCol/10 + '0');
    vPutChar(uwCol%10 + '0');
  }
  vPutChar('H');
  vPutChar(0);
  vPutChar(0);
  vPutChar(0);
}

/*!
 * @brief	Print string of characters
 * @param 	[in] uwRow Row
 * @param 	[in] uwCol Column
 * @param 	[in] swLength Byte length
 * @param 	[in out] pText Pointer to string
 */
void vPrintTxt(alt_u16 uwRow, alt_u16 uwCol, alt_16 swLength, char *pText)
{
  alt_u16 i;			// for loop index

  vCursor(uwRow, uwCol);		// Position the cursor for printing

  for (i=0; i<swLength; i++)
  {
    vPutChar(*pText++);
  }
}

/*!
 * @brief	Print value with no leading zeros and no decimal point
 * @param	[in] uwRow Row
 * @param 	[in] uwCol Column
 * @param 	[in] swSelect desired formatting
 * @param 	[in] slValue Value
 *
 */
void vPrintNlz(alt_u16 uwRow, alt_u16 uwCol, alt_16 swSel, alt_32 slVal)
{
  alt_u16 i;			// for loop index
  alt_u16 left;		// digits to the left of the decimal point

  alt_u16 nz;			// Flag to suppress leading zeros
  alt_32 slDig;		// Value to select digit to extract
  alt_32 slNum;		// Value of digit to print


  nz = 0;						// Init flag that suppresses leading zeros

  switch(swSel)					// Select the desired formatting
  {
    case 4:						// Format as XXXX
    {
      if (slVal > 9999)				// Test for value too big
      {
        vPrintTxt(uwRow, uwCol, 4,"****");
        return;
      }
	  left = 4;
      slDig = 1000;
    }
    break;

    case 5:						// Format as XXXXX
    {
      if (slVal > 99999)		// Test for value too big
      {
        vPrintTxt(uwRow, uwCol, 5,"*****");
        return;
      }
	  left = 5;
      slDig = 10000;
    }
    break;

    default:					// Unsupported format
    {
      vCursor(uwRow, uwCol);	// Position the cursor for printing
      vPutChar('?');
      return;
    }
  }

  // Common to all Nlz format
  vCursor(uwRow, uwCol);		// Position the cursor for printing

  for (i=0; i<left; i++)		// Start with most significant decimal digit
  {
    slNum = slVal / slDig;
    slVal = slVal - slNum * slDig;

    if (slNum > 0)
  	  nz = 1;					// nonzero found

    if (nz || (i == (left-1) ))
      vPrintNum(slNum); 		// print one digit
    else
      vPutChar(' ');			// print leading space

    slDig = slDig / 10;			// select the next digit
  }
}

/*!
 * @brief	Print Fixed Point decimal number
 * @param	[in] uwRow Row
 * @param 	[in] uwCol Column
 * @param 	[in] swSelect Decimal Point Position
 * @param 	[in] slValue Value
 * @note	For example: Decimal Point Position of 63 is XXXXXX.XXX
 */
void vPrintFix(alt_u16 uwRow, alt_u16 uwCol, alt_16 swSel, alt_32 slVal)
{
	alt_u16 i;			// for loop index
	alt_u16 left;		// digits to the left of the decimal point
	alt_u16 right;		// digits to the right of the decimal point

	alt_u16 nz;			// Flag to suppress leading zeros
	alt_32 slDig;		// Value to select digit to extract
	alt_32 slNum;		// Value of digit to print


  nz = 0;						// Init flag that suppresses leading zeros

  switch(swSel)					// Select the desired formatting
  {
  	  case 13:					// Format as X.XXX
  	  {
  		  if (slVal < 0)		// don't allow negative
  		  {
  			  slVal = 0;
  		  }

  		  if (slVal > 9999)		// Test for value too big
  		  {
  			  vPrintTxt(uwRow, uwCol, 5,"*.***");
  			  return;
  		  }
  		  left = 1;
  		  right = 3;
  		  slDig = 1000;
  	  }
  	  break;



    case 21:					// Format as XX.X
    {
      if (slVal > 999)			// Test for value too big
      {
        vPrintTxt(uwRow, uwCol, 4, "**.*");
        return;
      }
	  left = 2;
	  right = 1;
      slDig = 100;
    }
    break;

    case 22:					// Format as XX.XX
    {
      if (slVal > 9999)		// Test for value too big
      {
        vPrintTxt(uwRow, uwCol, 5, "**.**");
        return;
      }
	  left = 2;
	  right = 2;
      slDig = 1000;
    }
    break;

    case 31:					// Format as XXX.X
    {
      if (slVal > 9999)			// Test for value too big
      {
        vPrintTxt(uwRow, uwCol, 5,"***.*");
        return;
      }
	  left = 3;
	  right = 1;
      slDig = 1000;
    }
    break;

    case -31:					// Format as +XXX.X
    {
      vCursor(uwRow, uwCol-1);

      if (slVal > 9999)			// Test for value too big
      {
        vPrintTxt(uwRow, uwCol, 6,"+***.*");
        return;
      }
      if (slVal <= 2047)
      {
    	vPutChar('+');
      }
      else if (slVal <= 4095)
      {
    	vPutChar('-');
    	slVal = -(slVal - 4096);
      }
      else
      {
      	vPutChar(' ');
      }
	  left = 3;
	  right = 1;
      slDig = 1000;
    }
    break;


    case 61:					// Format as XXXXX.X
    {
      if (slVal < 0)
      {
    	  slVal = -slVal;
      }
      if (slVal > 9999999)			// Test for value too big
      {
        vPrintTxt(uwRow, uwCol, 8,"******.*");
        return;
      }
	  left = 6;
	  right = 1;
      slDig = 1000000;
    }
    break;

    case 63:					// Format as XXXXXX.XXX
    {
      if (slVal < 0)
      {
      	slVal = -slVal;
      }

      if (slVal > 999999999)	// Test for value too big
      {
        vPrintTxt(uwRow, uwCol, 10, "******.***");
        return;
      }
	  left = 6;
	  right = 3;
      slDig = 100000000;
    }
    break;

    default:
	{							// Unsupported format
      vCursor(uwRow, uwCol);	// Position the cursor for printing
      vPutChar('?');
      return;
    }
  }

  vCursor(uwRow, uwCol);		// Position the cursor for printing

  for (i=0; i<left; i++)		// Start with most significant decimal digit
  {
    slNum = slVal / slDig;
    slVal = slVal - slNum * slDig;

	if (slNum > 0)
	  nz = 1;					// nonzero found

	if (nz || (i == (left-1) ))
      vPrintNum(slNum); 		// print one digit
    else
      vPutChar(' ');			// print leading space

    slDig = slDig / 10;			// select the next digit
  }

  vPutChar('.');	    		// print the decimal point

  for (i=0; i<(right-1); i++)
  {
    slNum = slVal / slDig;
    slVal = slVal - slNum * slDig;

    vPrintNum(slNum);			// print one digit
    slDig = slDig / 10;			// select the next digit

  }

  vPrintNum(slVal); 			// print one digit
}

