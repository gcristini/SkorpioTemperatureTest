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
#include <Pin_DS18B20_DQ.h>




float32 DS_f32_ReadTemperature  (void);
void    DS_v_FloatToStringTemp  (float32 f32_TempValue, uint8* pu8_TempStringValue);

#endif /* _DS18B20_H */




