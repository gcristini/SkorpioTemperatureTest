/***************************************************************************//**
* \file     PGA_PVT.h
* \version  1.10
*
* \brief
*  This file contains the private constants and macros used in
*  the PGA_P4 Component code.
*
********************************************************************************
* \copyright
* Copyright 2016, Cypress Semiconductor Corporation.  All rights reserved.
* You may use this file only in accordance with the license, terms, conditions,
* disclaimers, and limitations in the end user license agreement accompanying
* the software package with which this file was provided.
*******************************************************************************/

#if !defined(CY_PGA_P4_PGA_PVT_H) 
#define CY_PGA_P4_PGA_PVT_H

#include "PGA.h"


/***************************************
*         Internal Constants
***************************************/
    
#define PGA_POWER                  ((uint32)3u)
#define PGA_GAIN                   ((uint32)10u)
    
#define PGA_POWER_MAX              (PGA_HIGH)
#define PGA_GAIN_MAX               (PGA_GAIN_32)

/* ((Gain steps / 2) + 1) */
#define PGA_COMP_TAB_HEIGHT        ((PGA_GAIN_MAX >> 1u) + 1u)
#define PGA_COMP_TAB_WIDTH         (PGA_POWER_MAX)
#define PGA_GET_COMP_TAB_GAIN_MASK (0x00000007u)

#define PGA_VREF_INTERNAL          (0u)
#define PGA_OUTPUT_MODE_10x        (1u)

#define PGA_DEFAULT_POWER          ((uint32)PGA_POWER << PGA_OA_PWR_MODE_SHIFT)
#define PGA_DEFAULT_GAIN           ((uint32)PGA_GAIN << PGA_RES_TAP_SHIFT)
#define PGA_DEFAULT_GAIN_POWER     (PGA_DEFAULT_GAIN | PGA_DEFAULT_POWER)


/***************************************
*    Variables with External Linkage
***************************************/

extern uint32 PGA_internalGainPower;
extern const uint32 PGA_compTab[PGA_COMP_TAB_HEIGHT][PGA_COMP_TAB_WIDTH];


/***************************************
*       Macro Definitions
***************************************/

/* Returns true if component available in Deep Sleep power mode */
#define PGA_CHECK_DEEPSLEEP_SUPPORT (PGA_DEEPSLEEP_SUPPORT != 0u)
/* Returns true if component uses 10x (Class AB) output buffer mode*/
#define PGA_CHECK_OUTPUT_MODE      (PGA_OUTPUT_MODE == PGA_OUTPUT_MODE_10x)
#define PGA_GET_DEEPSLEEP_ON       ((PGA_CHECK_DEEPSLEEP_SUPPORT) ? \
                                                    (PGA_DEEPSLEEP_ON) : (0u))
#define PGA_GET_OA_DRIVE_STR       ((PGA_CHECK_OUTPUT_MODE) ? \
                                                    (PGA_OA_DRIVE_STR_SEL_10X) : \
                                                        (PGA_OA_DRIVE_STR_SEL_1X))
#define PGA_GET_POWER              (PGA_internalGainPower & \
                                                    PGA_OA_PWR_MODE_MASK)
#define PGA_DEFAULT_CTB_CTRL       (PGA_GET_DEEPSLEEP_ON | PGA_ENABLED)
#define PGA_DEFAULT_OA_RES_CTRL    (PGA_GET_OA_DRIVE_STR | PGA_OA_PUMP_EN)
#define PGA_DEFAULT_OA_RES_CTRL_MASK (PGA_OA_DRIVE_STR_SEL_MASK | PGA_OA_PUMP_EN)
#define PGA_GET_COMP_TAB_GAIN      ((PGA_internalGainPower >> \
                                                    (PGA_RES_TAP_SHIFT + 1u)) & \
                                                        PGA_GET_COMP_TAB_GAIN_MASK)
#define PGA_GET_COMP_TAB           (PGA_compTab[PGA_GET_COMP_TAB_GAIN] \
                                                                         [PGA_GET_POWER - 1u])
#define PGA_GET_C_FB               (PGA_GET_COMP_TAB & PGA_C_FB_MASK)
#define PGA_GET_OA_COMP_TRIM       (PGA_GET_COMP_TAB & PGA_OA_COMP_TRIM_MASK)


#endif /* CY_PGA_P4_PGA_PVT_H */

/* [] END OF FILE */
