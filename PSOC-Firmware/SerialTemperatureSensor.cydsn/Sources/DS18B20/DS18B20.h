/* **********************************************************************/ /**
 \file      \arg  DS18B20.h
 \brief  
 \date		\arg  Created on: July 13.20
			\arg  Last Edit: July 14.20
 \author	\arg  Gabriele Cristini
			\arg  \b 
 */
/* ***********************************************************************/

#ifndef _DS18B20_H
#define _DS18B20_H

/* **********************************************************************/
/* ***              System and library files included                 ***/
/* **********************************************************************/
#include <stdlib.h>


/* **********************************************************************/
/* ***                 Other components included                      ***/
/* **********************************************************************/
#include "PinManager.h"
#include "cylib.h"
/* **********************************************************************/
/* ***                Definition of global types                       ***/
/* **********************************************************************/
typedef enum{
	DS_ENVIRONMENT = 0,
	DS_SCAN_ENGINE = 1,
	DS_MAX_ENUM
}EN_DS18B20_TEMP_ENUM_TYPE;

/* **********************************************************************/
/* ***             Declaration of global functions                    ***/
/* **********************************************************************/
float32 DS_f32_ReadTemperature	(EN_DS18B20_TEMP_ENUM_TYPE en_Sensor);
void    DS_v_FloatToStringTemp  (float32 f32_TempValue, uint8* pu8_TempStringValue);
void	DS_v_Init				(void);

#endif /* _DS18B20_H */




