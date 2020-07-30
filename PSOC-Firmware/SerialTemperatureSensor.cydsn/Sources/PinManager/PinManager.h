/* **********************************************************************/ /**
 \file      \arg  PinManager.h
 \brief  
 \date		\arg  Created on: July 30.20
			\arg  Last Edit: July 30.20
 \author	\arg  Gabriele Cristini
			\arg  \b 
 */
/* ***********************************************************************/

#ifndef _PIN_MANAGER_H
#define _PIN_MANAGER_H

/* **********************************************************************/
/* ***              System and library files included                 ***/
/* **********************************************************************/
#include <stdlib.h>

/* **********************************************************************/
/* ***                 Other components included                      ***/
/* **********************************************************************/


/* **********************************************************************/
/* ***                Definition of local macros                      ***/
/* **********************************************************************/
#define	PIN_LOW		0u
#define	PIN_HIGH	1u


/* **********************************************************************/
/* ***                Definition of global types                       ***/
/* **********************************************************************/
typedef enum
{
    PIN_USER_LED,               /* P0.2 */
    PIN_DS_ENVIRONMENT_DQ,      /* P5.3 */
    PIN_DS_SCAN_ENGINE_DQ,      /* P4.1 */  
}EN_PIN_ENUM_TYPE;

/* **********************************************************************/
/* ***             Declaration of global functions                    ***/
/* **********************************************************************/
void 	PIN_DrivePin(EN_PIN_ENUM_TYPE en_Pin, uint8 u8_State);
uint8 	PIN_ReadPin(EN_PIN_ENUM_TYPE en_Pin);

#endif /* _PIN_MANAGER_H */




