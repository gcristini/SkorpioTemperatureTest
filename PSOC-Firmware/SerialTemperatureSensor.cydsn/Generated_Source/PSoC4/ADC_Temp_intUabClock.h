/*******************************************************************************
* File Name: ADC_Temp_intUabClock.h
* Version 2.20
*
*  Description:
*   Provides the function and constant definitions for the clock component.
*
*  Note:
*
********************************************************************************
* Copyright 2008-2012, Cypress Semiconductor Corporation.  All rights reserved.
* You may use this file only in accordance with the license, terms, conditions, 
* disclaimers, and limitations in the end user license agreement accompanying 
* the software package with which this file was provided.
*******************************************************************************/

#if !defined(CY_CLOCK_ADC_Temp_intUabClock_H)
#define CY_CLOCK_ADC_Temp_intUabClock_H

#include <cytypes.h>
#include <cyfitter.h>


/***************************************
*        Function Prototypes
***************************************/
#if defined CYREG_PERI_DIV_CMD

void ADC_Temp_intUabClock_StartEx(uint32 alignClkDiv);
#define ADC_Temp_intUabClock_Start() \
    ADC_Temp_intUabClock_StartEx(ADC_Temp_intUabClock__PA_DIV_ID)

#else

void ADC_Temp_intUabClock_Start(void);

#endif/* CYREG_PERI_DIV_CMD */

void ADC_Temp_intUabClock_Stop(void);

void ADC_Temp_intUabClock_SetFractionalDividerRegister(uint16 clkDivider, uint8 clkFractional);

uint16 ADC_Temp_intUabClock_GetDividerRegister(void);
uint8  ADC_Temp_intUabClock_GetFractionalDividerRegister(void);

#define ADC_Temp_intUabClock_Enable()                         ADC_Temp_intUabClock_Start()
#define ADC_Temp_intUabClock_Disable()                        ADC_Temp_intUabClock_Stop()
#define ADC_Temp_intUabClock_SetDividerRegister(clkDivider, reset)  \
    ADC_Temp_intUabClock_SetFractionalDividerRegister((clkDivider), 0u)
#define ADC_Temp_intUabClock_SetDivider(clkDivider)           ADC_Temp_intUabClock_SetDividerRegister((clkDivider), 1u)
#define ADC_Temp_intUabClock_SetDividerValue(clkDivider)      ADC_Temp_intUabClock_SetDividerRegister((clkDivider) - 1u, 1u)


/***************************************
*             Registers
***************************************/
#if defined CYREG_PERI_DIV_CMD

#define ADC_Temp_intUabClock_DIV_ID     ADC_Temp_intUabClock__DIV_ID

#define ADC_Temp_intUabClock_CMD_REG    (*(reg32 *)CYREG_PERI_DIV_CMD)
#define ADC_Temp_intUabClock_CTRL_REG   (*(reg32 *)ADC_Temp_intUabClock__CTRL_REGISTER)
#define ADC_Temp_intUabClock_DIV_REG    (*(reg32 *)ADC_Temp_intUabClock__DIV_REGISTER)

#define ADC_Temp_intUabClock_CMD_DIV_SHIFT          (0u)
#define ADC_Temp_intUabClock_CMD_PA_DIV_SHIFT       (8u)
#define ADC_Temp_intUabClock_CMD_DISABLE_SHIFT      (30u)
#define ADC_Temp_intUabClock_CMD_ENABLE_SHIFT       (31u)

#define ADC_Temp_intUabClock_CMD_DISABLE_MASK       ((uint32)((uint32)1u << ADC_Temp_intUabClock_CMD_DISABLE_SHIFT))
#define ADC_Temp_intUabClock_CMD_ENABLE_MASK        ((uint32)((uint32)1u << ADC_Temp_intUabClock_CMD_ENABLE_SHIFT))

#define ADC_Temp_intUabClock_DIV_FRAC_MASK  (0x000000F8u)
#define ADC_Temp_intUabClock_DIV_FRAC_SHIFT (3u)
#define ADC_Temp_intUabClock_DIV_INT_MASK   (0xFFFFFF00u)
#define ADC_Temp_intUabClock_DIV_INT_SHIFT  (8u)

#else 

#define ADC_Temp_intUabClock_DIV_REG        (*(reg32 *)ADC_Temp_intUabClock__REGISTER)
#define ADC_Temp_intUabClock_ENABLE_REG     ADC_Temp_intUabClock_DIV_REG
#define ADC_Temp_intUabClock_DIV_FRAC_MASK  ADC_Temp_intUabClock__FRAC_MASK
#define ADC_Temp_intUabClock_DIV_FRAC_SHIFT (16u)
#define ADC_Temp_intUabClock_DIV_INT_MASK   ADC_Temp_intUabClock__DIVIDER_MASK
#define ADC_Temp_intUabClock_DIV_INT_SHIFT  (0u)

#endif/* CYREG_PERI_DIV_CMD */

#endif /* !defined(CY_CLOCK_ADC_Temp_intUabClock_H) */

/* [] END OF FILE */
