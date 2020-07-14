/*******************************************************************************
* File Name: DS18B20_DQ.h  
* Version 2.20
*
* Description:
*  This file contains the Alias definitions for Per-Pin APIs in cypins.h. 
*  Information on using these APIs can be found in the System Reference Guide.
*
* Note:
*
********************************************************************************
* Copyright 2008-2015, Cypress Semiconductor Corporation.  All rights reserved.
* You may use this file only in accordance with the license, terms, conditions, 
* disclaimers, and limitations in the end user license agreement accompanying 
* the software package with which this file was provided.
*******************************************************************************/

#if !defined(CY_PINS_DS18B20_DQ_ALIASES_H) /* Pins DS18B20_DQ_ALIASES_H */
#define CY_PINS_DS18B20_DQ_ALIASES_H

#include "cytypes.h"
#include "cyfitter.h"
#include "cypins.h"


/***************************************
*              Constants        
***************************************/
#define DS18B20_DQ_0			(DS18B20_DQ__0__PC)
#define DS18B20_DQ_0_PS		(DS18B20_DQ__0__PS)
#define DS18B20_DQ_0_PC		(DS18B20_DQ__0__PC)
#define DS18B20_DQ_0_DR		(DS18B20_DQ__0__DR)
#define DS18B20_DQ_0_SHIFT	(DS18B20_DQ__0__SHIFT)
#define DS18B20_DQ_0_INTR	((uint16)((uint16)0x0003u << (DS18B20_DQ__0__SHIFT*2u)))

#define DS18B20_DQ_INTR_ALL	 ((uint16)(DS18B20_DQ_0_INTR))


#endif /* End Pins DS18B20_DQ_ALIASES_H */


/* [] END OF FILE */