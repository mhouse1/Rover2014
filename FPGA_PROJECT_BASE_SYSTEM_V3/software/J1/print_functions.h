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
void vPutChar(UBYTE ubChar);
void vCursor(UWORD uwRow, UWORD uwCol);
void vPrintTxt(UWORD uwRow, UWORD uwCol, SWORD swLength, char *pText);
void vPrintNlz(UWORD uwRow, UWORD uwCol, SWORD swSel, SLONG slVal);
void vPrintFix(UWORD uwRow, UWORD uwCol, SWORD swSel, SLONG slVal);

#endif /* PRINT_FUNCTIONS_H_ */
