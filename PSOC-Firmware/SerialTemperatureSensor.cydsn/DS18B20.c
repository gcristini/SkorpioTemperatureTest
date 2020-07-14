/*----------------------------------------------------------------------------*/
                        /* ONE WIRE LIBRARY C-FILE */
/*----------------------------------------------------------------------------*/

#include "DS18B20.h"
#include "CyLib.h"
#include <stdio.h>

#define LS_BIT_MASK                 0x01
#define SCRATCHPAD_TEMP_MASK        0xFFFF
#define SCRATCHPAD_TEMP_ABS_MASK    0x0FFF
#define SCRATCHPAD_TEMP_SIGN_MASK   0xF000

#define SCRATCHPAD_SIZE             64u
#define SCRATCH_TEMP_SIZE           12u


//#define SCRATCH_TEMP_SIGN 15u

void DS_v_ResetPulse(void) 
{
    /* Reset Command for Sensor */    
    
    /* Low for 480us */
    Pin_DS18B20_DQ_Write(LOW);
    CyDelayUs(480);

    /* High for 70us */
    Pin_DS18B20_DQ_Write(HIGH);
   
    //Pin_DS18B20_DQ_Read();
    CyDelayUs(70);

    return;
}

void DS_v_WriteBit(uint8 bit)
{
    /* Write a Bit on Bus*/
      
    if (bit == 0) 
    {
        /* Low for 60 us */
        Pin_DS18B20_DQ_Write(LOW);
        CyDelayUs(60);

        /* High for 10 us */
        Pin_DS18B20_DQ_Write(HIGH);
        CyDelayUs(10);

    } else 
    {
        /* Low for 6us */
        Pin_DS18B20_DQ_Write(LOW);
        CyDelayUs(6);
        
        /* High for 64 us */
        Pin_DS18B20_DQ_Write(HIGH);
        CyDelayUs(64);

    }

    return;
}

uint8 DS_v_ReadBit(void)
 {
    /* Read a Bit After Sensor Response (Timing by Datasheet) */    
    
    uint8 read_bit;
    
    /* Low for 1 us */
    Pin_DS18B20_DQ_Write(LOW);
    CyDelayUs(3);

    /* High for 10 us */
    Pin_DS18B20_DQ_Write(HIGH);

    //Pin_DS18B20_DQ_Read();

    /* Wait for 10us */    
    CyDelayUs(10);

    /* Get bit */
    read_bit = Pin_DS18B20_DQ_Read(); 

    /* Wait for 53 us */
    CyDelayUs(53);

    return read_bit;
}

void DS_WriteByte(uint8 TxData) 
{
    /* Iterate OW_vrite_bit() to Write a Byte */
    
    uint8 i = 0u;

    for (i = 0; i < 8; i++) {
        DS_v_WriteBit(TxData & LS_BIT_MASK); //Sending LS-bit first
        TxData >>= 1; // shift the data byte for the next bit to send
    }

    return;
}




// float convert_temp_int(uint8 scratchpad[])
// {
//     int u8_index = 0u;
//     int u16_temp = 0;
//     float res;
//     uint8* pointer;

//     pointer = scratchpad;
//     /* Get Temperature and sign from scratchpad */
//     for (u8_index = 0; u8_index < SCRATCH_TEMP_SIZE; u8_index++)
//     {   
//         /* LS bits become MS bit */
//         u16_temp = u16_temp + (*pointer << u8_index);   
//         *pointer++;
//     }

//     /* Do 2-complement if necessary */
//     /*if (scratchpad [15] == 1)
//     {
//         u16_temp = ~u16_temp + 1u;
//     }
//     else
//     {
      
//     }
//     */
    
//     /* Divide by 16 */
//     res = u16_temp / 16u;

//     return res;

// }

    int16   i16_ScrathpadTemperature;
    uint16  u16_TempAbs;
    uint8   u8_TempSign;
    uint8   u8_Temperature[10];
    float32 f32_Temperature;
    
float_t DS_f_GetTempFromScratch(int64 scratchpad, uint8 pu8_Temperature[])
{
    //int16   i16_ScrathpadTemperature;
    //uint16  u16_TempAbs;
    //uint8   u8_TempSign;
    //uint8   u8_Temperature[10];

    /* Get 16 bits temperature rom scratchpad */
    i16_ScrathpadTemperature = scratchpad & SCRATCHPAD_TEMP_MASK;
    
    /* Get sign of temperature [15:0] */
    u8_TempSign = (uint8)(i16_ScrathpadTemperature & SCRATCHPAD_TEMP_SIGN_MASK);

    /* Get absolute value [11:0] and do 2's complement if needed */
    if (u8_TempSign == 0xF000)
    {
        u16_TempAbs = (uint16)((~(i16_ScrathpadTemperature & SCRATCHPAD_TEMP_ABS_MASK) + 1u)/16u);
        f32_Temperature = (float32)((~(i16_ScrathpadTemperature & SCRATCHPAD_TEMP_ABS_MASK) + 1u)/16u);
    }
    else
    {
        u16_TempAbs = (uint16)((i16_ScrathpadTemperature & SCRATCHPAD_TEMP_ABS_MASK)/16u);
        f32_Temperature = (float32)(i16_ScrathpadTemperature & SCRATCHPAD_TEMP_ABS_MASK)/16u;
    }
    
    sprintf((char*)pu8_Temperature, "%d", u16_TempAbs);
    
    return f32_Temperature; 
}

int64 pippo;

float_t DS_get_temp(void)  
{
    /* Send Commands to Sensor in Orde to Obtain the Temperature Value */
    
    int index = 0; //Index
    //int scratch[SCRATCHPAD_SIZE]; //Scratchpad Data
    int64 int64_scratch = 0x00000000u;
    float_t Temperature;
    uint8 temperature[10];
   // float temp_celsius; //Temperature in Celsius Degree
    
    /*--------- STEP I: Temperature Internal Conversion --------- */
    /* Reset Command */
    DS_v_ResetPulse(); 
    CyDelayUs(500);
    
    /* Skip Rom Command */
    DS_WriteByte(SKIP_ROM_DS18B20); 
    CyDelayUs(500);

    /* Initialize Temperature Conversion */
    DS_WriteByte(CONVERT_T_DS18B20); 
    CyDelayUs(1000);
  
    /*---------STEP II: Read Temperature --------- */
    /* Reset */
    DS_v_ResetPulse(); 
    CyDelayUs(500);

    /* Skip Rom */
    DS_WriteByte(SKIP_ROM_DS18B20); 
    CyDelayUs(500);
    
    /* Read Scratchapd */
    DS_WriteByte(READ_SCRATCHPAD_DS18B20); 
    for (index = 0; index < SCRATCHPAD_SIZE; index++) {
        //scratch[index] = DS_v_ReadBit();
        int64_scratch += DS_v_ReadBit() << index;
    }
    
    /* --------STEP III: CONVERSION TO CELSIUS DEGREE----------------- */
    //temp_celsius = convert_temp_int(scratch);
    Temperature = DS_f_GetTempFromScratch(int64_scratch, temperature);
    //return temp_celsius;

    return Temperature;
}