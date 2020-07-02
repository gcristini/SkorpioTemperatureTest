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
#define BUFFER_SIZE 100u

void init(void);
void pollUart(void);


uint8 ch;
uint8 rxData[BUFFER_SIZE];
uint8 rxDataIndex = 0u;
uint8 *command;

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
}

void pollUart(void)
{
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
            
                /* Clear buffer and index */
                for (rxDataIndex=0; rxDataIndex <= BUFFER_SIZE; rxDataIndex++)
                {
                    rxData[rxDataIndex] = 0u;
                }               
                
                rxDataIndex = -1;
                                
            }
            
            rxDataIndex++;
            
        }
}
/* [] END OF FILE */
