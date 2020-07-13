/*----------------------------------------------------------------------------*/
                        /* ONE WIRE LIBRARY C-FILE */
/*----------------------------------------------------------------------------*/

#include "DS18B20.h"
#include "CyLib.h"
#define LS_BIT_MASK 0x01


void DS_v_ResetPulse(void) {
    /* Reset Command for Sensor */    
    
    /* Low for 480us */
    Pin_DS18B20_DQ_Write(LOW);
    CyDelayUs(480);

    /* High for 70us */
    Pin_DS18B20_DQ_Write(HIGH);
    //Pin_DS18B20_DQ_Read();
    CyDelayUs(70);
}

void DS_v_WriteBit(uint8 bit) {

    /* Write a Bit on Bus*/
      
    if (bit == 0) {
        /* Low for 60 us */
        Pin_DS18B20_DQ_Write(LOW);
        CyDelayUs(60);

        /* High for 10 us */
        Pin_DS18B20_DQ_Write(HIGH);
        CyDelayUs(10);

    } else {
        /* Low for 6us */
        Pin_DS18B20_DQ_Write(LOW);
        CyDelayUs(6);
        
        /* High for 64 us */
        Pin_DS18B20_DQ_Write(HIGH);
        CyDelayUs(64);

    }

    return;

}

void DS_WriteByte(uint8 TxData) {
    /* Iterate OW_vrite_bit() to Write a Byte */
    
    uint8 i = 0u;
    for (i = 0; i < 8; i++) {
        DS_v_WriteBit(TxData & LS_BIT_MASK); //Sending LS-bit first
        TxData >>= 1; // shift the data byte for the next bit to send
    }

    return;
}

uint8 DS_v_ReadBit(void) {
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


float binary_to_float(int array_hex[]) {
    /* Convert a Binary Array to a Float Element */
    
    float sum = 0;
    int i = 0;
    for (i = 0; i < 12; i++) {
        sum = sum + (array_hex[i] << i);
    }
    return sum;
}

int two_complement(int array[]) {
    /* Do Two's Complement on a Binary Array */
    
    int i;
    //One's Complement
    for (i = 0; i < 12; i++) {
        if (array[i] == 0)
            array[i] = 1;
        else
            array[i] = 0;
    }
    //Sum '1'
    int riporto = 1;
    while (riporto == 1) {
        if (array[i] == 1 && riporto == 1) {
            array[i] = 0;
            riporto = 1;
            i++;
        } else {
            array[i] = 1;
            riporto = 0;
        }
    }
    return array;
}

float convert_temp_int(int out_scratchpad[]) {
    /* Convert Temperature From Binary to Float*/
    
    //RICORDARSI DI TRASMETTERE FLAG
    unsigned char flag_neg; //'0' If Positive Temperature, '1' if Negative
    int i = 0; //Index
    int bit_temp[12]; //Temperature Array (12 Bits)
    float celsius; //Celsius Degree Temperature 
    float temp_raw; //Raw Temperature

    //Isolate Temperature's Bits from Scratchpad Data (First 8 Bits)
    for (i = 0; i < 12; i++) {
        bit_temp[i] = out_scratchpad[i];
    }
    
    flag_neg = out_scratchpad[15]; //Bits 15-to-12 are Sign-Bits 
    
    //Two's Complement If Negative
    if (flag_neg == 1) {
        out_scratchpad = two_complement(out_scratchpad);
    }
     
    //for(i=0; i<12; i++){
    //    while (U1STAbits.UTXBF); //resto fermo ad aspettare che il precedente dato sia letto
    //    IEC0bits.U1TXIE = 0;
    //    U1TXREG=bit_temp[i];
    //}

    //Binary to Float Conversione
    
    temp_raw = binary_to_float(out_scratchpad); 
    
    //Set Negative Sign if Binary Number Was Negative
    if (flag_neg == 1) {
        temp_raw=-temp_raw;
    }
    
    //Celsius-Degree Conversion
    celsius = temp_raw / 16;
    return celsius;
}

float DS_get_temp(void)  
{
    /* Send Commands to Sensor in Orde to Obtain the Temperature Value */
    
    int index = 0; //Index
    int scratch[64]; //Scratchpad Data
    float temp_celsius; //Temperature in Celsius Degree
    
    /*--------- STEP I: Temperature Internal Conversion --------- */
    //Reset Command
    DS_v_ResetPulse(); 
    CyDelayUs(500);
    
    //Skip Rom Command
    DS_WriteByte(SKIP_ROM_DS18B20); 
    CyDelayUs(500);

    DS_WriteByte(CONVERT_T_DS18B20); //Conversione Temperatura
    CyDelayUs(1000);

    //   flag=OW_read_bit(); 
    //   while (flag==0); //Aspetto Sia Pronta La Conversione

    /*---------STEP II: Read Temperature --------- */
    //Reset
    DS_v_ResetPulse(); 
    CyDelayUs(500);

    //Skip Rom
    DS_WriteByte(SKIP_ROM_DS18B20); 
    CyDelayUs(500);
    
    //Read Scratchapd
    DS_WriteByte(READ_SCRATCHPAD_DS18B20); 
    for (index = 0; index < 64; index++) {
        scratch[index] = DS_v_ReadBit();
    }
    
    /*--------STEP III: CONVERSION TO CELSIUS DEGREE-----------------*/
    temp_celsius = convert_temp_int(scratch);
    return temp_celsius;
}