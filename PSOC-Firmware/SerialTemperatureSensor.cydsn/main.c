/* ========================================
 *
 * Copyright YOUR COMPANY, THE YEAR
 * All Rights Reserved
 * UNPUBLISHED, LICENSED SOFTWARE.
 *
 * CONFIDENTIAL AND PROPRIETARY INFORMATION
 * WHICH IS THE PROPERTY OF your company.
 *
 * ========================================
*/
#include "project.h"
#include <unistd.h>
#include <stdio.h>
#define BUFFER_SIZE 100u

void init(void);
void pollUart(void);


uint8 ch;
    uint8 rxData[BUFFER_SIZE];
    uint8 rxDataIndex = 0u;
    uint8 *command;
//int32 temp = 0u;

int main(void)
{
    
    /* Initialization */
    init();
    
    /* Transmit String through UART TX Line */
    UART_PC_UartPutString("CY8CKIT-041 USB-UART");
    
    for (;;)
    {
           
       pollUart();
    }
}


void init (void)
{
    
    /* Init UART */
    UART_PC_Start();
    
    PGA_Start();
    
    ADC_Temp_Start();
    ADC_Temp_StartConvert();
    
}

void pollUart(void)
{
    int temp = 0;
    int voltage = 0;
    char str[12];
     /* Get received character or zero if nothing has been received yet */
        ch = UART_PC_UartGetChar();
        if (0u != ch)
        {
                        
            /* Store the last received char */
            rxData[rxDataIndex] = ch;
                        
            if (ch == '\r')
            {  
                /* Insert the string terminator character */
               rxData[rxDataIndex] = '\0'; 

               /* Point to buffer */
               command = rxData;
               UART_PC_UartPutString((const char*) command);
                
              voltage=ADC_Temp_GetResult32(0);
              temp=Thermocouple_1_GetTemperature(voltage);
              sprintf(str, "%d", (int)temp);
            
            
              UART_PC_UartPutString(str);
            
            
                /* Clear buffer and index */
                for (rxDataIndex=0; rxDataIndex < BUFFER_SIZE; rxDataIndex++)
                {
                    rxData[rxDataIndex] = 0u;
                }               
                
                rxDataIndex = -1;
                                
            }
            
            rxDataIndex++;
            
        }
}

void getTemp(void)
{
    
}
/* [] END OF FILE */
