
/* **********************************************************************/ /**
 \file      \arg  DS18B20.c
 \brief  
 \date		\arg  Created on: July 13.20
			\arg  Last Edit: July 14.20
 \author	\arg  Gabriele Cristini
			\arg  \b 
 */
/* ***********************************************************************/

/* **********************************************************************/
/* ***              System and library files included                 ***/
/* **********************************************************************/

/* **********************************************************************/
/* ***                 Other components included                      ***/
/* **********************************************************************/
#include "CyLib.h"
#include "PinManager.h"
#include "PIN_UserLed.h"
#include "PIN_EnvTempDQ.h"
#include "PIN_ScanEngineTempDQ.h"

/* **********************************************************************/
/* ***                Definition of local macros                      ***/
/* **********************************************************************/


/* **********************************************************************/
/* ***                Definition of local types                       ***/
/* **********************************************************************/

/* **********************************************************************/
/* ***                     Local variables                            ***/
/* **********************************************************************/


/* **********************************************************************/
/* ***             Declaration of local functions                     ***/
/* **********************************************************************/


/* **********************************************************************/
/* ***             Definition of local functions                      ***/
/* **********************************************************************/

/* **********************************************************************/
/* ***            Definition of global functions                      ***/
/* **********************************************************************/
/* *********************************************************************************/ /**
   \fn      	void PIN_DrivePin(EN_PIN_ENUM_TYPE en_Pin, uint8 u8_State)
   \brief   	Drive pin \n
            	Scope: Global
   \return  	void
   \author		\arg Gabriele Cristini
   \date		\arg Creation:  July 30.20
				\arg Last Edit: July 30.20
 */
/* **********************************************************************************/
void PIN_DrivePin(EN_PIN_ENUM_TYPE en_Pin, uint8 u8_State)
{
    switch (en_Pin)
    {
        case PIN_USER_LED:
            PIN_UserLed_Write(u8_State);
            break;

        case PIN_DS_ENVIRONMENT_DQ:
            PIN_EnvTempDQ_Write(u8_State);
            break;

        case PIN_DS_SCAN_ENGINE_DQ:
            PIN_ScanEngineTempDQ_Write(u8_State);
            break;

        default:
            /* Misra*/
            break;
    }

    return;
}

/* *********************************************************************************/ /**
   \fn      	uint8 PIN_ReadPin(EN_PIN_ENUM_TYPE en_Pin);
   \brief   	Read pin \n
            	Scope: Global
   \return  	void
   \author		\arg Gabriele Cristini
   \date		\arg Creation:  July 30.20
				\arg Last Edit: July 30.20
 */
/* **********************************************************************************/
uint8 PIN_ReadPin(EN_PIN_ENUM_TYPE en_Pin)
{
    uint8 u8_val = 0u;

    switch (en_Pin)
    {
        case PIN_USER_LED:
            u8_val = PIN_UserLed_Read();
            break;

        case PIN_DS_ENVIRONMENT_DQ:
            u8_val = PIN_EnvTempDQ_Read();
            break;

        case PIN_DS_SCAN_ENGINE_DQ:
            u8_val = PIN_ScanEngineTempDQ_Read();
            break;

        default:
            /* Misra*/
            break;
    }

    return u8_val;
}
