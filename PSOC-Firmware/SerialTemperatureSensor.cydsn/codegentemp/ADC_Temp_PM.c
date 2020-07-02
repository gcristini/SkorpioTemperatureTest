/***************************************************************************//**
* \file ADC_Temp_PM.c
* \version 3.10
*
* \brief
*  This file provides the power manager source code to the API for
*  ADC_Temp component.
*
********************************************************************************
* \copyright
* (c) 2015-2018, Cypress Semiconductor Corporation. All rights reserved.
* This software, including source code, documentation and related
* materials ("Software"), is owned by Cypress Semiconductor
* Corporation ("Cypress") and is protected by and subject to worldwide
* patent protection (United States and foreign), United States copyright
* laws and international treaty provisions. Therefore, you may use this
* Software only as provided in the license agreement accompanying the
* software package from which you obtained this Software ("EULA").
* If no EULA applies, Cypress hereby grants you a personal, nonexclusive,
* non-transferable license to copy, modify, and compile the
* Software source code solely for use in connection with Cypress's
* integrated circuit products. Any reproduction, modification, translation,
* compilation, or representation of this Software except as specified
* above is prohibited without the express written permission of Cypress.
* Disclaimer: THIS SOFTWARE IS PROVIDED AS-IS, WITH NO
* WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING,
* BUT NOT LIMITED TO, NONINFRINGEMENT, IMPLIED
* WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
* PARTICULAR PURPOSE. Cypress reserves the right to make
* changes to the Software without notice. Cypress does not assume any
* liability arising out of the application or use of the Software or any
* product or circuit described in the Software. Cypress does not
* authorize its products for use in any products where a malfunction or
* failure of the Cypress product may reasonably be expected to result in
* significant property damage, injury or death ("High Risk Product"). By
* including Cypress's product in a High Risk Product, the manufacturer
* of such system or application assumes all risk of such use and in doing
* so agrees to indemnify Cypress against all liability.
*******************************************************************************/

#include "ADC_Temp.h"

/**
* \addtogroup group_globals
* @{
*/
/** Contains configuration of ADC_Temp before sleep. Enable state is the
*   only data required to be preserved. */
static ADC_Temp_BACKUP_STRUCT  ADC_Temp_backup =
{
    0u,
};
/** @} globals */


/*******************************************************************************
* Function Name: ADC_Temp_Sleep
****************************************************************************//**
*
* \brief This is the preferred routine to prepare the component for sleep. The
* ADC_Temp_Sleep() routine saves the current component state. Then it
* calls the ADC_Temp_Stop() function and calls
* ADC_Temp_SaveConfig() to save the hardware configuration.
*
* Call the ADC_Temp_Sleep() function before calling the
* CySysPmDeepSleep() or the CySysPmHibernate() function. See the PSoC Creator
* System Reference Guide for more information about power-management functions.
*
* \param None
*
* \return None
*
* \sideeffect If this function is called twice in the enable state of the
* component, the disabled state of the component will be stored. So
* ADC_Temp_Enable() and ADC_Temp_StartConvert() must be called
* after ADC_Temp_Wakeup() in this case.
*
* \globalvars
*  \ref ADC_Temp_backup (W)
*
* \globalvars
*  \ref ADC_Temp_backup
*
*******************************************************************************/
void ADC_Temp_Sleep(void)
{
    ADC_Temp_backup.enableState = 0u;

    if((ADC_Temp_SAR_CTRL_REG  & ADC_Temp_SAR_CTRL_ENABLED_MSK) != 0u)
    {
        ADC_Temp_backup.enableState |= ADC_Temp_ENABLED;
        if((ADC_Temp_SAR_SAMPLE_CTRL_REG & ADC_Temp_SAR_SAMPLE_CTRL_CONTINUOUS_MSK) != 0u)
        {
            ADC_Temp_backup.enableState |= ADC_Temp_STARTED;
        }

        ADC_Temp_StopConvert();
        ADC_Temp_Stop();
    }

    /* Disable the SAR internal pump before entering the chip low power mode */
    if((ADC_Temp_SAR_CTRL_REG & ADC_Temp_SAR_CTRL_BOOSTPUMP_EN_MSK) != 0u)
    {
        ADC_Temp_SAR_CTRL_REG &= (uint32)~ADC_Temp_SAR_CTRL_BOOSTPUMP_EN_MSK;
        ADC_Temp_backup.enableState |= ADC_Temp_BOOSTPUMP_ENABLED;
    }
}


/*******************************************************************************
* Function Name: ADC_Temp_Wakeup
****************************************************************************//**
*
* \brief This is the preferred routine to restore the component to the state when
* ADC_Temp_Sleep() was called. The ADC_Temp_Wakeup() function
* calls the ADC_Temp_RestoreConfig() function to restore the
* configuration. If the component was enabled before the ADC_Temp_Sleep()
* function was called, the ADC_Temp_Wakeup() function also re-enables the
* component.
*
* \param None
*
* \return None
*
* \sideeffect
* Calling this function without previously calling ADC_Temp_Sleep() may lead to
* unpredictable results.
*
* \globalvars
*  \ref ADC_Temp_backup (R)
*
* \globalvars
*  \ref ADC_Temp_backup
*
*******************************************************************************/
void ADC_Temp_Wakeup(void)
{
    if((ADC_Temp_backup.enableState & ADC_Temp_ENABLED) != 0u)
    {
        /* Enable the SAR internal pump  */
        if((ADC_Temp_backup.enableState & ADC_Temp_BOOSTPUMP_ENABLED) != 0u)
        {
            ADC_Temp_SAR_CTRL_REG |= ADC_Temp_SAR_CTRL_BOOSTPUMP_EN_MSK;
        }

        ADC_Temp_Enable();

        if((ADC_Temp_backup.enableState & ADC_Temp_STARTED) != 0u)
        {
            ADC_Temp_StartConvert();
        }
    }
}

/* ****************************************************************************
* Function Name: ADC_Temp_SaveConfig
****************************************************************************//*
*
* \brief Saves the current configuration of ADC_Temp non-retention registers.
*
* \param None
*
* \return None
*
* \sideeffect None
*
*******************************************************************************/
void ADC_Temp_SaveConfig(void)
{
     /* All configuration registers are marked as [reset_all_retention] */
}

/* ****************************************************************************
* Function Name: ADC_Temp_RestoreConfig
****************************************************************************//*
*
* \brief Restores the configuration of ADC_Temp non-retention registers.
*
* \param None
*
* \return None
*
* \sideeffect Calling this function without previously calling
* ADC_Temp_SaveConfig() or ADC_Temp_Sleep will lead to
* unpredictable results.
*
*******************************************************************************/
void ADC_Temp_RestoreConfig(void)
{
    /* All configuration registers are marked as [reset_all_retention] */
}

/* [] END OF FILE */
