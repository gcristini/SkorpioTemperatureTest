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
#include "DS18B20.h"

#define BUFFER_SIZE 100
#define forever for (;;) /* Enjoy :) */

void init(void);
void pollUart(void);
void parseCommand(char *command);
void clearBuffer(uint8 *buffer, uint8 bufferSize);


uint8 temp;
uint8 tempBuff[BUFFER_SIZE];

int main(void)
{
    
    /* Initialization */
    init();
    
    /* Transmit String through UART TX Line */
    UART_PC_UartPutString("WELCOME");
    
    forever
    {
           
       pollUart();
       temp=(int)DS_get_temp();
    
        sprintf((char*)tempBuff, "%d", temp);
        UART_PC_UartPutString((char*)tempBuff);
        clearBuffer(tempBuff, BUFFER_SIZE);
        CyDelay(1000);
        
    }
}


void init (void)
{
    
    /* Init UART */
    UART_PC_Start();
    return;   
    
}

void pollUart(void)
{
   static uint8 ch;
        static uint16 rxDataIndex = 0u;
        static uint8 rxData[BUFFER_SIZE];
        static uint8 *rxCommand;
        
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
               rxCommand = rxData;
               UART_PC_UartPutString((const char*) rxCommand);
             
            
                /* Clear buffer and index */
                clearBuffer(rxData, BUFFER_SIZE);            
                
                rxDataIndex = -1;
                                
            }
            
            rxDataIndex++;
            
        }
}
   void clearBuffer(uint8 *buffer, uint8 bufferSize)
    {
        uint8 i;
        for (i = 0; i < bufferSize; i++)
        {
            buffer[i] = 0u;
        }
    }
 /*] END OF FILE */
