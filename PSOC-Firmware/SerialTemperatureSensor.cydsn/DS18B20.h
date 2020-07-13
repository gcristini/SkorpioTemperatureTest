/*----------------------------------------------------------------------------*/
                         /*ONE WIRE LIBRARY HEADER*/
/*----------------------------------------------------------------------------*/

#ifndef DS18B20_H
#define DS18B20_H


#include <math.h>

#include <stdlib.h>
#include <Pin_DS18B20_DQ.h>

//SENSOR
#define READ_ROM_DS18B20 0x33 // Command To Read 64bit ROM
#define READ_SCRATCHPAD_DS18B20 0xBE //Command To read 64bit Scratchapd
#define SKIP_ROM_DS18B20 0xCC //Command to Address All Devices on Bus
#define CONVERT_T_DS18B20 0x44//Command to Initialize Temperature Conversion

//PORTS
// #define OW_PIN_DIRECTION 	TRISFbits.TRISF5
// #define OW_WRITE_PIN  		LATFbits.LATF5
// #define OW_READ_PIN			PORTFbits.RF5

//VALUES
#define	HIGH	1
#define	LOW		0
#define	OUTPUT	0
#define	INPUT 	1
#define	SET		1
#define	CLEAR	0

float DS_get_temp(void);

#endif /* DS18B20_H */




