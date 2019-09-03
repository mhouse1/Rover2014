/*
 * print_functions.h
 *
 *  Created on: Jan 18, 2014 3:48:32 PM
 *      Author: Mike
 */

#ifndef PRINT_FUNCTIONS_H_
#define PRINT_FUNCTIONS_H_


/*----------------------------------------------------------------------
**  Function Prototypes
**--------------------------------------------------------------------*/
void vPutChar(alt_u8 ubChar);
void vCursor(alt_u16 uwRow, alt_u16 uwCol);
void vPrintTxt(alt_u16 uwRow, alt_u16 uwCol, alt_16 swLength, char *pText);
void vPrintNlz(alt_u16 uwRow, alt_u16 uwCol, alt_16 swSel, alt_32 slVal);
void vPrintFix(alt_u16 uwRow, alt_u16 uwCol, alt_16 swSel, alt_32 slVal);

#endif /* PRINT_FUNCTIONS_H_ */
