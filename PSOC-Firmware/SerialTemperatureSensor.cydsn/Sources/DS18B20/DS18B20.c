
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
#include <stdio.h>
#include <math.h>

/* **********************************************************************/
/* ***                 Other components included                      ***/
/* **********************************************************************/
#include "CyLib.h"
#include "DS18B20.h"

/* **********************************************************************/
/* ***                Definition of local macros                      ***/
/* **********************************************************************/

/* Masks */
#define LS_BIT_MASK                 0x01    /* Get Last bit */
#define SCRATCHPAD_TEMP_MASK        0xFFFF  /* Get bits [15:0] from scratchpad: temperature */
#define SCRATCHPAD_TEMP_ABS_MASK    0x0FFF  /* Get [11:0] from scratchpad: absolute value of temperature */
#define SCRATCHPAD_TEMP_SIGN_MASK   0xF000  /* Get [15:12] from scratchpad: sign of temperature */

#define SCRATCHPAD_SIZE             64u
#define SCRATCH_TEMP_SIZE           12u

/* DS18B20 Commands */
#define READ_ROM_DS18B20            0x33    /* Command To Read 64bit ROM */
#define READ_SCRATCHPAD_DS18B20     0xBE    /* Command To read 64bit Scratchapd */
#define SKIP_ROM_DS18B20            0xCC    /* Command to Address All Devices on Bus */
#define CONVERT_T_DS18B20           0x44    /* Command to Initialize Temperature Conversion */

#define TEMP_RESOLUTION             4u      /* Resolution up to 4 digits */

#define DISCARDED_VALUES            10u     /* Discard first 10 values in init */


/* **********************************************************************/
/* ***                Definition of local types                       ***/
/* **********************************************************************/

/* **********************************************************************/
/* ***                     Local variables                            ***/
/* **********************************************************************/


/* **********************************************************************/
/* ***             Declaration of local functions                     ***/
/* **********************************************************************/
EN_PIN_ENUM_TYPE    DS_en_GetSensorFromPin          (EN_DS18B20_TEMP_ENUM_TYPE en_Sensor);
void                DS_v_ResetPulse                 (EN_DS18B20_TEMP_ENUM_TYPE en_Sensor);
void                DS_v_WriteBit                   (EN_DS18B20_TEMP_ENUM_TYPE en_Sensor, uint8 u8_bit);
uint8               DS_v_ReadBit                    (EN_DS18B20_TEMP_ENUM_TYPE en_Sensor);
void                DS_v_WriteByte                  (EN_DS18B20_TEMP_ENUM_TYPE en_Sensor, uint8 u8_TxByte);
float32             DS_f32_GetTempFromScratchpad    (uint64 u64_scratchpad);

/* **********************************************************************/
/* ***             Definition of local functions                      ***/
/* **********************************************************************/
/* *********************************************************************************/ /**
   \fn      	EN_PIN_ENUM_TYPE DS_en_GetSensorFromPin(EN_DS18B20_TEMP_ENUM_TYPE en_Sensor)
   \brief   	Get Pin from Sensor enumerative \n
            	Scope: Local
   \return  	void
   \author		\arg Gabriele Cristini
   \date		\arg Creation:  July 30.20
				\arg Last Edit: July 30.20
 */
/* **********************************************************************************/
EN_PIN_ENUM_TYPE DS_en_GetSensorFromPin(EN_DS18B20_TEMP_ENUM_TYPE en_Sensor)
{
    EN_PIN_ENUM_TYPE en_Pin = (EN_PIN_ENUM_TYPE)0u;
    
    switch (en_Sensor)
    {   
        case DS_ENVIRONMENT:
            en_Pin = PIN_DS_ENVIRONMENT_DQ;
            break;

        case DS_SCAN_ENGINE:
            en_Pin = PIN_DS_SCAN_ENGINE_DQ;
            break;

        default:
            /* MISRA */
        break;
    }

    return en_Pin;
}


/* *********************************************************************************/ /**
   \fn      	void DS_v_ResetPulse(EN_DS18B20_TEMP_ENUM_TYPE en_Sensor) 
   \brief   	Reset command to sensor \n
            	Scope: Local
   \return  	void
   \author		\arg Gabriele Cristini
   \date		\arg Creation:  July 13.20
				\arg Last Edit: July 30.20
 */
/* **********************************************************************************/
void DS_v_ResetPulse(EN_DS18B20_TEMP_ENUM_TYPE en_Sensor)
{   
    /* Variables */
    EN_PIN_ENUM_TYPE en_Pin;
    
    /* Get pin from sensor enum */
    en_Pin = DS_en_GetSensorFromPin(en_Sensor);    
    
    /* Low for 480us */
    PIN_DrivePin(en_Pin, PIN_LOW);
    CyDelayUs(480);

    /* High for 70us */
    PIN_DrivePin(en_Pin, PIN_HIGH);

    /* Wait for 70 us */
    CyDelayUs(70);
    

    return;
}

/* *********************************************************************************/ /**
   \fn      	void DS_v_WriteBit(EN_DS18B20_TEMP_ENUM_TYPE en_Sensor, uint8 u8_bit)
   \brief   	Write a bit on Bus \n
            	Scope: Local
   \return  	void
   \author		\arg Gabriele Cristini
   \date		\arg Creation:  July 13.20
				\arg Last Edit: July 14.20
 */
/* **********************************************************************************/
void DS_v_WriteBit(EN_DS18B20_TEMP_ENUM_TYPE en_Sensor, uint8 u8_bit)
{
    /* Variables */
    EN_PIN_ENUM_TYPE en_Pin;
    
    /* Get pin from sensor enum */
    en_Pin = DS_en_GetSensorFromPin(en_Sensor); 

    if (u8_bit)
    {
        /* Low for 6us */
        PIN_DrivePin(en_Pin, PIN_LOW);
        CyDelayUs(6);

        /* High for 64 us */
        PIN_DrivePin(en_Pin, PIN_HIGH);
        CyDelayUs(64);
    }
    else
    {
        /* Low for 60 us */
        PIN_DrivePin(en_Pin, PIN_LOW);
        CyDelayUs(60);

        /* High for 10 us */
        PIN_DrivePin(en_Pin, PIN_HIGH);
        CyDelayUs(10);
    }

    return;
}

/* *********************************************************************************/ /**
   \fn      	uint8 DS_v_ReadBit(void)
   \brief   	Read a Bit After Sensor Response (Timing by Datasheet)\n
            	Scope: Local
   \return  	uint8
   \author		\arg Gabriele Cristini
   \date		\arg Creation:  July 13.20
				\arg Last Edit: July 14.20
 */
/* **********************************************************************************/
uint8 DS_v_ReadBit(EN_DS18B20_TEMP_ENUM_TYPE en_Sensor)
{
    /* Variables */
    EN_PIN_ENUM_TYPE    en_Pin;
    uint8               u8_ReadBit;
    
    /* Get pin from sensor enum */
    en_Pin = DS_en_GetSensorFromPin(en_Sensor); 
    
    /* Low for 1 us */
    PIN_DrivePin(en_Pin, PIN_LOW);
    CyDelayUs(3);

    /* High for 10 us */
    PIN_DrivePin(en_Pin, PIN_HIGH);

    /* Wait for 10us */
    CyDelayUs(10);

    /* Get bit */
    u8_ReadBit = PIN_ReadPin(en_Pin);

    /* Wait for 53 us */
    CyDelayUs(53);

    return u8_ReadBit;
}

/* *********************************************************************************/ /**
   \fn      	void DS_v_WriteByte(uint8 u8_TxByte)
   \brief   	Write a byte on bus \n
            	Scope: Local
   \return  	void
   \author		\arg Gabriele Cristini
   \date		\arg Creation:  July 13.20
				\arg Last Edit: July 14.20
 */
/* **********************************************************************************/
void DS_v_WriteByte(EN_DS18B20_TEMP_ENUM_TYPE en_Sensor, uint8 u8_TxByte)
{
    /* Variables */
    uint8 u8_i;

    for (u8_i = 0u; u8_i < 8u; u8_i++)
    {
        /* Sending LS-bit first */
        DS_v_WriteBit(en_Sensor, u8_TxByte & LS_BIT_MASK);

        /* Shift the data byte for the next bit to send */
        u8_TxByte >>= 1u;
    }

    return;
}

/* *********************************************************************************/ /**
   \fn      	float32 DS_f32_GetTempFromScratchpad(uint64 u64_scratchpad)
   \brief   	Get temperature from scratpad data \n
            	Scope: Local
   \return  	float32
   \author		\arg Gabriele Cristini
   \date		\arg Creation:  July 13.20
				\arg Last Edit: July 14.20
 */
/* **********************************************************************************/
float32 DS_f32_GetTempFromScratchpad(uint64 u64_scratchpad)
{
    /* Variables */
    uint16  u16_ScrathpadTemperature;
    uint16  u16_TempSign;
    float32 f32_Temperature;    

    /* Get 16 bits temperature from scratchpad */
    u16_ScrathpadTemperature = u64_scratchpad & SCRATCHPAD_TEMP_MASK;

    /* Get sign of temperature [15:0] */
    u16_TempSign = (uint16)(u16_ScrathpadTemperature & SCRATCHPAD_TEMP_SIGN_MASK);
    
    /* Get absolute value [11:0] and do 2's complement if needed */
    if (u16_TempSign == SCRATCHPAD_TEMP_SIGN_MASK)
    {   
        f32_Temperature = -((float32)((~u16_ScrathpadTemperature + 1u) & SCRATCHPAD_TEMP_MASK) / 16u);
    }
    else
    {
        f32_Temperature = (float32)(u16_ScrathpadTemperature & SCRATCHPAD_TEMP_ABS_MASK) / 16u;
    }

    return f32_Temperature;
}

/* **********************************************************************/
/* ***            Definition of global functions                      ***/
/* **********************************************************************/

/* *********************************************************************************/ /**
   \fn      	float32 DS_f32_ReadTemperature(void)  
   \brief   	Read Temperature form DS18B20 \n
            	Scope: Global
   \return  	void
   \author		\arg Gabriele Cristini
   \date		\arg Creation:  July 13.20
				\arg Last Edit: July 14.20
 */
/* **********************************************************************************/
float32 DS_f32_ReadTemperature(EN_DS18B20_TEMP_ENUM_TYPE en_Sensor)
{
    /* Variables */
    uint8   u8_Index;
    uint64  int64_Scratch = 0;
    float32 f32_Temperature;

    /*--------- STEP I: Temperature Internal Conversion --------- */
    /* Reset Command */
    DS_v_ResetPulse(en_Sensor);
    CyDelayUs(500);

    /* Skip Rom Command */
    DS_v_WriteByte(en_Sensor, SKIP_ROM_DS18B20);
    CyDelayUs(500);

    /* Initialize Temperature Conversion */
    DS_v_WriteByte(en_Sensor, CONVERT_T_DS18B20);
    CyDelayUs(1000);

    /*---------STEP II: Read Temperature --------- */
    /* Reset */
    DS_v_ResetPulse(en_Sensor);
    CyDelayUs(500);

    /* Skip Rom */
    DS_v_WriteByte(en_Sensor, SKIP_ROM_DS18B20);
    CyDelayUs(500);

    /* Read Scratchapd */
    DS_v_WriteByte(en_Sensor, READ_SCRATCHPAD_DS18B20);
    for (u8_Index = 0; u8_Index < SCRATCHPAD_SIZE; u8_Index++)
    {
        int64_Scratch += DS_v_ReadBit(en_Sensor) << u8_Index;
    }

    /* --------STEP III: CONVERSION TO CELSIUS DEGREE----------------- */
    f32_Temperature = DS_f32_GetTempFromScratchpad(int64_Scratch);

    return f32_Temperature;
}

/* *********************************************************************************/ /**
   \fn      	void DS_v_FloatToStringTemp(float32 f32_TempValue, uint8 *pu8_TempStringValue)
   \brief   	Convert Temperature from float to string\n
            	Scope: Global
   \return  	void
   \author		\arg Gabriele Cristini
   \date		\arg Creation:  July 13.20
				\arg Last Edit: July 14.20
 */
/* **********************************************************************************/
void DS_v_FloatToStringTemp(float32 f32_TempValue, uint8 *pu8_TempStringValue)
{
    int16   i16_TempInt;
    int16   i16_TempDec;
    float32 f32_TempFrac;
    uint8*  pu8_TempSign;

    /* Get the Sign */
    pu8_TempSign = (f32_TempValue < 0) ? (uint8 *)"-" : (uint8 *)"";

    /* Get Integer part of temperature */
    i16_TempInt = (int16)f32_TempValue;

    /* Get Decimal part of temperature*/
    f32_TempFrac = (float32)(f32_TempValue - i16_TempInt);
    i16_TempDec = (int16)(f32_TempFrac * pow(10, TEMP_RESOLUTION));

    sprintf((char *)pu8_TempStringValue, "%s%d.%d", pu8_TempSign, i16_TempInt, i16_TempDec);

    return;
}

/* *********************************************************************************/ /**
   \fn      	void DS_v_Init (void)
   \brief   	Initialize sensors discarding firsts read values \n
            	Scope: Global
   \return  	void
   \author		\arg Gabriele Cristini
   \date		\arg Creation:  July 13.20
				\arg Last Edit: July 14.20
 */
/* **********************************************************************************/
void DS_v_Init (void)
{
    /* Variables */
    EN_DS18B20_TEMP_ENUM_TYPE   en_sensor;
    uint8                       u8_i;    

    /* Read data from sensors to discard firsts values */
    for (u8_i = 0u; u8_i < DISCARDED_VALUES; u8_i++)
    {
        for (en_sensor = (EN_DS18B20_TEMP_ENUM_TYPE)0u; en_sensor < DS_MAX_ENUM; en_sensor++)
        {
            (void)DS_f32_ReadTemperature (en_sensor);
        }
    }

    return;
}