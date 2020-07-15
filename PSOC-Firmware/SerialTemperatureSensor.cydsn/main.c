/* **********************************************************************/ /**
 \file      \arg  Main.c
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
#include <unistd.h>
#include <stdio.h>

/* **********************************************************************/
/* ***                 Other components included                      ***/
/* **********************************************************************/
#include "project.h"
#include "DS18B20.h"

/* **********************************************************************/
/* ***                Definition of local macros                      ***/
/* **********************************************************************/
#define UART_RX_BUFFER_SIZE 15u
#define UART_TX_BUFFER_SIZE 20u

#define forever for (;;) /* Enjoy :) */

/* **********************************************************************/
/* ***             Declaration of local functions                     ***/
/* **********************************************************************/
void MAIN_v_PollUart                (void);
void MAIN_v_ParseCommand            (uint8 *pu8_Command);
void MAIN_v_ClearBuffer             (uint8 *pu8_Buffer, uint8 u8_BufferSize);
void MAIN_v_ReadTemperatureCommand  (void);

/* **********************************************************************/
/* ***             Definition of local functions                      ***/
/* **********************************************************************/
/* *********************************************************************************/ /**
   \fn      	void MAIN_v_PollUart(void)
   \brief   	Poll Uart \n
            	Scope: Local
   \return  	void
   \author		\arg Gabriele Cristini
   \date		\arg Creation:  July 13.20
				\arg Last Edit: July 14.20
 */
/* **********************************************************************************/

void MAIN_v_PollUart(void)
{
    static uint8    u8_Char;
    static uint8    u8_RxDataIndex = 0u;
    static uint8    u8_RxData[UART_RX_BUFFER_SIZE];
    static uint8*   pu8_RxCommand;

    /* Get received character or zero if nothing has been received yet */
    u8_Char = UART_FTDI_UartGetChar();

    if (u8_Char != 0u)
    {
        /* Store the last received char */
        u8_RxData[u8_RxDataIndex] = u8_Char;    
        
        /* If a complete string is received... */
        if (u8_Char == '\r')
        {
            /* Insert the string terminator character */
            u8_RxData[u8_RxDataIndex] = '\0';

            /* Point to buffer */
            pu8_RxCommand = u8_RxData;
            
            /* Parse the received command */
            MAIN_v_ParseCommand(pu8_RxCommand);

            /* Clear buffer and reset index */
            MAIN_v_ClearBuffer(u8_RxData, UART_RX_BUFFER_SIZE);
            u8_RxDataIndex = -1;
        }
        
        else if (u8_RxDataIndex == UART_RX_BUFFER_SIZE-1)
        {
          /* Clear buffer and reset index */
          MAIN_v_ClearBuffer(u8_RxData, UART_RX_BUFFER_SIZE);
          u8_RxDataIndex = -1;
        }        
        
        u8_RxDataIndex++;
    }

    return;
}

/* *********************************************************************************/ /**
   \fn      	void MAIN_v_ClearBuffer(uint8 *pu8_Buffer, uint8 u8_BufferSize)
   \brief   	Clear a buffer \n
            	Scope: Local
   \return  	void
   \author		\arg Gabriele Cristini
   \date		\arg Creation:  July 13.20
				\arg Last Edit: July 14.20
 */
/* **********************************************************************************/
void MAIN_v_ClearBuffer(uint8 *pu8_Buffer, uint8 u8_BufferSize)
{   
    /* Variables */
    uint8 u8_i;

    /* Clear Buffer */
    for (u8_i = 0; u8_i < u8_BufferSize; u8_i++)
    {
        pu8_Buffer[u8_i] = 0u;
    }

    return;
}

/* *********************************************************************************/ /**
   \fn      	void MAIN_v_ParseCommand (uint8 *pu8_Command)
   \brief   	Parse command \n
            	Scope: Local
   \return  	void
   \author		\arg Gabriele Cristini
   \date		\arg Creation:  July 13.20
				\arg Last Edit: July 14.20
 */
/* **********************************************************************************/
void MAIN_v_ParseCommand(uint8 *pu8_Command)
{
    /* Get Temperature */
    if (!strcmp((const char*)pu8_Command, "read_temp"))
    {   
        /* Read temperature from DS18B20 and send result to PC */
        MAIN_v_ReadTemperatureCommand();       
    }    
    else    
    {
        /* MISRA */
    }
    
    return;
}

/* *********************************************************************************/ /**
   \fn      	void MAIN_v_ReadTemperatureCommand(void)
   \brief   	Read temperature from DS18B20 and send result to PC \n
            	Scope: Local
   \return  	void
   \author		\arg Gabriele Cristini
   \date		\arg Creation:  July 13.20
				\arg Last Edit: July 14.20
 */
/* **********************************************************************************/
void MAIN_v_ReadTemperatureCommand(void)
{   
    /* Variables */
    static uint8 u8_TempBuff[UART_TX_BUFFER_SIZE];
        
    /* Read Temperature from DS18B20 and convert into string */
    DS_v_FloatToStringTemp((float32)DS_f32_ReadTemperature(), u8_TempBuff);
    
    /* Add newline and carriage return at the end of the string */
    sprintf((char*)u8_TempBuff, "%s\r\n", u8_TempBuff);
    
    /* Send result to PC */
    UART_FTDI_UartPutString((char *)u8_TempBuff);
    
    /* Clear Buffer */
    MAIN_v_ClearBuffer(u8_TempBuff, UART_TX_BUFFER_SIZE);


    return;
}

/* **********************************************************************/
/* ***            Definition of global functions                      ***/
/* **********************************************************************/


/* *********************************************************************************/ /**
   \fn      	int main(void)
   \brief   	main program \n
            	Scope: Local
   \return  	void
   \author		\arg Gabriele Cristini
   \date		\arg Creation:  July 13.20
				\arg Last Edit: July 14.20
 */
/* **********************************************************************************/

int main(void)
{
    /* Init UART */
    UART_FTDI_Start();
    CyGlobalIntEnable;
    
    forever
    {
        /* Poll Uart */
        MAIN_v_PollUart();   
    }

    return 0;
}

/*] END OF FILE */
