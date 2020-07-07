// ======================================================================
// SerialTemperatureSensor.v generated from TopDesign.cysch
// 07/02/2020 at 16:52
// This file is auto generated. ANY EDITS YOU MAKE MAY BE LOST WHEN THIS FILE IS REGENERATED!!!
// ======================================================================

`define CYDEV_CHIP_FAMILY_PSOC3 1
`define CYDEV_CHIP_FAMILY_PSOC4 2
`define CYDEV_CHIP_FAMILY_PSOC5 3
`define CYDEV_CHIP_FAMILY_PSOC6 4
`define CYDEV_CHIP_FAMILY_FM0P 5
`define CYDEV_CHIP_FAMILY_FM3 6
`define CYDEV_CHIP_FAMILY_FM4 7
`define CYDEV_CHIP_FAMILY_UNKNOWN 0
`define CYDEV_CHIP_MEMBER_UNKNOWN 0
`define CYDEV_CHIP_MEMBER_3A 1
`define CYDEV_CHIP_REVISION_3A_PRODUCTION 3
`define CYDEV_CHIP_REVISION_3A_ES3 3
`define CYDEV_CHIP_REVISION_3A_ES2 1
`define CYDEV_CHIP_REVISION_3A_ES1 0
`define CYDEV_CHIP_MEMBER_5B 2
`define CYDEV_CHIP_REVISION_5B_PRODUCTION 0
`define CYDEV_CHIP_REVISION_5B_ES0 0
`define CYDEV_CHIP_MEMBER_5A 3
`define CYDEV_CHIP_REVISION_5A_PRODUCTION 1
`define CYDEV_CHIP_REVISION_5A_ES1 1
`define CYDEV_CHIP_REVISION_5A_ES0 0
`define CYDEV_CHIP_MEMBER_4G 4
`define CYDEV_CHIP_REVISION_4G_PRODUCTION 17
`define CYDEV_CHIP_REVISION_4G_ES 17
`define CYDEV_CHIP_REVISION_4G_ES2 33
`define CYDEV_CHIP_MEMBER_4U 5
`define CYDEV_CHIP_REVISION_4U_PRODUCTION 0
`define CYDEV_CHIP_MEMBER_4E 6
`define CYDEV_CHIP_REVISION_4E_PRODUCTION 0
`define CYDEV_CHIP_REVISION_4E_CCG2_NO_USBPD 0
`define CYDEV_CHIP_MEMBER_4X 7
`define CYDEV_CHIP_REVISION_4X_PRODUCTION 0
`define CYDEV_CHIP_MEMBER_4O 8
`define CYDEV_CHIP_REVISION_4O_PRODUCTION 0
`define CYDEV_CHIP_MEMBER_4R 9
`define CYDEV_CHIP_REVISION_4R_PRODUCTION 0
`define CYDEV_CHIP_MEMBER_4T 10
`define CYDEV_CHIP_REVISION_4T_PRODUCTION 0
`define CYDEV_CHIP_MEMBER_4N 11
`define CYDEV_CHIP_REVISION_4N_PRODUCTION 0
`define CYDEV_CHIP_MEMBER_4S 12
`define CYDEV_CHIP_REVISION_4S_PRODUCTION 0
`define CYDEV_CHIP_MEMBER_4W 13
`define CYDEV_CHIP_REVISION_4W_PRODUCTION 0
`define CYDEV_CHIP_MEMBER_4AC 14
`define CYDEV_CHIP_REVISION_4AC_PRODUCTION 0
`define CYDEV_CHIP_MEMBER_4Q 15
`define CYDEV_CHIP_REVISION_4Q_PRODUCTION 0
`define CYDEV_CHIP_MEMBER_4Y 16
`define CYDEV_CHIP_REVISION_4Y_PRODUCTION 0
`define CYDEV_CHIP_MEMBER_4Z 17
`define CYDEV_CHIP_REVISION_4Z_PRODUCTION 0
`define CYDEV_CHIP_MEMBER_4D 18
`define CYDEV_CHIP_REVISION_4D_PRODUCTION 0
`define CYDEV_CHIP_MEMBER_4J 19
`define CYDEV_CHIP_REVISION_4J_PRODUCTION 0
`define CYDEV_CHIP_MEMBER_4K 20
`define CYDEV_CHIP_REVISION_4K_PRODUCTION 0
`define CYDEV_CHIP_MEMBER_4V 21
`define CYDEV_CHIP_REVISION_4V_PRODUCTION 0
`define CYDEV_CHIP_MEMBER_4H 22
`define CYDEV_CHIP_REVISION_4H_PRODUCTION 0
`define CYDEV_CHIP_MEMBER_4AA 23
`define CYDEV_CHIP_REVISION_4AA_PRODUCTION 0
`define CYDEV_CHIP_MEMBER_4A 24
`define CYDEV_CHIP_REVISION_4A_PRODUCTION 17
`define CYDEV_CHIP_REVISION_4A_ES0 17
`define CYDEV_CHIP_MEMBER_4F 25
`define CYDEV_CHIP_REVISION_4F_PRODUCTION 0
`define CYDEV_CHIP_REVISION_4F_PRODUCTION_256K 0
`define CYDEV_CHIP_REVISION_4F_PRODUCTION_256DMA 0
`define CYDEV_CHIP_MEMBER_4P 26
`define CYDEV_CHIP_REVISION_4P_PRODUCTION 0
`define CYDEV_CHIP_MEMBER_4M 27
`define CYDEV_CHIP_REVISION_4M_PRODUCTION 0
`define CYDEV_CHIP_MEMBER_4AB 28
`define CYDEV_CHIP_REVISION_4AB_PRODUCTION 0
`define CYDEV_CHIP_MEMBER_4L 29
`define CYDEV_CHIP_REVISION_4L_PRODUCTION 0
`define CYDEV_CHIP_MEMBER_4I 30
`define CYDEV_CHIP_REVISION_4I_PRODUCTION 0
`define CYDEV_CHIP_MEMBER_6A 31
`define CYDEV_CHIP_REVISION_6A_ES 17
`define CYDEV_CHIP_REVISION_6A_PRODUCTION 33
`define CYDEV_CHIP_REVISION_6A_NO_UDB 33
`define CYDEV_CHIP_MEMBER_PDL_FM0P_TYPE1 32
`define CYDEV_CHIP_REVISION_PDL_FM0P_TYPE1_PRODUCTION 0
`define CYDEV_CHIP_MEMBER_PDL_FM0P_TYPE2 33
`define CYDEV_CHIP_REVISION_PDL_FM0P_TYPE2_PRODUCTION 0
`define CYDEV_CHIP_MEMBER_PDL_FM0P_TYPE3 34
`define CYDEV_CHIP_REVISION_PDL_FM0P_TYPE3_PRODUCTION 0
`define CYDEV_CHIP_MEMBER_FM3 35
`define CYDEV_CHIP_REVISION_FM3_PRODUCTION 0
`define CYDEV_CHIP_MEMBER_FM4 36
`define CYDEV_CHIP_REVISION_FM4_PRODUCTION 0
`define CYDEV_CHIP_FAMILY_USED 2
`define CYDEV_CHIP_MEMBER_USED 30
`define CYDEV_CHIP_REVISION_USED 0
// Component: cy_virtualmux_v1_0
`ifdef CY_BLK_DIR
`undef CY_BLK_DIR
`endif

`ifdef WARP
`define CY_BLK_DIR "C:\Program Files (x86)\Cypress\PSoC Creator\4.3\PSoC Creator\psoc\content\CyPrimitives\cyprimitives.cylib\cy_virtualmux_v1_0"
`include "C:\Program Files (x86)\Cypress\PSoC Creator\4.3\PSoC Creator\psoc\content\CyPrimitives\cyprimitives.cylib\cy_virtualmux_v1_0\cy_virtualmux_v1_0.v"
`else
`define CY_BLK_DIR "C:\Program Files (x86)\Cypress\PSoC Creator\4.3\PSoC Creator\psoc\content\CyPrimitives\cyprimitives.cylib\cy_virtualmux_v1_0"
`include "C:\Program Files (x86)\Cypress\PSoC Creator\4.3\PSoC Creator\psoc\content\CyPrimitives\cyprimitives.cylib\cy_virtualmux_v1_0\cy_virtualmux_v1_0.v"
`endif

// Component: ZeroTerminal
`ifdef CY_BLK_DIR
`undef CY_BLK_DIR
`endif

`ifdef WARP
`define CY_BLK_DIR "C:\Program Files (x86)\Cypress\PSoC Creator\4.3\PSoC Creator\psoc\content\CyPrimitives\cyprimitives.cylib\ZeroTerminal"
`include "C:\Program Files (x86)\Cypress\PSoC Creator\4.3\PSoC Creator\psoc\content\CyPrimitives\cyprimitives.cylib\ZeroTerminal\ZeroTerminal.v"
`else
`define CY_BLK_DIR "C:\Program Files (x86)\Cypress\PSoC Creator\4.3\PSoC Creator\psoc\content\CyPrimitives\cyprimitives.cylib\ZeroTerminal"
`include "C:\Program Files (x86)\Cypress\PSoC Creator\4.3\PSoC Creator\psoc\content\CyPrimitives\cyprimitives.cylib\ZeroTerminal\ZeroTerminal.v"
`endif

// Component: or_v1_0
`ifdef CY_BLK_DIR
`undef CY_BLK_DIR
`endif

`ifdef WARP
`define CY_BLK_DIR "C:\Program Files (x86)\Cypress\PSoC Creator\4.3\PSoC Creator\psoc\content\CyPrimitives\cyprimitives.cylib\or_v1_0"
`include "C:\Program Files (x86)\Cypress\PSoC Creator\4.3\PSoC Creator\psoc\content\CyPrimitives\cyprimitives.cylib\or_v1_0\or_v1_0.v"
`else
`define CY_BLK_DIR "C:\Program Files (x86)\Cypress\PSoC Creator\4.3\PSoC Creator\psoc\content\CyPrimitives\cyprimitives.cylib\or_v1_0"
`include "C:\Program Files (x86)\Cypress\PSoC Creator\4.3\PSoC Creator\psoc\content\CyPrimitives\cyprimitives.cylib\or_v1_0\or_v1_0.v"
`endif

// SCB_P4_v4_0(ApplySbClockParam=false, BitWidthReplacementStringRx=uint8, BitWidthReplacementStringTx=uint8, BufNum=1, Cond=#, DBGW_SCB_IP_V0=false, DBGW_SCB_IP_V1=false, DBGW_SCB_IP_V2=true, DW_Hide_i2c=true, DW_Hide_Scbv0Feature=true, DW_Hide_Scbv2Feature=false, DW_Hide_Spi=true, DW_Hide_Uart=false, DW_Hide_UartFlowControl=false, DW_INTR_SPI_EC=, DW_INTR_SPI_EC_MASK=, DW_INTR_SPI_EC_MASKED=, DW_SPI_CTRL=, DW_SPI_STATUS=, DW_UART_CTRL=UART_PC_SCB__UART_CTRL, DW_UART_FLOW_CTRL=UART_PC_SCB__UART_FLOW_CTRL, DW_UART_RX_CTRL=UART_PC_SCB__UART_RX_CTRL, DW_UART_TX_CTRL=UART_PC_SCB__UART_TX_CTRL, EndCond=#endif, EzI2cBitWidthReplacementString=uint16, EzI2cBusVoltage=3.3, EzI2cByteModeEnable=false, EzI2cClkFreqDes=1550, EzI2cClockFromTerm=false, EzI2cClockStretching=true, EzI2cDataRate=100, EzI2cIsPrimarySlaveAddressHex=true, EzI2cIsSecondarySlaveAddressHex=true, EzI2cMedianFilterEnable=true, EzI2cNumberOfAddresses=0, EzI2cOvsFactor=16, EzI2cPrimarySlaveAddress=8, EzI2cSecondarySlaveAddress=9, EzI2cShowTerminals=false, EzI2cSlaveAddressMask=254, EzI2cSlewRate=0, EzI2cSubAddressSize=0, EzI2cWakeEnable=false, I2cAcceptAddress=false, I2cAcceptGeneralCall=false, I2cBusVoltage=3.3, I2cBusVoltageLevel=, I2cByteModeEnable=false, I2cClkFreqDes=1550, I2cClockFromTerm=false, I2cDataRate=100, I2cExternIntrHandler=false, I2cIsSlaveAddressHex=true, I2cIsSlaveAddressMaskHex=true, I2cManualOversampleControl=true, I2cMedianFilterEnable=true, I2cMode=1, I2cOvsFactor=16, I2cOvsFactorHigh=8, I2cOvsFactorLow=8, I2cShowTerminals=false, I2cSlaveAddress=8, I2cSlaveAddressMask=254, I2cSlewRate=0, I2cSlewRateSettings=0, I2cTermsEnable=false, I2cWakeEnable=false, PinLocationP4A=true, PinName0Unconfig=uart_rx_i2c_scl_spi_mosi, PinName0UnconfigWake=uart_rx_wake_i2c_scl_spi_mosi, PinName1Unconfig=uart_tx_i2c_sda_spi_miso, PinName2Unconfig=uart_cts_spi_sclk, PinName3Unconfig=uart_rts_spi_ss0, Pn0Unconfig=RX_SCL_MOSI, Pn0UnconfigWake=RX_WAKE_SCL_MOSI, Pn1Unconfig=TX_SDA_MISO, Pn2Unconfig=CTS_SCLK, Pn3Unconfig=RTS_SS0, RemoveI2cPins=true, RemoveMisoSdaTx=true, RemoveMosiSclRx=true, RemoveMosiSclRxWake=true, RemoveScbClk=false, RemoveScbIrq=false, RemoveSpiMasterMiso=true, RemoveSpiMasterMosi=true, RemoveSpiMasterPins=true, RemoveSpiMasterSclk=true, RemoveSpiMasterSs0Pin=true, RemoveSpiMasterSs1Pin=true, RemoveSpiMasterSs2Pin=true, RemoveSpiMasterSs3Pin=true, RemoveSpiSclk=true, RemoveSpiSlaveMiso=true, RemoveSpiSlaveMosi=true, RemoveSpiSlavePins=true, RemoveSpiSs0=true, RemoveSpiSs1=true, RemoveSpiSs2=true, RemoveSpiSs3=true, RemoveUartCtsPin=true, RemoveUartRtsPin=true, RemoveUartRxPin=false, RemoveUartRxTxPin=true, RemoveUartRxWake=true, RemoveUartRxWakeupIrq=true, RemoveUartTxPin=false, RxTriggerOutputEnable=false, ScbClkFreqDes=1382.4, ScbClkMinusTolerance=5, ScbClkPlusTolerance=5, ScbClockSelect=1, ScbClockTermEnable=false, ScbCustomIntrHandlerEnable=true, ScbInterruptTermEnable=false, ScbMisoSdaTxEnable=true, ScbMode=4, ScbModeHw=2, ScbMosiSclRxEnable=true, ScbRxWakeIrqEnable=false, ScbSclkEnable=false, ScbSs0Enable=false, ScbSs1Enable=false, ScbSs2Enable=false, ScbSs3Enable=false, ScbSymbolVisibility=0, SpiBitRate=1000, SpiBitsOrder=1, SpiByteModeEnable=false, SpiClkFreqDes=16000, SpiClockFromTerm=false, SpiFreeRunningSclk=false, SpiInterruptMode=0, SpiIntrMasterSpiDone=false, SpiIntrRxFull=false, SpiIntrRxNotEmpty=false, SpiIntrRxOverflow=false, SpiIntrRxTrigger=false, SpiIntrRxUnderflow=false, SpiIntrSlaveBusError=false, SpiIntrTxEmpty=false, SpiIntrTxNotFull=false, SpiIntrTxOverflow=false, SpiIntrTxTrigger=false, SpiIntrTxUnderflow=false, SpiLateMisoSampleEnable=false, SpiManualOversampleControl=true, SpiMasterMode=false, SpiMedianFilterEnable=false, SpimMisoTermEnable=false, SpimMosiTermEnable=false, SpiMode=0, SpimSclkTermEnable=false, SpimSs0TermEnable=false, SpimSs1TermEnable=false, SpimSs2TermEnable=false, SpimSs3TermEnable=false, SpiNumberOfRxDataBits=8, SpiNumberOfSelectLines=1, SpiNumberOfTxDataBits=8, SpiOvsFactor=16, SpiRemoveMiso=false, SpiRemoveMosi=false, SpiRemoveSclk=false, SpiRxBufferSize=8, SpiRxIntrMask=0, SpiRxOutputEnable=false, SpiRxTriggerLevel=7, SpiSclkMode=0, SpiSlaveMode=false, SpiSmartioEnable=false, SpisMisoTermEnable=false, SpisMosiTermEnable=false, SpiSs0Polarity=0, SpiSs1Polarity=0, SpiSs2Polarity=0, SpiSs3Polarity=0, SpisSclkTermEnable=false, SpisSsTermEnable=false, SpiSubMode=0, SpiTransferSeparation=1, SpiTxBufferSize=8, SpiTxIntrMask=0, SpiTxOutputEnable=false, SpiTxTriggerLevel=0, SpiWakeEnable=false, TriggerOutputEnable=false, TxTriggerOutputEnable=false, UartByteModeEnable=false, UartClkFreqDes=1382.4, UartClockFromTerm=false, UartCtsEnable=false, UartCtsPolarity=0, UartCtsTermEnable=false, UartDataRate=115200, UartDirection=3, UartDropOnFrameErr=false, UartDropOnParityErr=false, UartInterruptMode=1, UartIntrRxBreakDetected=false, UartIntrRxFrameErr=false, UartIntrRxFull=false, UartIntrRxNotEmpty=true, UartIntrRxOverflow=false, UartIntrRxParityErr=false, UartIntrRxTrigger=false, UartIntrRxUnderflow=false, UartIntrTxEmpty=false, UartIntrTxNotFull=false, UartIntrTxOverflow=false, UartIntrTxTrigger=false, UartIntrTxUartDone=false, UartIntrTxUartLostArb=false, UartIntrTxUartNack=false, UartIntrTxUnderflow=false, UartIrdaLowPower=false, UartIrdaPolarity=0, UartMedianFilterEnable=false, UartMpEnable=false, UartMpRxAcceptAddress=false, UartMpRxAddress=2, UartMpRxAddressMask=255, UartNumberOfDataBits=8, UartNumberOfStopBits=2, UartOvsFactor=12, UartParityType=2, UartRtsEnable=false, UartRtsPolarity=0, UartRtsTermEnable=false, UartRtsTriggerLevel=4, UartRxBreakWidth=11, UartRxBufferSize=8, UartRxEnable=true, UartRxIntrMask=4, UartRxOutputEnable=false, UartRxTermEnable=false, UartRxTriggerLevel=7, UartRxTxTermEnable=false, UartSmartioEnable=false, UartSmCardRetryOnNack=false, UartSubMode=0, UartTxBufferSize=8, UartTxEnable=true, UartTxIntrMask=0, UartTxOutputEnable=false, UartTxTermEnable=false, UartTxTriggerLevel=0, UartWakeEnable=false, CY_API_CALLBACK_HEADER_INCLUDE=#include "cyapicallbacks.h", CY_COMMENT=, CY_COMPONENT_NAME=SCB_P4_v4_0, CY_CONFIG_TITLE=UART_PC, CY_CONST_CONFIG=true, CY_CONTROL_FILE=<:default:>, CY_DATASHEET_FILE=<:default:>, CY_FITTER_NAME=UART_PC, CY_INSTANCE_SHORT_NAME=UART_PC, CY_MAJOR_VERSION=4, CY_MINOR_VERSION=0, CY_PDL_DRIVER_NAME=, CY_PDL_DRIVER_REQ_VERSION=, CY_PDL_DRIVER_SUBGROUP=, CY_PDL_DRIVER_VARIANT=, CY_REMOVE=false, CY_SUPPRESS_API_GEN=false, CY_VERSION=PSoC Creator  4.3, INSTANCE_NAME=UART_PC, )
module SCB_P4_v4_0_0 (
    cts_in,
    rts_out,
    interrupt,
    clock,
    rx_dma_out,
    tx_dma_out,
    s_mosi,
    s_sclk,
    s_ss,
    m_miso,
    m_mosi,
    m_sclk,
    m_ss0,
    m_ss1,
    m_ss2,
    m_ss3,
    s_miso,
    rx_in,
    tx_out,
    scl_b,
    sda_b,
    rx_tx_out);
    input       cts_in;
    output      rts_out;
    output      interrupt;
    input       clock;
    output      rx_dma_out;
    output      tx_dma_out;
    input       s_mosi;
    input       s_sclk;
    input       s_ss;
    input       m_miso;
    output      m_mosi;
    output      m_sclk;
    output      m_ss0;
    output      m_ss1;
    output      m_ss2;
    output      m_ss3;
    output      s_miso;
    input       rx_in;
    output      tx_out;
    inout       scl_b;
    inout       sda_b;
    output      rx_tx_out;


          wire  uncfg_rx_irq;
          wire  sclk_m_wire;
          wire  Net_1264;
          wire  Net_1258;
          wire  rx_irq;
          wire [3:0] select_m_wire;
          wire  Net_1099;
          wire  Net_1090;
          wire  Net_467;
          wire  Net_1316;
          wire  Net_252;
          wire  Net_1089;
          wire  Net_1320;
          wire  Net_1257;
          wire  sclk_s_wire;
          wire  Net_1268;
          wire  Net_1297;
          wire  Net_547;
          wire  Net_1001;
          wire  mosi_s_wire;
          wire  rts_wire;
          wire  mosi_m_wire;
          wire  Net_891;
          wire  Net_1263;
          wire  miso_s_wire;
          wire  cts_wire;
          wire  Net_899;
          wire  tx_wire;
          wire  Net_1028;
          wire  rx_wire;
          wire  Net_916;
          wire  Net_1000;
          wire  miso_m_wire;
          wire  Net_1172;
          wire  Net_1170;
          wire  select_s_wire;
          wire  Net_847;


	cy_clock_v1_0
		#(.id("43ec2fa1-bf22-4b71-9477-b6ca7b97f0b0/2dc2d7a8-ce2b-43c7-af4a-821c8cd73ccf"),
		  .source_clock_id(""),
		  .divisor(0),
		  .period("723379629.62963"),
		  .is_direct(0),
		  .is_digital(0))
		SCBCLK
		 (.clock_out(Net_847));


	// select_s_VM (cy_virtualmux_v1_0)
	assign select_s_wire = s_ss;

	// rx_VM (cy_virtualmux_v1_0)
	assign rx_wire = Net_1268;

	// rx_wake_VM (cy_virtualmux_v1_0)
	assign Net_1257 = uncfg_rx_irq;

	// clock_VM (cy_virtualmux_v1_0)
	assign Net_1170 = Net_847;

	// sclk_s_VM (cy_virtualmux_v1_0)
	assign sclk_s_wire = s_sclk;

	// mosi_s_VM (cy_virtualmux_v1_0)
	assign mosi_s_wire = s_mosi;

	// miso_m_VM (cy_virtualmux_v1_0)
	assign miso_m_wire = m_miso;

	wire [0:0] tmpOE__tx_net;
	wire [0:0] tmpFB_0__tx_net;
	wire [0:0] tmpIO_0__tx_net;
	wire [0:0] tmpINTERRUPT_0__tx_net;
	electrical [0:0] tmpSIOVREF__tx_net;

	cy_psoc3_pins_v1_10
		#(.id("43ec2fa1-bf22-4b71-9477-b6ca7b97f0b0/23b8206d-1c77-4e61-be4a-b4037d5de5fc"),
		  .drive_mode(3'b110),
		  .ibuf_enabled(1'b0),
		  .init_dr_st(1'b1),
		  .input_clk_en(0),
		  .input_sync(1'b0),
		  .input_sync_mode(1'b0),
		  .intr_mode(2'b00),
		  .invert_in_clock(0),
		  .invert_in_clock_en(0),
		  .invert_in_reset(0),
		  .invert_out_clock(0),
		  .invert_out_clock_en(0),
		  .invert_out_reset(0),
		  .io_voltage(""),
		  .layout_mode("CONTIGUOUS"),
		  .oe_conn(1'b0),
		  .oe_reset(0),
		  .oe_sync(1'b0),
		  .output_clk_en(0),
		  .output_clock_mode(1'b0),
		  .output_conn(1'b1),
		  .output_mode(1'b0),
		  .output_reset(0),
		  .output_sync(1'b0),
		  .pa_in_clock(-1),
		  .pa_in_clock_en(-1),
		  .pa_in_reset(-1),
		  .pa_out_clock(-1),
		  .pa_out_clock_en(-1),
		  .pa_out_reset(-1),
		  .pin_aliases(""),
		  .pin_mode("B"),
		  .por_state(4),
		  .sio_group_cnt(0),
		  .sio_hyst(1'b1),
		  .sio_ibuf(""),
		  .sio_info(2'b00),
		  .sio_obuf(""),
		  .sio_refsel(""),
		  .sio_vtrip(""),
		  .sio_hifreq(""),
		  .sio_vohsel(""),
		  .slew_rate(1'b0),
		  .spanning(0),
		  .use_annotation(1'b0),
		  .vtrip(2'b00),
		  .width(1),
		  .ovt_hyst_trim(1'b0),
		  .ovt_needed(1'b0),
		  .ovt_slew_control(2'b00),
		  .input_buffer_sel(2'b00))
		tx
		 (.oe(tmpOE__tx_net),
		  .y({tx_wire}),
		  .fb({tmpFB_0__tx_net[0:0]}),
		  .io({tmpIO_0__tx_net[0:0]}),
		  .siovref(tmpSIOVREF__tx_net),
		  .interrupt({tmpINTERRUPT_0__tx_net[0:0]}),
		  .in_clock({1'b0}),
		  .in_clock_en({1'b1}),
		  .in_reset({1'b0}),
		  .out_clock({1'b0}),
		  .out_clock_en({1'b1}),
		  .out_reset({1'b0}));

	assign tmpOE__tx_net = (`CYDEV_CHIP_MEMBER_USED == `CYDEV_CHIP_MEMBER_3A && `CYDEV_CHIP_REVISION_USED < `CYDEV_CHIP_REVISION_3A_ES3) ? ~{1'b1} : {1'b1};

    ZeroTerminal ZeroTerminal_7 (
        .z(Net_1099));


    assign Net_1258 = Net_1099 | Net_847;


	cy_isr_v1_0
		#(.int_type(2'b10))
		SCB_IRQ
		 (.int_signal(interrupt));


	wire [0:0] tmpOE__rx_net;
	wire [0:0] tmpIO_0__rx_net;
	wire [0:0] tmpINTERRUPT_0__rx_net;
	electrical [0:0] tmpSIOVREF__rx_net;

	cy_psoc3_pins_v1_10
		#(.id("43ec2fa1-bf22-4b71-9477-b6ca7b97f0b0/78e33e5d-45ea-4b75-88d5-73274e8a7ce4"),
		  .drive_mode(3'b001),
		  .ibuf_enabled(1'b1),
		  .init_dr_st(1'b0),
		  .input_clk_en(0),
		  .input_sync(1'b0),
		  .input_sync_mode(1'b0),
		  .intr_mode(2'b00),
		  .invert_in_clock(0),
		  .invert_in_clock_en(0),
		  .invert_in_reset(0),
		  .invert_out_clock(0),
		  .invert_out_clock_en(0),
		  .invert_out_reset(0),
		  .io_voltage(""),
		  .layout_mode("CONTIGUOUS"),
		  .oe_conn(1'b0),
		  .oe_reset(0),
		  .oe_sync(1'b0),
		  .output_clk_en(0),
		  .output_clock_mode(1'b0),
		  .output_conn(1'b0),
		  .output_mode(1'b0),
		  .output_reset(0),
		  .output_sync(1'b0),
		  .pa_in_clock(-1),
		  .pa_in_clock_en(-1),
		  .pa_in_reset(-1),
		  .pa_out_clock(-1),
		  .pa_out_clock_en(-1),
		  .pa_out_reset(-1),
		  .pin_aliases(""),
		  .pin_mode("I"),
		  .por_state(4),
		  .sio_group_cnt(0),
		  .sio_hyst(1'b1),
		  .sio_ibuf(""),
		  .sio_info(2'b00),
		  .sio_obuf(""),
		  .sio_refsel(""),
		  .sio_vtrip(""),
		  .sio_hifreq(""),
		  .sio_vohsel(""),
		  .slew_rate(1'b0),
		  .spanning(0),
		  .use_annotation(1'b0),
		  .vtrip(2'b00),
		  .width(1),
		  .ovt_hyst_trim(1'b0),
		  .ovt_needed(1'b0),
		  .ovt_slew_control(2'b00),
		  .input_buffer_sel(2'b00))
		rx
		 (.oe(tmpOE__rx_net),
		  .y({1'b0}),
		  .fb({Net_1268}),
		  .io({tmpIO_0__rx_net[0:0]}),
		  .siovref(tmpSIOVREF__rx_net),
		  .interrupt({tmpINTERRUPT_0__rx_net[0:0]}),
		  .in_clock({1'b0}),
		  .in_clock_en({1'b1}),
		  .in_reset({1'b0}),
		  .out_clock({1'b0}),
		  .out_clock_en({1'b1}),
		  .out_reset({1'b0}));

	assign tmpOE__rx_net = (`CYDEV_CHIP_MEMBER_USED == `CYDEV_CHIP_MEMBER_3A && `CYDEV_CHIP_REVISION_USED < `CYDEV_CHIP_REVISION_3A_ES3) ? ~{1'b1} : {1'b1};

	// cts_VM (cy_virtualmux_v1_0)
	assign cts_wire = cts_in;

    cy_m0s8_scb_v2_0 SCB (
        .rx(rx_wire),
        .miso_m(miso_m_wire),
        .select_m(select_m_wire[3:0]),
        .sclk_m(sclk_m_wire),
        .mosi_s(mosi_s_wire),
        .select_s(select_s_wire),
        .sclk_s(sclk_s_wire),
        .mosi_m(mosi_m_wire),
        .scl(scl_b),
        .sda(sda_b),
        .tx(tx_wire),
        .miso_s(miso_s_wire),
        .interrupt(interrupt),
        .cts(cts_wire),
        .rts(rts_wire),
        .tx_req(tx_dma_out),
        .rx_req(rx_dma_out),
        .clock(Net_1170));
    defparam SCB.scb_mode = 2;

	// Device_VM4 (cy_virtualmux_v1_0)
	assign uncfg_rx_irq = Net_1028;


    assign rts_out = rts_wire;

    assign m_mosi = mosi_m_wire;

    assign m_sclk = sclk_m_wire;

    assign m_ss0 = select_m_wire[0];

    assign m_ss1 = select_m_wire[1];

    assign m_ss2 = select_m_wire[2];

    assign m_ss3 = select_m_wire[3];

    assign s_miso = miso_s_wire;

    assign tx_out = tx_wire;

    assign rx_tx_out = tx_wire;


endmodule

// Component: cy_analog_virtualmux_v1_0
`ifdef CY_BLK_DIR
`undef CY_BLK_DIR
`endif

`ifdef WARP
`define CY_BLK_DIR "C:\Program Files (x86)\Cypress\PSoC Creator\4.3\PSoC Creator\psoc\content\CyPrimitives\cyprimitives.cylib\cy_analog_virtualmux_v1_0"
`include "C:\Program Files (x86)\Cypress\PSoC Creator\4.3\PSoC Creator\psoc\content\CyPrimitives\cyprimitives.cylib\cy_analog_virtualmux_v1_0\cy_analog_virtualmux_v1_0.v"
`else
`define CY_BLK_DIR "C:\Program Files (x86)\Cypress\PSoC Creator\4.3\PSoC Creator\psoc\content\CyPrimitives\cyprimitives.cylib\cy_analog_virtualmux_v1_0"
`include "C:\Program Files (x86)\Cypress\PSoC Creator\4.3\PSoC Creator\psoc\content\CyPrimitives\cyprimitives.cylib\cy_analog_virtualmux_v1_0\cy_analog_virtualmux_v1_0.v"
`endif

// PGA_P4_v1_10(DeepSleepOperation=0, Gain=10, OutputBuffer=0, Power=3, Vref_Input=0, CY_API_CALLBACK_HEADER_INCLUDE=#include "cyapicallbacks.h", CY_COMMENT=, CY_COMPONENT_NAME=PGA_P4_v1_10, CY_CONFIG_TITLE=PGA, CY_CONST_CONFIG=true, CY_CONTROL_FILE=<:default:>, CY_DATASHEET_FILE=<:default:>, CY_FITTER_NAME=PGA, CY_INSTANCE_SHORT_NAME=PGA, CY_MAJOR_VERSION=1, CY_MINOR_VERSION=10, CY_PDL_DRIVER_NAME=, CY_PDL_DRIVER_REQ_VERSION=, CY_PDL_DRIVER_SUBGROUP=, CY_PDL_DRIVER_VARIANT=, CY_REMOVE=false, CY_SUPPRESS_API_GEN=false, CY_VERSION=PSoC Creator  4.3, INSTANCE_NAME=PGA, )
module PGA_P4_v1_10_1 (
    Vin,
    Vref,
    Vout);
    inout       Vin;
    electrical  Vin;
    inout       Vref;
    electrical  Vref;
    inout       Vout;
    electrical  Vout;


    electrical  Net_51;
          wire  Net_12;
    electrical  Net_29;
    electrical  Net_39;
    electrical  Net_19;
    electrical  Net_18;

    cy_psoc4_abuf_v1_0 cy_psoc4_abuf (
        .vplus(Vin),
        .vminus(Net_29),
        .vout1(Net_18),
        .vout10(Net_19),
        .rs_bot(Net_39),
        .cmpout(Net_12));
    defparam cy_psoc4_abuf.deepsleep_available = 0;
    defparam cy_psoc4_abuf.has_resistor = 1;
    defparam cy_psoc4_abuf.needs_dsab = 0;

	// cy_analog_virtualmux_2 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 cy_analog_virtualmux_2_connect(Vout, Net_18);
	defparam cy_analog_virtualmux_2_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_1 (
        .noconnect(Net_29));

    cy_analog_noconnect_v1_0 cy_analog_noconnect_2 (
        .noconnect(Net_51));

	// cy_analog_virtualmux_1 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 cy_analog_virtualmux_1_connect(Net_39, Net_51);
	defparam cy_analog_virtualmux_1_connect.sig_width = 1;



endmodule

// Component: Bus_Connect_v2_50
`ifdef CY_BLK_DIR
`undef CY_BLK_DIR
`endif

`ifdef WARP
`define CY_BLK_DIR "C:\Program Files (x86)\Cypress\PSoC Creator\4.3\PSoC Creator\psoc\content\CyComponentLibrary\CyComponentLibrary.cylib\Bus_Connect_v2_50"
`include "C:\Program Files (x86)\Cypress\PSoC Creator\4.3\PSoC Creator\psoc\content\CyComponentLibrary\CyComponentLibrary.cylib\Bus_Connect_v2_50\Bus_Connect_v2_50.v"
`else
`define CY_BLK_DIR "C:\Program Files (x86)\Cypress\PSoC Creator\4.3\PSoC Creator\psoc\content\CyComponentLibrary\CyComponentLibrary.cylib\Bus_Connect_v2_50"
`include "C:\Program Files (x86)\Cypress\PSoC Creator\4.3\PSoC Creator\psoc\content\CyComponentLibrary\CyComponentLibrary.cylib\Bus_Connect_v2_50\Bus_Connect_v2_50.v"
`endif

// Component: cy_vref_v1_70
`ifdef CY_BLK_DIR
`undef CY_BLK_DIR
`endif

`ifdef WARP
`define CY_BLK_DIR "C:\Program Files (x86)\Cypress\PSoC Creator\4.3\PSoC Creator\psoc\content\CyPrimitives\cyprimitives.cylib\cy_vref_v1_70"
`include "C:\Program Files (x86)\Cypress\PSoC Creator\4.3\PSoC Creator\psoc\content\CyPrimitives\cyprimitives.cylib\cy_vref_v1_70\cy_vref_v1_70.v"
`else
`define CY_BLK_DIR "C:\Program Files (x86)\Cypress\PSoC Creator\4.3\PSoC Creator\psoc\content\CyPrimitives\cyprimitives.cylib\cy_vref_v1_70"
`include "C:\Program Files (x86)\Cypress\PSoC Creator\4.3\PSoC Creator\psoc\content\CyPrimitives\cyprimitives.cylib\cy_vref_v1_70\cy_vref_v1_70.v"
`endif

// Scan_ADC_v3_10(AclkMuxSelect=1, Config0=<?xml version="1.0" encoding="utf-16"?><CyConfigModel xmlns:Version="3_10"><SampleRateEditor>true</SampleRateEditor><SampleRate>100000</SampleRate><FreeRunning>true</FreeRunning><UseSoc>false</UseSoc><VrefBypass>true</VrefBypass><VrefSource>VREFSOURCE_VBGR</VrefSource><VrefVoltage>1.2</VrefVoltage><VnegSource>VNEGSOURCE_VREFSHORT</VnegSource><DiffResultFormat>SIGNED_FORMAT</DiffResultFormat><SingleEndedResultFormat>SIGNED_FORMAT</SingleEndedResultFormat><SamplesAveraged>FOUR_SAMPLES</SamplesAveraged><AveragingMode>INTERLEAVED_AVG</AveragingMode><AlternateResolution>EIGHT_BIT</AlternateResolution><CompareMode>LESS_THAN</CompareMode><LowLimit>512</LowLimit><HighLimit>3584</HighLimit><NumChannels>1</NumChannels><ChannelList><CyChannelModel><Enabled>true</Enabled><UseAltResolution>false</UseAltResolution><InputMode>SINGLE_ENDED_CHAN</InputMode><UseAveraging>false</UseAveraging><MinimumAcqTime>194</MinimumAcqTime><UseLimitInterrupt>false</UseLimitInterrupt><ActualAcqTime>8792</ActualAcqTime><UseSaturationInterrupt>false</UseSaturationInterrupt><ApertureTimer>0</ApertureTimer></CyChannelModel></ChannelList><ApertureTimers><int>106</int><int>2</int><int>2</int><int>2</int></ApertureTimers><AdcClockDivider>2</AdcClockDivider><FilterUabStartDelay>0</FilterUabStartDelay><ActualSampleRate>100000</ActualSampleRate><ActualAdcClockHz>12000000</ActualAdcClockHz><ActualScanUs>10</ActualScanUs></CyConfigModel>, Config0Filter=<pass_type=LOW_PASS>\r\n<shape=BUTTERWORTH>\r\n<primary_freq=10>\r\n<secondary_freq=-1>\r\n<notchEnabled=False>\r\n<modBitEnabled=False>\r\n<sampleRate=1000>\r\n<uabClockDivider=0>\r\n<sampleRateSource=AUTO>\r\n<filterGain_dB=0>\r\n<filterGain_Linear=1>\r\n<gainScale=DB>\r\n, Config0FilterDisplay=<FreqAxisUpper=150>\r\n<FreqAxisLower=0>\r\n<GainAxisUpper=0>\r\n<GainAxisLower=-140>\r\n<Display=16829571>\r\n, Config1=<?xml version="1.0" encoding="utf-16"?><CyConfigModel xmlns:Version="3_10"><SampleRateEditor>true</SampleRateEditor><SampleRate>100000</SampleRate><FreeRunning>true</FreeRunning><UseSoc>false</UseSoc><VrefBypass>true</VrefBypass><VrefSource>VREFSOURCE_VBGR</VrefSource><VrefVoltage>1.2</VrefVoltage><VnegSource>VNEGSOURCE_VREFSHORT</VnegSource><DiffResultFormat>SIGNED_FORMAT</DiffResultFormat><SingleEndedResultFormat>UNSIGNED_FORMAT</SingleEndedResultFormat><SamplesAveraged>TWO_SAMPLES</SamplesAveraged><AveragingMode>SEQUENTIAL_AVG</AveragingMode><AlternateResolution>EIGHT_BIT</AlternateResolution><CompareMode>LESS_THAN</CompareMode><LowLimit>512</LowLimit><HighLimit>3584</HighLimit><NumChannels>2</NumChannels><ChannelList><CyChannelModel><Enabled>true</Enabled><UseAltResolution>false</UseAltResolution><InputMode>DIFFERENTIAL_CHAN</InputMode><UseAveraging>false</UseAveraging><MinimumAcqTime>194</MinimumAcqTime><UseLimitInterrupt>false</UseLimitInterrupt><ActualAcqTime>7375</ActualAcqTime><UseSaturationInterrupt>false</UseSaturationInterrupt><ApertureTimer>0</ApertureTimer></CyChannelModel><CyChannelModel><Enabled>true</Enabled><UseAltResolution>false</UseAltResolution><InputMode>DIFFERENTIAL_CHAN</InputMode><UseAveraging>false</UseAveraging><MinimumAcqTime>194</MinimumAcqTime><UseLimitInterrupt>false</UseLimitInterrupt><ActualAcqTime>208</ActualAcqTime><UseSaturationInterrupt>false</UseSaturationInterrupt><ApertureTimer>1</ApertureTimer></CyChannelModel></ChannelList><ApertureTimers><int>89</int><int>3</int><int>2</int><int>2</int></ApertureTimers><AdcClockDivider>2</AdcClockDivider><FilterUabStartDelay>0</FilterUabStartDelay><ActualSampleRate>100000</ActualSampleRate><ActualAdcClockHz>12000000</ActualAdcClockHz><ActualScanUs>10</ActualScanUs></CyConfigModel>, Config1Filter=<pass_type=LOW_PASS>\r\n<shape=BUTTERWORTH>\r\n<primary_freq=10>\r\n<secondary_freq=-1>\r\n<notchEnabled=False>\r\n<modBitEnabled=False>\r\n<sampleRate=1000>\r\n<uabClockDivider=0>\r\n<sampleRateSource=AUTO>\r\n<filterGain_dB=0>\r\n<filterGain_Linear=1>\r\n<gainScale=DB>\r\n, Config1FilterDisplay=<FreqAxisUpper=150>\r\n<FreqAxisLower=0>\r\n<GainAxisUpper=0>\r\n<GainAxisLower=-140>\r\n<Display=16829571>\r\n, Config2=<?xml version="1.0" encoding="utf-16"?><CyConfigModel xmlns:Version="3_10"><SampleRateEditor>true</SampleRateEditor><SampleRate>100000</SampleRate><FreeRunning>true</FreeRunning><UseSoc>false</UseSoc><VrefBypass>true</VrefBypass><VrefSource>VREFSOURCE_VBGR</VrefSource><VrefVoltage>1.2</VrefVoltage><VnegSource>VNEGSOURCE_VREFSHORT</VnegSource><DiffResultFormat>SIGNED_FORMAT</DiffResultFormat><SingleEndedResultFormat>UNSIGNED_FORMAT</SingleEndedResultFormat><SamplesAveraged>TWO_SAMPLES</SamplesAveraged><AveragingMode>SEQUENTIAL_AVG</AveragingMode><AlternateResolution>EIGHT_BIT</AlternateResolution><CompareMode>LESS_THAN</CompareMode><LowLimit>512</LowLimit><HighLimit>3584</HighLimit><NumChannels>2</NumChannels><ChannelList><CyChannelModel><Enabled>true</Enabled><UseAltResolution>false</UseAltResolution><InputMode>DIFFERENTIAL_CHAN</InputMode><UseAveraging>false</UseAveraging><MinimumAcqTime>194</MinimumAcqTime><UseLimitInterrupt>false</UseLimitInterrupt><ActualAcqTime>7375</ActualAcqTime><UseSaturationInterrupt>false</UseSaturationInterrupt><ApertureTimer>0</ApertureTimer></CyChannelModel><CyChannelModel><Enabled>true</Enabled><UseAltResolution>false</UseAltResolution><InputMode>DIFFERENTIAL_CHAN</InputMode><UseAveraging>false</UseAveraging><MinimumAcqTime>194</MinimumAcqTime><UseLimitInterrupt>false</UseLimitInterrupt><ActualAcqTime>208</ActualAcqTime><UseSaturationInterrupt>false</UseSaturationInterrupt><ApertureTimer>1</ApertureTimer></CyChannelModel></ChannelList><ApertureTimers><int>89</int><int>3</int><int>2</int><int>2</int></ApertureTimers><AdcClockDivider>2</AdcClockDivider><FilterUabStartDelay>0</FilterUabStartDelay><ActualSampleRate>100000</ActualSampleRate><ActualAdcClockHz>12000000</ActualAdcClockHz><ActualScanUs>10</ActualScanUs></CyConfigModel>, Config2Filter=<pass_type=LOW_PASS>\r\n<shape=BUTTERWORTH>\r\n<primary_freq=10>\r\n<secondary_freq=-1>\r\n<notchEnabled=False>\r\n<modBitEnabled=False>\r\n<sampleRate=1000>\r\n<uabClockDivider=0>\r\n<sampleRateSource=AUTO>\r\n<filterGain_dB=0>\r\n<filterGain_Linear=1>\r\n<gainScale=DB>\r\n, Config2FilterDisplay=<FreqAxisUpper=150>\r\n<FreqAxisLower=0>\r\n<GainAxisUpper=0>\r\n<GainAxisLower=-140>\r\n<Display=16829571>\r\n, Config3=<?xml version="1.0" encoding="utf-16"?><CyConfigModel xmlns:Version="3_10"><SampleRateEditor>true</SampleRateEditor><SampleRate>100000</SampleRate><FreeRunning>true</FreeRunning><UseSoc>false</UseSoc><VrefBypass>true</VrefBypass><VrefSource>VREFSOURCE_VBGR</VrefSource><VrefVoltage>1.2</VrefVoltage><VnegSource>VNEGSOURCE_VREFSHORT</VnegSource><DiffResultFormat>SIGNED_FORMAT</DiffResultFormat><SingleEndedResultFormat>UNSIGNED_FORMAT</SingleEndedResultFormat><SamplesAveraged>TWO_SAMPLES</SamplesAveraged><AveragingMode>SEQUENTIAL_AVG</AveragingMode><AlternateResolution>EIGHT_BIT</AlternateResolution><CompareMode>LESS_THAN</CompareMode><LowLimit>512</LowLimit><HighLimit>3584</HighLimit><NumChannels>2</NumChannels><ChannelList><CyChannelModel><Enabled>true</Enabled><UseAltResolution>false</UseAltResolution><InputMode>DIFFERENTIAL_CHAN</InputMode><UseAveraging>false</UseAveraging><MinimumAcqTime>194</MinimumAcqTime><UseLimitInterrupt>false</UseLimitInterrupt><ActualAcqTime>7375</ActualAcqTime><UseSaturationInterrupt>false</UseSaturationInterrupt><ApertureTimer>0</ApertureTimer></CyChannelModel><CyChannelModel><Enabled>true</Enabled><UseAltResolution>false</UseAltResolution><InputMode>DIFFERENTIAL_CHAN</InputMode><UseAveraging>false</UseAveraging><MinimumAcqTime>194</MinimumAcqTime><UseLimitInterrupt>false</UseLimitInterrupt><ActualAcqTime>208</ActualAcqTime><UseSaturationInterrupt>false</UseSaturationInterrupt><ApertureTimer>1</ApertureTimer></CyChannelModel></ChannelList><ApertureTimers><int>89</int><int>3</int><int>2</int><int>2</int></ApertureTimers><AdcClockDivider>2</AdcClockDivider><FilterUabStartDelay>0</FilterUabStartDelay><ActualSampleRate>100000</ActualSampleRate><ActualAdcClockHz>12000000</ActualAdcClockHz><ActualScanUs>10</ActualScanUs></CyConfigModel>, Config3Filter=<pass_type=LOW_PASS>\r\n<shape=BUTTERWORTH>\r\n<primary_freq=10>\r\n<secondary_freq=-1>\r\n<notchEnabled=False>\r\n<modBitEnabled=False>\r\n<sampleRate=1000>\r\n<uabClockDivider=0>\r\n<sampleRateSource=AUTO>\r\n<filterGain_dB=0>\r\n<filterGain_Linear=1>\r\n<gainScale=DB>\r\n, Config3FilterDisplay=<FreqAxisUpper=150>\r\n<FreqAxisLower=0>\r\n<GainAxisUpper=0>\r\n<GainAxisLower=-140>\r\n<Display=16829571>\r\n, Debug=false, DeviceSeriesName=PSoC 4100PS, ExternalClk=false, ExternalSoc=false, ExtVrefMuxSelect=0, FilterConfigMuxSelect_0=1, FilterConfigMuxSelect_1=1, FilterConfigMuxSelect_2=2, FilterConfigMuxSelect_3=3, FilterVinMuxSelect_1_0=0, FilterVinMuxSelect_2_0=0, FilterVinMuxSelect_2_1=0, FilterVinMuxSelect_3_0=0, FilterVinMuxSelect_3_1=0, FilterVinMuxSelect_3_2=0, IsEdgeTrigger=0, IsFilterPresent=false, NumConfigs=1, SarmuxDiffMask=0, SarmuxVinDiffWidth=1, SarmuxVinNegWidth=1, SarmuxVinPlusMuxSelect_0=0, SarmuxVinPlusMuxSelect_1=0, SarmuxVinPlusMuxSelect_10=0, SarmuxVinPlusMuxSelect_11=0, SarmuxVinPlusMuxSelect_12=0, SarmuxVinPlusMuxSelect_13=0, SarmuxVinPlusMuxSelect_14=0, SarmuxVinPlusMuxSelect_15=0, SarmuxVinPlusMuxSelect_16=0, SarmuxVinPlusMuxSelect_17=0, SarmuxVinPlusMuxSelect_18=0, SarmuxVinPlusMuxSelect_19=0, SarmuxVinPlusMuxSelect_2=0, SarmuxVinPlusMuxSelect_20=0, SarmuxVinPlusMuxSelect_21=0, SarmuxVinPlusMuxSelect_22=0, SarmuxVinPlusMuxSelect_23=0, SarmuxVinPlusMuxSelect_24=0, SarmuxVinPlusMuxSelect_25=0, SarmuxVinPlusMuxSelect_26=0, SarmuxVinPlusMuxSelect_27=0, SarmuxVinPlusMuxSelect_28=0, SarmuxVinPlusMuxSelect_29=0, SarmuxVinPlusMuxSelect_3=0, SarmuxVinPlusMuxSelect_30=0, SarmuxVinPlusMuxSelect_31=0, SarmuxVinPlusMuxSelect_32=0, SarmuxVinPlusMuxSelect_33=0, SarmuxVinPlusMuxSelect_34=0, SarmuxVinPlusMuxSelect_35=0, SarmuxVinPlusMuxSelect_36=0, SarmuxVinPlusMuxSelect_37=0, SarmuxVinPlusMuxSelect_38=0, SarmuxVinPlusMuxSelect_39=0, SarmuxVinPlusMuxSelect_4=0, SarmuxVinPlusMuxSelect_40=0, SarmuxVinPlusMuxSelect_41=0, SarmuxVinPlusMuxSelect_42=0, SarmuxVinPlusMuxSelect_43=0, SarmuxVinPlusMuxSelect_44=0, SarmuxVinPlusMuxSelect_45=0, SarmuxVinPlusMuxSelect_46=0, SarmuxVinPlusMuxSelect_47=0, SarmuxVinPlusMuxSelect_48=0, SarmuxVinPlusMuxSelect_49=0, SarmuxVinPlusMuxSelect_5=0, SarmuxVinPlusMuxSelect_50=0, SarmuxVinPlusMuxSelect_51=0, SarmuxVinPlusMuxSelect_52=0, SarmuxVinPlusMuxSelect_53=0, SarmuxVinPlusMuxSelect_54=0, SarmuxVinPlusMuxSelect_55=0, SarmuxVinPlusMuxSelect_56=0, SarmuxVinPlusMuxSelect_57=0, SarmuxVinPlusMuxSelect_58=0, SarmuxVinPlusMuxSelect_59=0, SarmuxVinPlusMuxSelect_6=0, SarmuxVinPlusMuxSelect_60=0, SarmuxVinPlusMuxSelect_61=0, SarmuxVinPlusMuxSelect_62=0, SarmuxVinPlusMuxSelect_63=0, SarmuxVinPlusMuxSelect_7=0, SarmuxVinPlusMuxSelect_8=0, SarmuxVinPlusMuxSelect_9=0, SocMuxSelect=1, Test_ConfigSpacing=15, Test_ExposeTestTerminals=false, VinMinusMuxSelect_0=1, VinMinusMuxSelect_1=1, VinMinusMuxSelect_10=1, VinMinusMuxSelect_11=1, VinMinusMuxSelect_12=1, VinMinusMuxSelect_13=1, VinMinusMuxSelect_14=1, VinMinusMuxSelect_15=1, VinMinusMuxSelect_16=1, VinMinusMuxSelect_17=1, VinMinusMuxSelect_18=1, VinMinusMuxSelect_19=1, VinMinusMuxSelect_2=1, VinMinusMuxSelect_20=1, VinMinusMuxSelect_21=1, VinMinusMuxSelect_22=1, VinMinusMuxSelect_23=1, VinMinusMuxSelect_24=1, VinMinusMuxSelect_25=1, VinMinusMuxSelect_26=1, VinMinusMuxSelect_27=1, VinMinusMuxSelect_28=1, VinMinusMuxSelect_29=1, VinMinusMuxSelect_3=1, VinMinusMuxSelect_30=1, VinMinusMuxSelect_31=1, VinMinusMuxSelect_32=1, VinMinusMuxSelect_33=1, VinMinusMuxSelect_34=1, VinMinusMuxSelect_35=1, VinMinusMuxSelect_36=1, VinMinusMuxSelect_37=1, VinMinusMuxSelect_38=1, VinMinusMuxSelect_39=1, VinMinusMuxSelect_4=1, VinMinusMuxSelect_40=1, VinMinusMuxSelect_41=1, VinMinusMuxSelect_42=1, VinMinusMuxSelect_43=1, VinMinusMuxSelect_44=1, VinMinusMuxSelect_45=1, VinMinusMuxSelect_46=1, VinMinusMuxSelect_47=1, VinMinusMuxSelect_48=1, VinMinusMuxSelect_49=1, VinMinusMuxSelect_5=1, VinMinusMuxSelect_50=1, VinMinusMuxSelect_51=1, VinMinusMuxSelect_52=1, VinMinusMuxSelect_53=1, VinMinusMuxSelect_54=1, VinMinusMuxSelect_55=1, VinMinusMuxSelect_56=1, VinMinusMuxSelect_57=1, VinMinusMuxSelect_58=1, VinMinusMuxSelect_59=1, VinMinusMuxSelect_6=1, VinMinusMuxSelect_60=1, VinMinusMuxSelect_61=1, VinMinusMuxSelect_62=1, VinMinusMuxSelect_63=1, VinMinusMuxSelect_7=1, VinMinusMuxSelect_8=1, VinMinusMuxSelect_9=1, VinNegMuxSelect_0=1, VinNegMuxSelect_1=1, VinNegMuxSelect_2=1, VinNegMuxSelect_3=1, VinPlusMuxSelect_0=0, VinPlusMuxSelect_1=1, VinPlusMuxSelect_10=1, VinPlusMuxSelect_11=1, VinPlusMuxSelect_12=1, VinPlusMuxSelect_13=1, VinPlusMuxSelect_14=1, VinPlusMuxSelect_15=1, VinPlusMuxSelect_16=1, VinPlusMuxSelect_17=1, VinPlusMuxSelect_18=1, VinPlusMuxSelect_19=1, VinPlusMuxSelect_2=1, VinPlusMuxSelect_20=1, VinPlusMuxSelect_21=1, VinPlusMuxSelect_22=1, VinPlusMuxSelect_23=1, VinPlusMuxSelect_24=1, VinPlusMuxSelect_25=1, VinPlusMuxSelect_26=1, VinPlusMuxSelect_27=1, VinPlusMuxSelect_28=1, VinPlusMuxSelect_29=1, VinPlusMuxSelect_3=1, VinPlusMuxSelect_30=1, VinPlusMuxSelect_31=1, VinPlusMuxSelect_32=1, VinPlusMuxSelect_33=1, VinPlusMuxSelect_34=1, VinPlusMuxSelect_35=1, VinPlusMuxSelect_36=1, VinPlusMuxSelect_37=1, VinPlusMuxSelect_38=1, VinPlusMuxSelect_39=1, VinPlusMuxSelect_4=1, VinPlusMuxSelect_40=1, VinPlusMuxSelect_41=1, VinPlusMuxSelect_42=1, VinPlusMuxSelect_43=1, VinPlusMuxSelect_44=1, VinPlusMuxSelect_45=1, VinPlusMuxSelect_46=1, VinPlusMuxSelect_47=1, VinPlusMuxSelect_48=1, VinPlusMuxSelect_49=1, VinPlusMuxSelect_5=1, VinPlusMuxSelect_50=1, VinPlusMuxSelect_51=1, VinPlusMuxSelect_52=1, VinPlusMuxSelect_53=1, VinPlusMuxSelect_54=1, VinPlusMuxSelect_55=1, VinPlusMuxSelect_56=1, VinPlusMuxSelect_57=1, VinPlusMuxSelect_58=1, VinPlusMuxSelect_59=1, VinPlusMuxSelect_6=1, VinPlusMuxSelect_60=1, VinPlusMuxSelect_61=1, VinPlusMuxSelect_62=1, VinPlusMuxSelect_63=1, VinPlusMuxSelect_7=1, VinPlusMuxSelect_8=1, VinPlusMuxSelect_9=1, VminusMuxSelect=2, VplusMuxSelect=1, VrefMuxSelect_0=1, VrefMuxSelect_1=1, VrefMuxSelect_2=1, VrefMuxSelect_3=1, CY_API_CALLBACK_HEADER_INCLUDE=#include "cyapicallbacks.h", CY_COMMENT=, CY_COMPONENT_NAME=Scan_ADC_v3_10, CY_CONFIG_TITLE=ADC_Temp, CY_CONST_CONFIG=true, CY_CONTROL_FILE=<:default:>, CY_DATASHEET_FILE=Scan_ADC_v3_10.pdf, CY_FITTER_NAME=ADC_Temp, CY_INSTANCE_SHORT_NAME=ADC_Temp, CY_MAJOR_VERSION=3, CY_MINOR_VERSION=10, CY_PDL_DRIVER_NAME=sar, CY_PDL_DRIVER_REQ_VERSION=1.20, CY_PDL_DRIVER_SUBGROUP=, CY_PDL_DRIVER_VARIANT=, CY_REMOVE=false, CY_SUPPRESS_API_GEN=false, CY_VERSION=PSoC Creator  4.3, INSTANCE_NAME=ADC_Temp, )
module Scan_ADC_v3_10_2 (
    sdone,
    eos,
    t_chidv,
    t_chid,
    t_dav,
    t_da,
    t_fvout,
    t_fvalid,
    t_fvinternal,
    vagnd,
    vinPlus_0);
    output      sdone;
    output      eos;
    output      t_chidv;
    output     [3:0] t_chid;
    output      t_dav;
    output     [11:0] t_da;
    inout       t_fvout;
    electrical  t_fvout;
    output      t_fvalid;
    inout      [1:0] t_fvinternal;
    electrical [1:0] t_fvinternal;
    inout       vagnd;
    electrical  vagnd;
    inout       vinPlus_0;
    electrical  vinPlus_0;


    electrical  sarmuxOutMinus;
    electrical  muxoutPlus;
    electrical  sarmuxOutPlus;
    electrical  muxoutMinus;
    electrical  Net_1541;
          wire  Net_1370;
    electrical  Net_1023;
    electrical  Net_1144;
    electrical  Net_1137;
    electrical  Net_1149;
          wire  Net_993;
          wire  Net_1361;
          wire  Net_991;
    electrical [63:0] sarmuxVinPlus;
    electrical [63:0] vinPlus;
    electrical  filterVout;
          wire  Net_1360;
          wire  Net_1359;
          wire  Net_987;
          wire  sarClock;
          wire  Net_986;
          wire  Net_1358;
    electrical  Net_983;
    electrical  Net_1530;
    electrical  Net_1529;
    electrical  Net_1528;
          wire  Net_1009;
          wire  Net_1366;
          wire  Net_1007;
          wire  Net_1365;
    electrical  filterVagnd;
          wire  Net_1003;
          wire  Net_1002;
          wire  Net_1363;
    electrical  Net_1475;
    electrical [63:0] vinMinus;
    electrical [3:0] filterVin;
    electrical  Net_1506;
    electrical  Net_1507;
    electrical [3:0] vinNeg;
          wire [1:0] st_sel;
    electrical  vref;
    electrical [3:0] vrefBus;
    electrical  Net_1504;
          wire  Net_448;
          wire  Net_446;
          wire  Net_449;
    electrical  Net_440;
    electrical  Net_439;
          wire  Net_431;
          wire  Net_416;
          wire  Net_414;
          wire  Net_413;
          wire  Net_412;
          wire  Net_410;
    electrical [0:0] Net_1523;
    electrical  Net_1447;
    electrical  Net_1448;
    electrical [0:0] Net_1340;
    electrical  Net_1399;
    electrical  Net_1402;
    electrical  Net_1406;
    electrical  Net_1405;
    electrical  Net_349;
    electrical  Net_347;
    electrical  Net_345;
    electrical  Net_331;
    electrical  Net_458;
    electrical  Net_1385;
    electrical  Net_459;
    electrical  Net_1388;
    electrical  Net_1382;
    electrical  Net_457;
    electrical  Net_1379;
    electrical  Net_456;
    electrical  Net_1147;
    electrical  Net_1146;
    electrical  Net_1142;
    electrical  Net_1136;
    electrical  Net_1143;
    electrical  Net_1148;
          wire  Net_423;
          wire  Net_428;
    electrical  Net_441;
          wire  Net_415;
    electrical  Net_408;
    electrical [0:0] Net_365;
    electrical [0:0] Net_340;
    electrical [0:0] Net_339;
    electrical  Net_316;
    electrical  Net_315;
    electrical  Net_314;
    electrical  Net_313;
    electrical  Net_312;
    electrical  Net_311;
    electrical  Net_310;
    electrical  Net_309;
    electrical  Net_308;
    electrical  Net_307;
    electrical  Net_306;
    electrical  Net_305;
    electrical  Net_304;
    electrical  Net_303;
    electrical  Net_302;
    electrical  Net_301;
    electrical  Net_300;
    electrical  Net_299;
    electrical  Net_298;
    electrical  Net_297;
    electrical  Net_296;
    electrical  Net_295;
    electrical  Net_294;
    electrical  Net_293;
    electrical  Net_292;
    electrical  Net_291;
    electrical  Net_290;
    electrical  Net_289;
    electrical  Net_288;
    electrical  Net_287;
    electrical  Net_286;
    electrical  Net_285;
    electrical  Net_278;
    electrical  Net_276;
    electrical  Net_274;
    electrical  Net_272;
    electrical  Net_270;
    electrical  Net_268;
    electrical  Net_266;
    electrical  Net_264;
    electrical  Net_262;
    electrical  Net_260;
    electrical  Net_258;
    electrical  Net_256;
    electrical  Net_254;
    electrical  Net_252;
    electrical  Net_250;
    electrical  Net_248;
    electrical  Net_246;
    electrical  Net_244;
    electrical  Net_242;
    electrical  Net_240;
    electrical  Net_238;
    electrical  Net_236;
    electrical  Net_234;
    electrical  Net_232;
    electrical  Net_230;
    electrical  Net_228;
    electrical  Net_226;
    electrical  Net_224;
    electrical  Net_222;
    electrical  Net_220;
    electrical  Net_218;
    electrical  Net_213;
    electrical  Net_211;
    electrical  Net_210;
    electrical  Net_209;
    electrical  Net_208;
    electrical  Net_207;
    electrical  Net_206;
    electrical  Net_205;
    electrical  Net_204;
    electrical  Net_203;
    electrical  Net_202;
    electrical  Net_201;
    electrical  Net_200;
    electrical  Net_199;
    electrical  Net_198;
    electrical  Net_197;
    electrical  Net_196;
    electrical  Net_195;
    electrical  Net_194;
    electrical  Net_193;
    electrical  Net_192;
    electrical  Net_191;
    electrical  Net_190;
    electrical  Net_189;
    electrical  Net_188;
          wire  uabClock;
    electrical [63:0] sarmuxVinMinus;
    electrical  Net_187;
    electrical  Net_186;
    electrical  Net_185;
    electrical  Net_184;
    electrical  Net_183;
    electrical  Net_182;
    electrical  Net_181;
    electrical  Net_180;
    electrical  Net_172;
    electrical  Net_170;
    electrical  Net_168;
    electrical  Net_166;
    electrical  Net_164;
    electrical  Net_162;
    electrical  Net_160;
    electrical  Net_158;
    electrical  Net_156;
    electrical  Net_154;
    electrical  Net_152;
    electrical  Net_150;
    electrical  Net_148;
    electrical  Net_146;
    electrical  Net_144;
    electrical  Net_142;
    electrical  Net_107;
    electrical  Net_139;
    electrical  Net_137;
    electrical  Net_135;
    electrical  Net_133;
    electrical  Net_131;
    electrical  Net_129;
    electrical  Net_127;
    electrical  Net_125;
    electrical  Net_123;
    electrical  Net_121;
    electrical  Net_119;
    electrical  Net_117;
    electrical  Net_115;
    electrical  cpl;
    electrical  Net_113;
    electrical  Net_110;

	// vinPlusMux_0 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinPlusMux_0_connect(vinPlus[0], vinPlus_0);
	defparam vinPlusMux_0_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_133 (
        .noconnect(Net_107));

	// vinPlusMux_1 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinPlusMux_1_connect(vinPlus[1], Net_110);
	defparam vinPlusMux_1_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_134 (
        .noconnect(Net_110));

	// vinPlusMux_2 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinPlusMux_2_connect(vinPlus[2], Net_113);
	defparam vinPlusMux_2_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_135 (
        .noconnect(Net_113));

	// vinPlusMux_3 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinPlusMux_3_connect(vinPlus[3], Net_115);
	defparam vinPlusMux_3_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_136 (
        .noconnect(Net_115));

	// vinPlusMux_4 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinPlusMux_4_connect(vinPlus[4], Net_117);
	defparam vinPlusMux_4_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_137 (
        .noconnect(Net_117));

	// vinPlusMux_5 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinPlusMux_5_connect(vinPlus[5], Net_119);
	defparam vinPlusMux_5_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_138 (
        .noconnect(Net_119));

	// vinPlusMux_6 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinPlusMux_6_connect(vinPlus[6], Net_121);
	defparam vinPlusMux_6_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_139 (
        .noconnect(Net_121));

	// vinPlusMux_7 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinPlusMux_7_connect(vinPlus[7], Net_123);
	defparam vinPlusMux_7_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_140 (
        .noconnect(Net_123));

	// vinPlusMux_8 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinPlusMux_8_connect(vinPlus[8], Net_125);
	defparam vinPlusMux_8_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_141 (
        .noconnect(Net_125));

	// vinPlusMux_9 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinPlusMux_9_connect(vinPlus[9], Net_127);
	defparam vinPlusMux_9_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_142 (
        .noconnect(Net_127));

	// vinPlusMux_10 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinPlusMux_10_connect(vinPlus[10], Net_129);
	defparam vinPlusMux_10_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_143 (
        .noconnect(Net_129));

	// vinPlusMux_11 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinPlusMux_11_connect(vinPlus[11], Net_131);
	defparam vinPlusMux_11_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_144 (
        .noconnect(Net_131));

	// vinPlusMux_12 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinPlusMux_12_connect(vinPlus[12], Net_133);
	defparam vinPlusMux_12_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_145 (
        .noconnect(Net_133));

	// vinPlusMux_13 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinPlusMux_13_connect(vinPlus[13], Net_135);
	defparam vinPlusMux_13_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_146 (
        .noconnect(Net_135));

	// vinPlusMux_14 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinPlusMux_14_connect(vinPlus[14], Net_137);
	defparam vinPlusMux_14_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_147 (
        .noconnect(Net_137));

	// vinPlusMux_15 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinPlusMux_15_connect(vinPlus[15], Net_139);
	defparam vinPlusMux_15_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_148 (
        .noconnect(Net_139));

	// vinPlusMux_16 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinPlusMux_16_connect(vinPlus[16], Net_142);
	defparam vinPlusMux_16_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_149 (
        .noconnect(Net_142));

	// vinPlusMux_17 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinPlusMux_17_connect(vinPlus[17], Net_144);
	defparam vinPlusMux_17_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_150 (
        .noconnect(Net_144));

	// vinPlusMux_18 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinPlusMux_18_connect(vinPlus[18], Net_146);
	defparam vinPlusMux_18_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_151 (
        .noconnect(Net_146));

	// vinPlusMux_19 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinPlusMux_19_connect(vinPlus[19], Net_148);
	defparam vinPlusMux_19_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_152 (
        .noconnect(Net_148));

	// vinPlusMux_20 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinPlusMux_20_connect(vinPlus[20], Net_150);
	defparam vinPlusMux_20_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_153 (
        .noconnect(Net_150));

	// vinPlusMux_21 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinPlusMux_21_connect(vinPlus[21], Net_152);
	defparam vinPlusMux_21_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_154 (
        .noconnect(Net_152));

	// vinPlusMux_22 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinPlusMux_22_connect(vinPlus[22], Net_154);
	defparam vinPlusMux_22_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_155 (
        .noconnect(Net_154));

	// vinPlusMux_23 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinPlusMux_23_connect(vinPlus[23], Net_156);
	defparam vinPlusMux_23_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_156 (
        .noconnect(Net_156));

	// vinPlusMux_24 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinPlusMux_24_connect(vinPlus[24], Net_158);
	defparam vinPlusMux_24_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_157 (
        .noconnect(Net_158));

	// vinPlusMux_25 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinPlusMux_25_connect(vinPlus[25], Net_160);
	defparam vinPlusMux_25_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_158 (
        .noconnect(Net_160));

	// vinPlusMux_26 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinPlusMux_26_connect(vinPlus[26], Net_162);
	defparam vinPlusMux_26_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_159 (
        .noconnect(Net_162));

	// vinPlusMux_27 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinPlusMux_27_connect(vinPlus[27], Net_164);
	defparam vinPlusMux_27_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_160 (
        .noconnect(Net_164));

	// vinPlusMux_28 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinPlusMux_28_connect(vinPlus[28], Net_166);
	defparam vinPlusMux_28_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_161 (
        .noconnect(Net_166));

	// vinPlusMux_29 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinPlusMux_29_connect(vinPlus[29], Net_168);
	defparam vinPlusMux_29_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_162 (
        .noconnect(Net_168));

	// vinPlusMux_30 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinPlusMux_30_connect(vinPlus[30], Net_170);
	defparam vinPlusMux_30_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_163 (
        .noconnect(Net_170));

	// vinPlusMux_31 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinPlusMux_31_connect(vinPlus[31], Net_172);
	defparam vinPlusMux_31_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_164 (
        .noconnect(Net_172));

	// vinPlusMux_32 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinPlusMux_32_connect(vinPlus[32], Net_180);
	defparam vinPlusMux_32_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_165 (
        .noconnect(Net_180));

	// vinPlusMux_33 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinPlusMux_33_connect(vinPlus[33], Net_181);
	defparam vinPlusMux_33_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_166 (
        .noconnect(Net_181));

	// vinPlusMux_34 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinPlusMux_34_connect(vinPlus[34], Net_182);
	defparam vinPlusMux_34_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_167 (
        .noconnect(Net_182));

	// vinPlusMux_35 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinPlusMux_35_connect(vinPlus[35], Net_183);
	defparam vinPlusMux_35_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_168 (
        .noconnect(Net_183));

	// vinPlusMux_36 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinPlusMux_36_connect(vinPlus[36], Net_184);
	defparam vinPlusMux_36_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_169 (
        .noconnect(Net_184));

	// vinPlusMux_37 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinPlusMux_37_connect(vinPlus[37], Net_185);
	defparam vinPlusMux_37_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_170 (
        .noconnect(Net_185));

	// vinPlusMux_38 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinPlusMux_38_connect(vinPlus[38], Net_186);
	defparam vinPlusMux_38_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_171 (
        .noconnect(Net_186));

	// vinPlusMux_39 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinPlusMux_39_connect(vinPlus[39], Net_187);
	defparam vinPlusMux_39_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_172 (
        .noconnect(Net_187));

	// vinPlusMux_40 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinPlusMux_40_connect(vinPlus[40], Net_188);
	defparam vinPlusMux_40_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_173 (
        .noconnect(Net_188));

	// vinPlusMux_41 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinPlusMux_41_connect(vinPlus[41], Net_189);
	defparam vinPlusMux_41_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_174 (
        .noconnect(Net_189));

	// vinPlusMux_42 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinPlusMux_42_connect(vinPlus[42], Net_190);
	defparam vinPlusMux_42_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_175 (
        .noconnect(Net_190));

	// vinPlusMux_43 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinPlusMux_43_connect(vinPlus[43], Net_191);
	defparam vinPlusMux_43_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_176 (
        .noconnect(Net_191));

	// vinPlusMux_44 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinPlusMux_44_connect(vinPlus[44], Net_192);
	defparam vinPlusMux_44_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_177 (
        .noconnect(Net_192));

	// vinPlusMux_45 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinPlusMux_45_connect(vinPlus[45], Net_193);
	defparam vinPlusMux_45_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_178 (
        .noconnect(Net_193));

	// vinPlusMux_46 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinPlusMux_46_connect(vinPlus[46], Net_194);
	defparam vinPlusMux_46_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_179 (
        .noconnect(Net_194));

	// vinPlusMux_47 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinPlusMux_47_connect(vinPlus[47], Net_195);
	defparam vinPlusMux_47_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_180 (
        .noconnect(Net_195));

	// vinPlusMux_48 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinPlusMux_48_connect(vinPlus[48], Net_196);
	defparam vinPlusMux_48_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_181 (
        .noconnect(Net_196));

	// vinPlusMux_49 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinPlusMux_49_connect(vinPlus[49], Net_197);
	defparam vinPlusMux_49_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_182 (
        .noconnect(Net_197));

	// vinPlusMux_50 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinPlusMux_50_connect(vinPlus[50], Net_198);
	defparam vinPlusMux_50_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_183 (
        .noconnect(Net_198));

	// vinPlusMux_51 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinPlusMux_51_connect(vinPlus[51], Net_199);
	defparam vinPlusMux_51_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_184 (
        .noconnect(Net_199));

	// vinPlusMux_52 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinPlusMux_52_connect(vinPlus[52], Net_200);
	defparam vinPlusMux_52_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_185 (
        .noconnect(Net_200));

	// vinPlusMux_53 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinPlusMux_53_connect(vinPlus[53], Net_201);
	defparam vinPlusMux_53_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_186 (
        .noconnect(Net_201));

	// vinPlusMux_54 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinPlusMux_54_connect(vinPlus[54], Net_202);
	defparam vinPlusMux_54_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_187 (
        .noconnect(Net_202));

	// vinPlusMux_55 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinPlusMux_55_connect(vinPlus[55], Net_203);
	defparam vinPlusMux_55_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_188 (
        .noconnect(Net_203));

	// vinPlusMux_56 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinPlusMux_56_connect(vinPlus[56], Net_204);
	defparam vinPlusMux_56_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_189 (
        .noconnect(Net_204));

	// vinPlusMux_57 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinPlusMux_57_connect(vinPlus[57], Net_205);
	defparam vinPlusMux_57_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_190 (
        .noconnect(Net_205));

	// vinPlusMux_58 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinPlusMux_58_connect(vinPlus[58], Net_206);
	defparam vinPlusMux_58_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_191 (
        .noconnect(Net_206));

	// vinPlusMux_59 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinPlusMux_59_connect(vinPlus[59], Net_207);
	defparam vinPlusMux_59_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_192 (
        .noconnect(Net_207));

	// vinPlusMux_60 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinPlusMux_60_connect(vinPlus[60], Net_208);
	defparam vinPlusMux_60_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_193 (
        .noconnect(Net_208));

	// vinPlusMux_61 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinPlusMux_61_connect(vinPlus[61], Net_209);
	defparam vinPlusMux_61_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_194 (
        .noconnect(Net_209));

	// vinPlusMux_62 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinPlusMux_62_connect(vinPlus[62], Net_210);
	defparam vinPlusMux_62_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_195 (
        .noconnect(Net_210));

	// vinPlusMux_63 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinPlusMux_63_connect(vinPlus[63], Net_211);
	defparam vinPlusMux_63_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_196 (
        .noconnect(Net_211));

	// vinMinusMux_0 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinMinusMux_0_connect(vinMinus[0], Net_213);
	defparam vinMinusMux_0_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_1 (
        .noconnect(Net_213));

	// vinMinusMux_1 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinMinusMux_1_connect(vinMinus[1], Net_218);
	defparam vinMinusMux_1_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_2 (
        .noconnect(Net_218));

	// vinMinusMux_2 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinMinusMux_2_connect(vinMinus[2], Net_220);
	defparam vinMinusMux_2_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_3 (
        .noconnect(Net_220));

	// vinMinusMux_3 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinMinusMux_3_connect(vinMinus[3], Net_222);
	defparam vinMinusMux_3_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_4 (
        .noconnect(Net_222));

	// vinMinusMux_4 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinMinusMux_4_connect(vinMinus[4], Net_224);
	defparam vinMinusMux_4_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_5 (
        .noconnect(Net_224));

	// vinMinusMux_5 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinMinusMux_5_connect(vinMinus[5], Net_226);
	defparam vinMinusMux_5_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_6 (
        .noconnect(Net_226));

	// vinMinusMux_6 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinMinusMux_6_connect(vinMinus[6], Net_228);
	defparam vinMinusMux_6_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_7 (
        .noconnect(Net_228));

	// vinMinusMux_7 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinMinusMux_7_connect(vinMinus[7], Net_230);
	defparam vinMinusMux_7_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_8 (
        .noconnect(Net_230));

	// vinMinusMux_8 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinMinusMux_8_connect(vinMinus[8], Net_232);
	defparam vinMinusMux_8_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_9 (
        .noconnect(Net_232));

	// vinMinusMux_9 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinMinusMux_9_connect(vinMinus[9], Net_234);
	defparam vinMinusMux_9_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_10 (
        .noconnect(Net_234));

	// vinMinusMux_10 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinMinusMux_10_connect(vinMinus[10], Net_236);
	defparam vinMinusMux_10_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_11 (
        .noconnect(Net_236));

	// vinMinusMux_11 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinMinusMux_11_connect(vinMinus[11], Net_238);
	defparam vinMinusMux_11_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_12 (
        .noconnect(Net_238));

	// vinMinusMux_12 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinMinusMux_12_connect(vinMinus[12], Net_240);
	defparam vinMinusMux_12_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_13 (
        .noconnect(Net_240));

	// vinMinusMux_13 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinMinusMux_13_connect(vinMinus[13], Net_242);
	defparam vinMinusMux_13_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_14 (
        .noconnect(Net_242));

	// vinMinusMux_14 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinMinusMux_14_connect(vinMinus[14], Net_244);
	defparam vinMinusMux_14_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_15 (
        .noconnect(Net_244));

	// vinMinusMux_15 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinMinusMux_15_connect(vinMinus[15], Net_246);
	defparam vinMinusMux_15_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_16 (
        .noconnect(Net_246));

	// vinMinusMux_16 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinMinusMux_16_connect(vinMinus[16], Net_248);
	defparam vinMinusMux_16_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_17 (
        .noconnect(Net_248));

	// vinMinusMux_17 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinMinusMux_17_connect(vinMinus[17], Net_250);
	defparam vinMinusMux_17_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_18 (
        .noconnect(Net_250));

	// vinMinusMux_18 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinMinusMux_18_connect(vinMinus[18], Net_252);
	defparam vinMinusMux_18_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_19 (
        .noconnect(Net_252));

	// vinMinusMux_19 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinMinusMux_19_connect(vinMinus[19], Net_254);
	defparam vinMinusMux_19_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_20 (
        .noconnect(Net_254));

	// vinMinusMux_20 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinMinusMux_20_connect(vinMinus[20], Net_256);
	defparam vinMinusMux_20_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_21 (
        .noconnect(Net_256));

	// vinMinusMux_21 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinMinusMux_21_connect(vinMinus[21], Net_258);
	defparam vinMinusMux_21_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_22 (
        .noconnect(Net_258));

	// vinMinusMux_22 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinMinusMux_22_connect(vinMinus[22], Net_260);
	defparam vinMinusMux_22_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_23 (
        .noconnect(Net_260));

	// vinMinusMux_23 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinMinusMux_23_connect(vinMinus[23], Net_262);
	defparam vinMinusMux_23_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_24 (
        .noconnect(Net_262));

	// vinMinusMux_24 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinMinusMux_24_connect(vinMinus[24], Net_264);
	defparam vinMinusMux_24_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_25 (
        .noconnect(Net_264));

	// vinMinusMux_25 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinMinusMux_25_connect(vinMinus[25], Net_266);
	defparam vinMinusMux_25_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_26 (
        .noconnect(Net_266));

	// vinMinusMux_26 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinMinusMux_26_connect(vinMinus[26], Net_268);
	defparam vinMinusMux_26_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_27 (
        .noconnect(Net_268));

	// vinMinusMux_27 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinMinusMux_27_connect(vinMinus[27], Net_270);
	defparam vinMinusMux_27_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_28 (
        .noconnect(Net_270));

	// vinMinusMux_28 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinMinusMux_28_connect(vinMinus[28], Net_272);
	defparam vinMinusMux_28_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_29 (
        .noconnect(Net_272));

	// vinMinusMux_29 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinMinusMux_29_connect(vinMinus[29], Net_274);
	defparam vinMinusMux_29_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_30 (
        .noconnect(Net_274));

	// vinMinusMux_30 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinMinusMux_30_connect(vinMinus[30], Net_276);
	defparam vinMinusMux_30_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_31 (
        .noconnect(Net_276));

	// vinMinusMux_31 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinMinusMux_31_connect(vinMinus[31], Net_278);
	defparam vinMinusMux_31_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_32 (
        .noconnect(Net_278));

	// vinMinusMux_32 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinMinusMux_32_connect(vinMinus[32], Net_285);
	defparam vinMinusMux_32_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_33 (
        .noconnect(Net_285));

	// vinMinusMux_33 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinMinusMux_33_connect(vinMinus[33], Net_286);
	defparam vinMinusMux_33_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_34 (
        .noconnect(Net_286));

	// vinMinusMux_34 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinMinusMux_34_connect(vinMinus[34], Net_287);
	defparam vinMinusMux_34_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_35 (
        .noconnect(Net_287));

	// vinMinusMux_35 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinMinusMux_35_connect(vinMinus[35], Net_288);
	defparam vinMinusMux_35_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_36 (
        .noconnect(Net_288));

	// vinMinusMux_36 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinMinusMux_36_connect(vinMinus[36], Net_289);
	defparam vinMinusMux_36_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_37 (
        .noconnect(Net_289));

	// vinMinusMux_37 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinMinusMux_37_connect(vinMinus[37], Net_290);
	defparam vinMinusMux_37_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_38 (
        .noconnect(Net_290));

	// vinMinusMux_38 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinMinusMux_38_connect(vinMinus[38], Net_291);
	defparam vinMinusMux_38_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_39 (
        .noconnect(Net_291));

	// vinMinusMux_39 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinMinusMux_39_connect(vinMinus[39], Net_292);
	defparam vinMinusMux_39_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_40 (
        .noconnect(Net_292));

	// vinMinusMux_40 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinMinusMux_40_connect(vinMinus[40], Net_293);
	defparam vinMinusMux_40_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_41 (
        .noconnect(Net_293));

	// vinMinusMux_41 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinMinusMux_41_connect(vinMinus[41], Net_294);
	defparam vinMinusMux_41_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_42 (
        .noconnect(Net_294));

	// vinMinusMux_42 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinMinusMux_42_connect(vinMinus[42], Net_295);
	defparam vinMinusMux_42_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_43 (
        .noconnect(Net_295));

	// vinMinusMux_43 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinMinusMux_43_connect(vinMinus[43], Net_296);
	defparam vinMinusMux_43_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_44 (
        .noconnect(Net_296));

	// vinMinusMux_44 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinMinusMux_44_connect(vinMinus[44], Net_297);
	defparam vinMinusMux_44_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_45 (
        .noconnect(Net_297));

	// vinMinusMux_45 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinMinusMux_45_connect(vinMinus[45], Net_298);
	defparam vinMinusMux_45_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_46 (
        .noconnect(Net_298));

	// vinMinusMux_46 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinMinusMux_46_connect(vinMinus[46], Net_299);
	defparam vinMinusMux_46_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_47 (
        .noconnect(Net_299));

	// vinMinusMux_47 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinMinusMux_47_connect(vinMinus[47], Net_300);
	defparam vinMinusMux_47_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_48 (
        .noconnect(Net_300));

	// vinMinusMux_48 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinMinusMux_48_connect(vinMinus[48], Net_301);
	defparam vinMinusMux_48_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_49 (
        .noconnect(Net_301));

	// vinMinusMux_49 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinMinusMux_49_connect(vinMinus[49], Net_302);
	defparam vinMinusMux_49_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_50 (
        .noconnect(Net_302));

	// vinMinusMux_50 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinMinusMux_50_connect(vinMinus[50], Net_303);
	defparam vinMinusMux_50_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_51 (
        .noconnect(Net_303));

	// vinMinusMux_51 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinMinusMux_51_connect(vinMinus[51], Net_304);
	defparam vinMinusMux_51_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_52 (
        .noconnect(Net_304));

	// vinMinusMux_52 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinMinusMux_52_connect(vinMinus[52], Net_305);
	defparam vinMinusMux_52_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_53 (
        .noconnect(Net_305));

	// vinMinusMux_53 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinMinusMux_53_connect(vinMinus[53], Net_306);
	defparam vinMinusMux_53_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_54 (
        .noconnect(Net_306));

	// vinMinusMux_54 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinMinusMux_54_connect(vinMinus[54], Net_307);
	defparam vinMinusMux_54_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_55 (
        .noconnect(Net_307));

	// vinMinusMux_55 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinMinusMux_55_connect(vinMinus[55], Net_308);
	defparam vinMinusMux_55_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_56 (
        .noconnect(Net_308));

	// vinMinusMux_56 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinMinusMux_56_connect(vinMinus[56], Net_309);
	defparam vinMinusMux_56_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_57 (
        .noconnect(Net_309));

	// vinMinusMux_57 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinMinusMux_57_connect(vinMinus[57], Net_310);
	defparam vinMinusMux_57_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_58 (
        .noconnect(Net_310));

	// vinMinusMux_58 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinMinusMux_58_connect(vinMinus[58], Net_311);
	defparam vinMinusMux_58_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_59 (
        .noconnect(Net_311));

	// vinMinusMux_59 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinMinusMux_59_connect(vinMinus[59], Net_312);
	defparam vinMinusMux_59_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_60 (
        .noconnect(Net_312));

	// vinMinusMux_60 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinMinusMux_60_connect(vinMinus[60], Net_313);
	defparam vinMinusMux_60_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_61 (
        .noconnect(Net_313));

	// vinMinusMux_61 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinMinusMux_61_connect(vinMinus[61], Net_314);
	defparam vinMinusMux_61_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_62 (
        .noconnect(Net_314));

	// vinMinusMux_62 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinMinusMux_62_connect(vinMinus[62], Net_315);
	defparam vinMinusMux_62_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_63 (
        .noconnect(Net_315));

	// vinMinusMux_63 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinMinusMux_63_connect(vinMinus[63], Net_316);
	defparam vinMinusMux_63_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_64 (
        .noconnect(Net_316));

    Bus_Connect_v2_50 vinMinusConnect (
        .in_bus(sarmuxVinMinus[63:0]),
        .out_bus(Net_340[0:0]));
    defparam vinMinusConnect.in_width = 64;
    defparam vinMinusConnect.out_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_68 (
        .noconnect(Net_349));

	// vinNegMux_3 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinNegMux_3_connect(vinNeg[3], Net_349);
	defparam vinNegMux_3_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_67 (
        .noconnect(Net_347));

	// vinNegMux_2 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinNegMux_2_connect(vinNeg[2], Net_347);
	defparam vinNegMux_2_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_66 (
        .noconnect(Net_345));

	// vinNegMux_1 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinNegMux_1_connect(vinNeg[1], Net_345);
	defparam vinNegMux_1_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_65 (
        .noconnect(Net_331));

	// vinNegMux_0 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vinNegMux_0_connect(vinNeg[0], Net_331);
	defparam vinNegMux_0_connect.sig_width = 1;

    Bus_Connect_v2_50 vinNegConnect (
        .in_bus(vinNeg[3:0]),
        .out_bus(Net_365[0:0]));
    defparam vinNegConnect.in_width = 4;
    defparam vinNegConnect.out_width = 1;

	// vplusMux (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vplusMux_connect(muxoutPlus, sarmuxVinPlus[0]);
	defparam vplusMux_connect.sig_width = 1;

	// vminusMux (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vminusMux_connect(muxoutMinus, vinNeg[0]);
	defparam vminusMux_connect.sig_width = 1;

    cy_psoc4_sar_v1_0 cy_psoc4_sar_1 (
        .vplus(muxoutPlus),
        .vminus(muxoutMinus),
        .vref(vref),
        .ext_vref(Net_408),
        .clock(sarClock),
        .sw_negvref(Net_410),
        .cfg_st_sel(st_sel[1:0]),
        .cfg_average(Net_412),
        .cfg_resolution(Net_413),
        .cfg_differential(Net_414),
        .trigger(Net_415),
        .data_hilo_sel(Net_416),
        .sample_done(sdone),
        .chan_id_valid(t_chidv),
        .chan_id(t_chid[3:0]),
        .data_valid(t_dav),
        .eos_intr(eos),
        .data(t_da[11:0]),
        .irq(Net_423));

    ZeroTerminal ZeroTerminal_1 (
        .z(Net_410));

    ZeroTerminal ZeroTerminal_2 (
        .z(Net_412));

    ZeroTerminal ZeroTerminal_3 (
        .z(Net_413));

    ZeroTerminal ZeroTerminal_4 (
        .z(Net_414));

    ZeroTerminal ZeroTerminal_5 (
        .z(Net_416));

    ZeroTerminal ZeroTerminal_6 (
        .z(st_sel[1]));

    ZeroTerminal ZeroTerminal_7 (
        .z(st_sel[0]));

	// aclkMux (cy_virtualmux_v1_0)
	assign sarClock = Net_428;

	// socMux (cy_virtualmux_v1_0)
	assign Net_415 = Net_431;

	// extVrefMux (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 extVrefMux_connect(Net_408, Net_439);
	defparam extVrefMux_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_70 (
        .noconnect(Net_441));

	wire [0:0] tmpOE__Bypass_net;
	wire [0:0] tmpFB_0__Bypass_net;
	wire [0:0] tmpIO_0__Bypass_net;
	wire [0:0] tmpINTERRUPT_0__Bypass_net;
	electrical [0:0] tmpSIOVREF__Bypass_net;

	cy_psoc3_pins_v1_10
		#(.id("0b4959b9-355c-4cab-b82c-45add88837c1/77715107-f8d5-47e5-a629-0fb83101ac6b"),
		  .drive_mode(3'b000),
		  .ibuf_enabled(1'b0),
		  .init_dr_st(1'b1),
		  .input_clk_en(0),
		  .input_sync(1'b0),
		  .input_sync_mode(1'b0),
		  .intr_mode(2'b00),
		  .invert_in_clock(0),
		  .invert_in_clock_en(0),
		  .invert_in_reset(0),
		  .invert_out_clock(0),
		  .invert_out_clock_en(0),
		  .invert_out_reset(0),
		  .io_voltage(""),
		  .layout_mode("CONTIGUOUS"),
		  .oe_conn(1'b0),
		  .oe_reset(0),
		  .oe_sync(1'b0),
		  .output_clk_en(0),
		  .output_clock_mode(1'b0),
		  .output_conn(1'b0),
		  .output_mode(1'b0),
		  .output_reset(0),
		  .output_sync(1'b0),
		  .pa_in_clock(-1),
		  .pa_in_clock_en(-1),
		  .pa_in_reset(-1),
		  .pa_out_clock(-1),
		  .pa_out_clock_en(-1),
		  .pa_out_reset(-1),
		  .pin_aliases(""),
		  .pin_mode("A"),
		  .por_state(4),
		  .sio_group_cnt(0),
		  .sio_hyst(1'b1),
		  .sio_ibuf(""),
		  .sio_info(2'b00),
		  .sio_obuf(""),
		  .sio_refsel(""),
		  .sio_vtrip(""),
		  .sio_hifreq(""),
		  .sio_vohsel(""),
		  .slew_rate(1'b0),
		  .spanning(0),
		  .use_annotation(1'b0),
		  .vtrip(2'b10),
		  .width(1),
		  .ovt_hyst_trim(1'b0),
		  .ovt_needed(1'b0),
		  .ovt_slew_control(2'b00),
		  .input_buffer_sel(2'b00))
		Bypass
		 (.oe(tmpOE__Bypass_net),
		  .y({1'b0}),
		  .fb({tmpFB_0__Bypass_net[0:0]}),
		  .analog({Net_439}),
		  .io({tmpIO_0__Bypass_net[0:0]}),
		  .siovref(tmpSIOVREF__Bypass_net),
		  .interrupt({tmpINTERRUPT_0__Bypass_net[0:0]}),
		  .in_clock({1'b0}),
		  .in_clock_en({1'b1}),
		  .in_reset({1'b0}),
		  .out_clock({1'b0}),
		  .out_clock_en({1'b1}),
		  .out_reset({1'b0}));

	assign tmpOE__Bypass_net = (`CYDEV_CHIP_MEMBER_USED == `CYDEV_CHIP_MEMBER_3A && `CYDEV_CHIP_REVISION_USED < `CYDEV_CHIP_REVISION_3A_ES3) ? ~{1'b1} : {1'b1};

    ZeroTerminal ZeroTerminal_8 (
        .z(Net_431));


	cy_clock_v1_0
		#(.id("0b4959b9-355c-4cab-b82c-45add88837c1/d2cd031e-911c-40bc-bbf8-28db941411f9"),
		  .source_clock_id("413DE2EF-D9F2-4233-A808-DFAF137FD877"),
		  .divisor(0),
		  .period("83333333.3333333"),
		  .is_direct(0),
		  .is_digital(0))
		intSarClock
		 (.clock_out(Net_428));



    assign Net_448 = Net_446 | Net_428;

    ZeroTerminal ZeroTerminal_9 (
        .z(Net_446));

	// vrefMux_0 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vrefMux_0_connect(vrefBus[0], Net_456);
	defparam vrefMux_0_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_71 (
        .noconnect(Net_456));

	// vrefMux_1 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vrefMux_1_connect(vrefBus[1], Net_457);
	defparam vrefMux_1_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_72 (
        .noconnect(Net_457));

	// vrefMux_2 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vrefMux_2_connect(vrefBus[2], Net_458);
	defparam vrefMux_2_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_73 (
        .noconnect(Net_458));

	// vrefMux_3 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vrefMux_3_connect(vrefBus[3], Net_459);
	defparam vrefMux_3_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_74 (
        .noconnect(Net_459));


	cy_isr_v1_0
		#(.int_type(2'b10))
		IRQ
		 (.int_signal(Net_423));


	// sarmuxVinPlusMux_0 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinPlusMux_0_connect(sarmuxVinPlus[0], vinPlus[0]);
	defparam sarmuxVinPlusMux_0_connect.sig_width = 1;

	// filterConfigMux_3 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 filterConfigMux_3_connect(filterVin[3], Net_1149);
	defparam filterConfigMux_3_connect.sig_width = 1;

	// filterConfigMux_1 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 filterConfigMux_1_connect(filterVin[1], Net_1137);
	defparam filterConfigMux_1_connect.sig_width = 1;

	// filterConfigMux_2 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 filterConfigMux_2_connect(filterVin[2], Net_1144);
	defparam filterConfigMux_2_connect.sig_width = 1;

	// filterConfigMux_0 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 filterConfigMux_0_connect(filterVin[0], Net_1023);
	defparam filterConfigMux_0_connect.sig_width = 1;

	// filterVinMux_3_2 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 filterVinMux_3_2_connect(Net_1148, vinPlus[35]);
	defparam filterVinMux_3_2_connect.sig_width = 1;

	// filterVinMux_3_1 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 filterVinMux_3_1_connect(Net_1147, vinPlus[19]);
	defparam filterVinMux_3_1_connect.sig_width = 1;

	// filterVinMux_3_0 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 filterVinMux_3_0_connect(Net_1146, vinPlus[3]);
	defparam filterVinMux_3_0_connect.sig_width = 1;

	// filterVinMux_2_1 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 filterVinMux_2_1_connect(Net_1143, vinPlus[18]);
	defparam filterVinMux_2_1_connect.sig_width = 1;

	// filterVinMux_2_0 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 filterVinMux_2_0_connect(Net_1142, vinPlus[2]);
	defparam filterVinMux_2_0_connect.sig_width = 1;

	// filterVinMux_1_0 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 filterVinMux_1_0_connect(Net_1136, vinPlus[1]);
	defparam filterVinMux_1_0_connect.sig_width = 1;

	// sarmuxVinPlusMux_1 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinPlusMux_1_connect(sarmuxVinPlus[1], vinPlus[1]);
	defparam sarmuxVinPlusMux_1_connect.sig_width = 1;

	// sarmuxVinPlusMux_2 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinPlusMux_2_connect(sarmuxVinPlus[2], vinPlus[2]);
	defparam sarmuxVinPlusMux_2_connect.sig_width = 1;

	// sarmuxVinPlusMux_3 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinPlusMux_3_connect(sarmuxVinPlus[3], vinPlus[3]);
	defparam sarmuxVinPlusMux_3_connect.sig_width = 1;

	// sarmuxVinPlusMux_4 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinPlusMux_4_connect(sarmuxVinPlus[4], vinPlus[4]);
	defparam sarmuxVinPlusMux_4_connect.sig_width = 1;

	// sarmuxVinPlusMux_5 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinPlusMux_5_connect(sarmuxVinPlus[5], vinPlus[5]);
	defparam sarmuxVinPlusMux_5_connect.sig_width = 1;

	// sarmuxVinPlusMux_6 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinPlusMux_6_connect(sarmuxVinPlus[6], vinPlus[6]);
	defparam sarmuxVinPlusMux_6_connect.sig_width = 1;

	// sarmuxVinPlusMux_7 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinPlusMux_7_connect(sarmuxVinPlus[7], vinPlus[7]);
	defparam sarmuxVinPlusMux_7_connect.sig_width = 1;

	// sarmuxVinPlusMux_8 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinPlusMux_8_connect(sarmuxVinPlus[8], vinPlus[8]);
	defparam sarmuxVinPlusMux_8_connect.sig_width = 1;

	// sarmuxVinPlusMux_9 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinPlusMux_9_connect(sarmuxVinPlus[9], vinPlus[9]);
	defparam sarmuxVinPlusMux_9_connect.sig_width = 1;

	// sarmuxVinPlusMux_10 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinPlusMux_10_connect(sarmuxVinPlus[10], vinPlus[10]);
	defparam sarmuxVinPlusMux_10_connect.sig_width = 1;

	// sarmuxVinPlusMux_11 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinPlusMux_11_connect(sarmuxVinPlus[11], vinPlus[11]);
	defparam sarmuxVinPlusMux_11_connect.sig_width = 1;

	// sarmuxVinPlusMux_12 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinPlusMux_12_connect(sarmuxVinPlus[12], vinPlus[12]);
	defparam sarmuxVinPlusMux_12_connect.sig_width = 1;

	// sarmuxVinPlusMux_13 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinPlusMux_13_connect(sarmuxVinPlus[13], vinPlus[13]);
	defparam sarmuxVinPlusMux_13_connect.sig_width = 1;

	// sarmuxVinPlusMux_14 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinPlusMux_14_connect(sarmuxVinPlus[14], vinPlus[14]);
	defparam sarmuxVinPlusMux_14_connect.sig_width = 1;

	// sarmuxVinPlusMux_15 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinPlusMux_15_connect(sarmuxVinPlus[15], vinPlus[15]);
	defparam sarmuxVinPlusMux_15_connect.sig_width = 1;

	// sarmuxVinPlusMux_16 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinPlusMux_16_connect(sarmuxVinPlus[16], vinPlus[16]);
	defparam sarmuxVinPlusMux_16_connect.sig_width = 1;

	// sarmuxVinPlusMux_17 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinPlusMux_17_connect(sarmuxVinPlus[17], vinPlus[17]);
	defparam sarmuxVinPlusMux_17_connect.sig_width = 1;

	// sarmuxVinPlusMux_18 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinPlusMux_18_connect(sarmuxVinPlus[18], vinPlus[18]);
	defparam sarmuxVinPlusMux_18_connect.sig_width = 1;

	// sarmuxVinPlusMux_19 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinPlusMux_19_connect(sarmuxVinPlus[19], vinPlus[19]);
	defparam sarmuxVinPlusMux_19_connect.sig_width = 1;

	// sarmuxVinPlusMux_20 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinPlusMux_20_connect(sarmuxVinPlus[20], vinPlus[20]);
	defparam sarmuxVinPlusMux_20_connect.sig_width = 1;

	// sarmuxVinPlusMux_21 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinPlusMux_21_connect(sarmuxVinPlus[21], vinPlus[21]);
	defparam sarmuxVinPlusMux_21_connect.sig_width = 1;

	// sarmuxVinPlusMux_22 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinPlusMux_22_connect(sarmuxVinPlus[22], vinPlus[22]);
	defparam sarmuxVinPlusMux_22_connect.sig_width = 1;

	// sarmuxVinPlusMux_23 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinPlusMux_23_connect(sarmuxVinPlus[23], vinPlus[23]);
	defparam sarmuxVinPlusMux_23_connect.sig_width = 1;

	// sarmuxVinPlusMux_24 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinPlusMux_24_connect(sarmuxVinPlus[24], vinPlus[24]);
	defparam sarmuxVinPlusMux_24_connect.sig_width = 1;

	// sarmuxVinPlusMux_25 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinPlusMux_25_connect(sarmuxVinPlus[25], vinPlus[25]);
	defparam sarmuxVinPlusMux_25_connect.sig_width = 1;

	// sarmuxVinPlusMux_26 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinPlusMux_26_connect(sarmuxVinPlus[26], vinPlus[26]);
	defparam sarmuxVinPlusMux_26_connect.sig_width = 1;

	// sarmuxVinPlusMux_27 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinPlusMux_27_connect(sarmuxVinPlus[27], vinPlus[27]);
	defparam sarmuxVinPlusMux_27_connect.sig_width = 1;

	// sarmuxVinPlusMux_28 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinPlusMux_28_connect(sarmuxVinPlus[28], vinPlus[28]);
	defparam sarmuxVinPlusMux_28_connect.sig_width = 1;

	// sarmuxVinPlusMux_29 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinPlusMux_29_connect(sarmuxVinPlus[29], vinPlus[29]);
	defparam sarmuxVinPlusMux_29_connect.sig_width = 1;

	// sarmuxVinPlusMux_30 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinPlusMux_30_connect(sarmuxVinPlus[30], vinPlus[30]);
	defparam sarmuxVinPlusMux_30_connect.sig_width = 1;

	// sarmuxVinPlusMux_31 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinPlusMux_31_connect(sarmuxVinPlus[31], vinPlus[31]);
	defparam sarmuxVinPlusMux_31_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_69 (
        .noconnect(Net_1149));

    cy_analog_noconnect_v1_0 cy_analog_noconnect_75 (
        .noconnect(Net_1144));

    cy_analog_noconnect_v1_0 cy_analog_noconnect_76 (
        .noconnect(Net_1137));

    cy_analog_noconnect_v1_0 cy_analog_noconnect_77 (
        .noconnect(Net_1023));

    cy_analog_noconnect_v1_0 cy_analog_noconnect_78 (
        .noconnect(Net_1475));

    ZeroTerminal ZeroTerminal_10 (
        .z(Net_1002));

    ZeroTerminal ZeroTerminal_11 (
        .z(Net_1009));

    ZeroTerminal ZeroTerminal_12 (
        .z(Net_1003));

    ZeroTerminal ZeroTerminal_13 (
        .z(Net_1007));

    ZeroTerminal ZeroTerminal_14 (
        .z(Net_991));

    ZeroTerminal ZeroTerminal_15 (
        .z(Net_987));

    ZeroTerminal ZeroTerminal_16 (
        .z(Net_993));

    ZeroTerminal ZeroTerminal_17 (
        .z(Net_986));

	// sarmuxVinMinusMux_32 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinMinusMux_32_connect(sarmuxVinMinus[32], vinMinus[32]);
	defparam sarmuxVinMinusMux_32_connect.sig_width = 1;

	// sarmuxVinPlusMux_32 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinPlusMux_32_connect(sarmuxVinPlus[32], vinPlus[32]);
	defparam sarmuxVinPlusMux_32_connect.sig_width = 1;

	// sarmuxVinPlusMux_33 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinPlusMux_33_connect(sarmuxVinPlus[33], vinPlus[33]);
	defparam sarmuxVinPlusMux_33_connect.sig_width = 1;

	// sarmuxVinPlusMux_34 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinPlusMux_34_connect(sarmuxVinPlus[34], vinPlus[34]);
	defparam sarmuxVinPlusMux_34_connect.sig_width = 1;

	// sarmuxVinPlusMux_35 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinPlusMux_35_connect(sarmuxVinPlus[35], vinPlus[35]);
	defparam sarmuxVinPlusMux_35_connect.sig_width = 1;

	// sarmuxVinPlusMux_36 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinPlusMux_36_connect(sarmuxVinPlus[36], vinPlus[36]);
	defparam sarmuxVinPlusMux_36_connect.sig_width = 1;

	// sarmuxVinPlusMux_37 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinPlusMux_37_connect(sarmuxVinPlus[37], vinPlus[37]);
	defparam sarmuxVinPlusMux_37_connect.sig_width = 1;

	// sarmuxVinPlusMux_38 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinPlusMux_38_connect(sarmuxVinPlus[38], vinPlus[38]);
	defparam sarmuxVinPlusMux_38_connect.sig_width = 1;

	// sarmuxVinPlusMux_39 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinPlusMux_39_connect(sarmuxVinPlus[39], vinPlus[39]);
	defparam sarmuxVinPlusMux_39_connect.sig_width = 1;

	// sarmuxVinPlusMux_40 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinPlusMux_40_connect(sarmuxVinPlus[40], vinPlus[40]);
	defparam sarmuxVinPlusMux_40_connect.sig_width = 1;

	// sarmuxVinPlusMux_41 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinPlusMux_41_connect(sarmuxVinPlus[41], vinPlus[41]);
	defparam sarmuxVinPlusMux_41_connect.sig_width = 1;

	// sarmuxVinPlusMux_42 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinPlusMux_42_connect(sarmuxVinPlus[42], vinPlus[42]);
	defparam sarmuxVinPlusMux_42_connect.sig_width = 1;

	// sarmuxVinPlusMux_43 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinPlusMux_43_connect(sarmuxVinPlus[43], vinPlus[43]);
	defparam sarmuxVinPlusMux_43_connect.sig_width = 1;

	// sarmuxVinPlusMux_44 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinPlusMux_44_connect(sarmuxVinPlus[44], vinPlus[44]);
	defparam sarmuxVinPlusMux_44_connect.sig_width = 1;

	// sarmuxVinPlusMux_45 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinPlusMux_45_connect(sarmuxVinPlus[45], vinPlus[45]);
	defparam sarmuxVinPlusMux_45_connect.sig_width = 1;

	// sarmuxVinPlusMux_46 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinPlusMux_46_connect(sarmuxVinPlus[46], vinPlus[46]);
	defparam sarmuxVinPlusMux_46_connect.sig_width = 1;

	// sarmuxVinPlusMux_47 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinPlusMux_47_connect(sarmuxVinPlus[47], vinPlus[47]);
	defparam sarmuxVinPlusMux_47_connect.sig_width = 1;

	// sarmuxVinPlusMux_48 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinPlusMux_48_connect(sarmuxVinPlus[48], vinPlus[48]);
	defparam sarmuxVinPlusMux_48_connect.sig_width = 1;

	// sarmuxVinPlusMux_49 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinPlusMux_49_connect(sarmuxVinPlus[49], vinPlus[49]);
	defparam sarmuxVinPlusMux_49_connect.sig_width = 1;

	// sarmuxVinPlusMux_50 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinPlusMux_50_connect(sarmuxVinPlus[50], vinPlus[50]);
	defparam sarmuxVinPlusMux_50_connect.sig_width = 1;

	// sarmuxVinPlusMux_51 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinPlusMux_51_connect(sarmuxVinPlus[51], vinPlus[51]);
	defparam sarmuxVinPlusMux_51_connect.sig_width = 1;

	// sarmuxVinPlusMux_52 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinPlusMux_52_connect(sarmuxVinPlus[52], vinPlus[52]);
	defparam sarmuxVinPlusMux_52_connect.sig_width = 1;

	// sarmuxVinPlusMux_53 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinPlusMux_53_connect(sarmuxVinPlus[53], vinPlus[53]);
	defparam sarmuxVinPlusMux_53_connect.sig_width = 1;

	// sarmuxVinPlusMux_54 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinPlusMux_54_connect(sarmuxVinPlus[54], vinPlus[54]);
	defparam sarmuxVinPlusMux_54_connect.sig_width = 1;

	// sarmuxVinPlusMux_55 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinPlusMux_55_connect(sarmuxVinPlus[55], vinPlus[55]);
	defparam sarmuxVinPlusMux_55_connect.sig_width = 1;

	// sarmuxVinPlusMux_56 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinPlusMux_56_connect(sarmuxVinPlus[56], vinPlus[56]);
	defparam sarmuxVinPlusMux_56_connect.sig_width = 1;

	// sarmuxVinPlusMux_57 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinPlusMux_57_connect(sarmuxVinPlus[57], vinPlus[57]);
	defparam sarmuxVinPlusMux_57_connect.sig_width = 1;

	// sarmuxVinPlusMux_58 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinPlusMux_58_connect(sarmuxVinPlus[58], vinPlus[58]);
	defparam sarmuxVinPlusMux_58_connect.sig_width = 1;

	// sarmuxVinPlusMux_59 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinPlusMux_59_connect(sarmuxVinPlus[59], vinPlus[59]);
	defparam sarmuxVinPlusMux_59_connect.sig_width = 1;

	// sarmuxVinPlusMux_60 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinPlusMux_60_connect(sarmuxVinPlus[60], vinPlus[60]);
	defparam sarmuxVinPlusMux_60_connect.sig_width = 1;

	// sarmuxVinPlusMux_61 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinPlusMux_61_connect(sarmuxVinPlus[61], vinPlus[61]);
	defparam sarmuxVinPlusMux_61_connect.sig_width = 1;

	// sarmuxVinPlusMux_62 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinPlusMux_62_connect(sarmuxVinPlus[62], vinPlus[62]);
	defparam sarmuxVinPlusMux_62_connect.sig_width = 1;

	// sarmuxVinPlusMux_63 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinPlusMux_63_connect(sarmuxVinPlus[63], vinPlus[63]);
	defparam sarmuxVinPlusMux_63_connect.sig_width = 1;


	cy_clock_v1_0
		#(.id("0b4959b9-355c-4cab-b82c-45add88837c1/b6815a07-3ae4-40f3-8790-63c50500bc89"),
		  .source_clock_id("413DE2EF-D9F2-4233-A808-DFAF137FD877"),
		  .divisor(2),
		  .period("0"),
		  .is_direct(0),
		  .is_digital(0))
		intUabClock
		 (.clock_out(uabClock));


	// sarmuxVinMinusMux_0 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinMinusMux_0_connect(sarmuxVinMinus[0], vinMinus[0]);
	defparam sarmuxVinMinusMux_0_connect.sig_width = 1;

	// sarmuxVinMinusMux_1 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinMinusMux_1_connect(sarmuxVinMinus[1], vinMinus[1]);
	defparam sarmuxVinMinusMux_1_connect.sig_width = 1;

	// sarmuxVinMinusMux_2 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinMinusMux_2_connect(sarmuxVinMinus[2], vinMinus[2]);
	defparam sarmuxVinMinusMux_2_connect.sig_width = 1;

	// sarmuxVinMinusMux_3 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinMinusMux_3_connect(sarmuxVinMinus[3], vinMinus[3]);
	defparam sarmuxVinMinusMux_3_connect.sig_width = 1;

	// sarmuxVinMinusMux_4 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinMinusMux_4_connect(sarmuxVinMinus[4], vinMinus[4]);
	defparam sarmuxVinMinusMux_4_connect.sig_width = 1;

	// sarmuxVinMinusMux_5 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinMinusMux_5_connect(sarmuxVinMinus[5], vinMinus[5]);
	defparam sarmuxVinMinusMux_5_connect.sig_width = 1;

	// sarmuxVinMinusMux_6 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinMinusMux_6_connect(sarmuxVinMinus[6], vinMinus[6]);
	defparam sarmuxVinMinusMux_6_connect.sig_width = 1;

	// sarmuxVinMinusMux_7 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinMinusMux_7_connect(sarmuxVinMinus[7], vinMinus[7]);
	defparam sarmuxVinMinusMux_7_connect.sig_width = 1;

	// sarmuxVinMinusMux_8 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinMinusMux_8_connect(sarmuxVinMinus[8], vinMinus[8]);
	defparam sarmuxVinMinusMux_8_connect.sig_width = 1;

	// sarmuxVinMinusMux_9 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinMinusMux_9_connect(sarmuxVinMinus[9], vinMinus[9]);
	defparam sarmuxVinMinusMux_9_connect.sig_width = 1;

	// sarmuxVinMinusMux_10 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinMinusMux_10_connect(sarmuxVinMinus[10], vinMinus[10]);
	defparam sarmuxVinMinusMux_10_connect.sig_width = 1;

	// sarmuxVinMinusMux_11 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinMinusMux_11_connect(sarmuxVinMinus[11], vinMinus[11]);
	defparam sarmuxVinMinusMux_11_connect.sig_width = 1;

	// sarmuxVinMinusMux_12 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinMinusMux_12_connect(sarmuxVinMinus[12], vinMinus[12]);
	defparam sarmuxVinMinusMux_12_connect.sig_width = 1;

	// sarmuxVinMinusMux_13 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinMinusMux_13_connect(sarmuxVinMinus[13], vinMinus[13]);
	defparam sarmuxVinMinusMux_13_connect.sig_width = 1;

	// sarmuxVinMinusMux_14 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinMinusMux_14_connect(sarmuxVinMinus[14], vinMinus[14]);
	defparam sarmuxVinMinusMux_14_connect.sig_width = 1;

	// sarmuxVinMinusMux_15 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinMinusMux_15_connect(sarmuxVinMinus[15], vinMinus[15]);
	defparam sarmuxVinMinusMux_15_connect.sig_width = 1;

	// sarmuxVinMinusMux_16 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinMinusMux_16_connect(sarmuxVinMinus[16], vinMinus[16]);
	defparam sarmuxVinMinusMux_16_connect.sig_width = 1;

	// sarmuxVinMinusMux_17 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinMinusMux_17_connect(sarmuxVinMinus[17], vinMinus[17]);
	defparam sarmuxVinMinusMux_17_connect.sig_width = 1;

	// sarmuxVinMinusMux_18 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinMinusMux_18_connect(sarmuxVinMinus[18], vinMinus[18]);
	defparam sarmuxVinMinusMux_18_connect.sig_width = 1;

	// sarmuxVinMinusMux_19 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinMinusMux_19_connect(sarmuxVinMinus[19], vinMinus[19]);
	defparam sarmuxVinMinusMux_19_connect.sig_width = 1;

	// sarmuxVinMinusMux_20 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinMinusMux_20_connect(sarmuxVinMinus[20], vinMinus[20]);
	defparam sarmuxVinMinusMux_20_connect.sig_width = 1;

	// sarmuxVinMinusMux_21 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinMinusMux_21_connect(sarmuxVinMinus[21], vinMinus[21]);
	defparam sarmuxVinMinusMux_21_connect.sig_width = 1;

	// sarmuxVinMinusMux_22 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinMinusMux_22_connect(sarmuxVinMinus[22], vinMinus[22]);
	defparam sarmuxVinMinusMux_22_connect.sig_width = 1;

	// sarmuxVinMinusMux_23 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinMinusMux_23_connect(sarmuxVinMinus[23], vinMinus[23]);
	defparam sarmuxVinMinusMux_23_connect.sig_width = 1;

	// sarmuxVinMinusMux_24 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinMinusMux_24_connect(sarmuxVinMinus[24], vinMinus[24]);
	defparam sarmuxVinMinusMux_24_connect.sig_width = 1;

	// sarmuxVinMinusMux_25 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinMinusMux_25_connect(sarmuxVinMinus[25], vinMinus[25]);
	defparam sarmuxVinMinusMux_25_connect.sig_width = 1;

	// sarmuxVinMinusMux_26 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinMinusMux_26_connect(sarmuxVinMinus[26], vinMinus[26]);
	defparam sarmuxVinMinusMux_26_connect.sig_width = 1;

	// sarmuxVinMinusMux_27 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinMinusMux_27_connect(sarmuxVinMinus[27], vinMinus[27]);
	defparam sarmuxVinMinusMux_27_connect.sig_width = 1;

	// sarmuxVinMinusMux_28 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinMinusMux_28_connect(sarmuxVinMinus[28], vinMinus[28]);
	defparam sarmuxVinMinusMux_28_connect.sig_width = 1;

	// sarmuxVinMinusMux_29 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinMinusMux_29_connect(sarmuxVinMinus[29], vinMinus[29]);
	defparam sarmuxVinMinusMux_29_connect.sig_width = 1;

	// sarmuxVinMinusMux_30 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinMinusMux_30_connect(sarmuxVinMinus[30], vinMinus[30]);
	defparam sarmuxVinMinusMux_30_connect.sig_width = 1;

	// sarmuxVinMinusMux_31 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinMinusMux_31_connect(sarmuxVinMinus[31], vinMinus[31]);
	defparam sarmuxVinMinusMux_31_connect.sig_width = 1;

	// sarmuxVinMinusMux_33 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinMinusMux_33_connect(sarmuxVinMinus[33], vinMinus[33]);
	defparam sarmuxVinMinusMux_33_connect.sig_width = 1;

	// sarmuxVinMinusMux_34 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinMinusMux_34_connect(sarmuxVinMinus[34], vinMinus[34]);
	defparam sarmuxVinMinusMux_34_connect.sig_width = 1;

	// sarmuxVinMinusMux_35 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinMinusMux_35_connect(sarmuxVinMinus[35], vinMinus[35]);
	defparam sarmuxVinMinusMux_35_connect.sig_width = 1;

	// sarmuxVinMinusMux_36 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinMinusMux_36_connect(sarmuxVinMinus[36], vinMinus[36]);
	defparam sarmuxVinMinusMux_36_connect.sig_width = 1;

	// sarmuxVinMinusMux_37 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinMinusMux_37_connect(sarmuxVinMinus[37], vinMinus[37]);
	defparam sarmuxVinMinusMux_37_connect.sig_width = 1;

	// sarmuxVinMinusMux_38 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinMinusMux_38_connect(sarmuxVinMinus[38], vinMinus[38]);
	defparam sarmuxVinMinusMux_38_connect.sig_width = 1;

	// sarmuxVinMinusMux_39 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinMinusMux_39_connect(sarmuxVinMinus[39], vinMinus[39]);
	defparam sarmuxVinMinusMux_39_connect.sig_width = 1;

	// sarmuxVinMinusMux_40 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinMinusMux_40_connect(sarmuxVinMinus[40], vinMinus[40]);
	defparam sarmuxVinMinusMux_40_connect.sig_width = 1;

	// sarmuxVinMinusMux_41 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinMinusMux_41_connect(sarmuxVinMinus[41], vinMinus[41]);
	defparam sarmuxVinMinusMux_41_connect.sig_width = 1;

	// sarmuxVinMinusMux_42 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinMinusMux_42_connect(sarmuxVinMinus[42], vinMinus[42]);
	defparam sarmuxVinMinusMux_42_connect.sig_width = 1;

	// sarmuxVinMinusMux_43 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinMinusMux_43_connect(sarmuxVinMinus[43], vinMinus[43]);
	defparam sarmuxVinMinusMux_43_connect.sig_width = 1;

	// sarmuxVinMinusMux_44 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinMinusMux_44_connect(sarmuxVinMinus[44], vinMinus[44]);
	defparam sarmuxVinMinusMux_44_connect.sig_width = 1;

	// sarmuxVinMinusMux_45 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinMinusMux_45_connect(sarmuxVinMinus[45], vinMinus[45]);
	defparam sarmuxVinMinusMux_45_connect.sig_width = 1;

	// sarmuxVinMinusMux_46 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinMinusMux_46_connect(sarmuxVinMinus[46], vinMinus[46]);
	defparam sarmuxVinMinusMux_46_connect.sig_width = 1;

	// sarmuxVinMinusMux_47 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinMinusMux_47_connect(sarmuxVinMinus[47], vinMinus[47]);
	defparam sarmuxVinMinusMux_47_connect.sig_width = 1;

	// sarmuxVinMinusMux_48 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinMinusMux_48_connect(sarmuxVinMinus[48], vinMinus[48]);
	defparam sarmuxVinMinusMux_48_connect.sig_width = 1;

	// sarmuxVinMinusMux_49 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinMinusMux_49_connect(sarmuxVinMinus[49], vinMinus[49]);
	defparam sarmuxVinMinusMux_49_connect.sig_width = 1;

	// sarmuxVinMinusMux_50 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinMinusMux_50_connect(sarmuxVinMinus[50], vinMinus[50]);
	defparam sarmuxVinMinusMux_50_connect.sig_width = 1;

	// sarmuxVinMinusMux_51 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinMinusMux_51_connect(sarmuxVinMinus[51], vinMinus[51]);
	defparam sarmuxVinMinusMux_51_connect.sig_width = 1;

	// sarmuxVinMinusMux_52 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinMinusMux_52_connect(sarmuxVinMinus[52], vinMinus[52]);
	defparam sarmuxVinMinusMux_52_connect.sig_width = 1;

	// sarmuxVinMinusMux_53 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinMinusMux_53_connect(sarmuxVinMinus[53], vinMinus[53]);
	defparam sarmuxVinMinusMux_53_connect.sig_width = 1;

	// sarmuxVinMinusMux_54 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinMinusMux_54_connect(sarmuxVinMinus[54], vinMinus[54]);
	defparam sarmuxVinMinusMux_54_connect.sig_width = 1;

	// sarmuxVinMinusMux_55 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinMinusMux_55_connect(sarmuxVinMinus[55], vinMinus[55]);
	defparam sarmuxVinMinusMux_55_connect.sig_width = 1;

	// sarmuxVinMinusMux_56 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinMinusMux_56_connect(sarmuxVinMinus[56], vinMinus[56]);
	defparam sarmuxVinMinusMux_56_connect.sig_width = 1;

	// sarmuxVinMinusMux_57 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinMinusMux_57_connect(sarmuxVinMinus[57], vinMinus[57]);
	defparam sarmuxVinMinusMux_57_connect.sig_width = 1;

	// sarmuxVinMinusMux_58 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinMinusMux_58_connect(sarmuxVinMinus[58], vinMinus[58]);
	defparam sarmuxVinMinusMux_58_connect.sig_width = 1;

	// sarmuxVinMinusMux_59 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinMinusMux_59_connect(sarmuxVinMinus[59], vinMinus[59]);
	defparam sarmuxVinMinusMux_59_connect.sig_width = 1;

	// sarmuxVinMinusMux_60 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinMinusMux_60_connect(sarmuxVinMinus[60], vinMinus[60]);
	defparam sarmuxVinMinusMux_60_connect.sig_width = 1;

	// sarmuxVinMinusMux_61 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinMinusMux_61_connect(sarmuxVinMinus[61], vinMinus[61]);
	defparam sarmuxVinMinusMux_61_connect.sig_width = 1;

	// sarmuxVinMinusMux_62 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinMinusMux_62_connect(sarmuxVinMinus[62], vinMinus[62]);
	defparam sarmuxVinMinusMux_62_connect.sig_width = 1;

	// sarmuxVinMinusMux_63 (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 sarmuxVinMinusMux_63_connect(sarmuxVinMinus[63], vinMinus[63]);
	defparam sarmuxVinMinusMux_63_connect.sig_width = 1;


	cy_vref_v1_0
		#(.guid("8033E1AF-BF3E-4071-8785-2960FD1E3424"),
		  .name("System wide reference"),
		  .autoenable(1))
		vRef_4
		 (.vout(Net_1379));



	cy_vref_v1_0
		#(.guid("8033E1AF-BF3E-4071-8785-2960FD1E3424"),
		  .name("System wide reference"),
		  .autoenable(1))
		vRef_5
		 (.vout(Net_1382));



	cy_vref_v1_0
		#(.guid("8033E1AF-BF3E-4071-8785-2960FD1E3424"),
		  .name("System wide reference"),
		  .autoenable(1))
		vRef_6
		 (.vout(Net_1385));



	cy_vref_v1_0
		#(.guid("8033E1AF-BF3E-4071-8785-2960FD1E3424"),
		  .name("System wide reference"),
		  .autoenable(1))
		vRef_7
		 (.vout(Net_1388));



	cy_vref_v1_0
		#(.guid("27E55207-D708-4E0A-9CA9-208BEFB90B23"),
		  .name("CY_INTERNAL_VSSA_KELVIN"),
		  .autoenable(1))
		vssa_kelvin_3
		 (.vout(Net_1406));



	cy_vref_v1_0
		#(.guid("27E55207-D708-4E0A-9CA9-208BEFB90B23"),
		  .name("CY_INTERNAL_VSSA_KELVIN"),
		  .autoenable(1))
		vssa_kelvin_2
		 (.vout(Net_1402));



	cy_vref_v1_0
		#(.guid("27E55207-D708-4E0A-9CA9-208BEFB90B23"),
		  .name("CY_INTERNAL_VSSA_KELVIN"),
		  .autoenable(1))
		vssa_kelvin_1
		 (.vout(Net_1399));



	cy_vref_v1_0
		#(.guid("27E55207-D708-4E0A-9CA9-208BEFB90B23"),
		  .name("CY_INTERNAL_VSSA_KELVIN"),
		  .autoenable(1))
		vssa_kelvin_0
		 (.vout(Net_1405));


	// vrefMuxRemoved (cy_analog_virtualmux_v1_0)
	cy_connect_v1_0 vrefMuxRemoved_connect(vref, Net_1448);
	defparam vrefMuxRemoved_connect.sig_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_87 (
        .noconnect(Net_1448));

    Bus_Connect_v2_50 intermbc (
        .in_bus(Net_1523[0:0]),
        .out_bus(t_fvinternal[0]));
    defparam intermbc.in_width = 1;
    defparam intermbc.out_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_81 (
        .noconnect(Net_983));

    Bus_Connect_v2_50 agndbc (
        .in_bus(filterVagnd),
        .out_bus(t_fvinternal[1]));
    defparam agndbc.in_width = 1;
    defparam agndbc.out_width = 1;

    cy_analog_noconnect_v1_0 cy_analog_noconnect_80 (
        .noconnect(Net_1506));

    cy_analog_noconnect_v1_0 cy_analog_noconnect_82 (
        .noconnect(Net_1507));

    cy_analog_noconnect_v1_0 cy_analog_noconnect_83 (
        .noconnect(Net_1504));

    cy_analog_noconnect_v1_0 cy_analog_noconnect_84 (
        .noconnect(Net_1530));

    cy_analog_noconnect_v1_0 cy_analog_noconnect_85 (
        .noconnect(Net_1529));

    cy_analog_noconnect_v1_0 cy_analog_noconnect_86 (
        .noconnect(Net_1528));

    Bus_Connect_v2_50 vinPlusConnect (
        .in_bus(sarmuxVinPlus[63:0]),
        .out_bus(Net_339[0:0]));
    defparam vinPlusConnect.in_width = 64;
    defparam vinPlusConnect.out_width = 1;


    cy_connect_v1_0 t_fvout__cy_connect_v1_0(t_fvout, filterVout);
    defparam t_fvout__cy_connect_v1_0.sig_width = 1;


endmodule

// top
module top ;

    electrical  Net_231;
    electrical [1:0] Net_230;
          wire  Net_229;
    electrical  Net_228;
          wire [11:0] Net_227;
          wire  Net_226;
          wire [3:0] Net_225;
          wire  Net_224;
          wire  Net_223;
          wire  Net_222;
    electrical  Net_28;
          wire  Net_22;
          wire  Net_21;
          wire  Net_20;
          wire  Net_19;
          wire  Net_18;
          wire  Net_17;
          wire  Net_16;
          wire  Net_15;
          wire  Net_14;
          wire  Net_13;
          wire  Net_12;
          wire  Net_11;
          wire  Net_10;
          wire  Net_9;
          wire  Net_8;
          wire  Net_7;
          wire  Net_6;
          wire  Net_5;
          wire  Net_4;
          wire  Net_3;
          wire  Net_2;
          wire  Net_1;
    electrical  Net_27;
    electrical  Net_240;

    SCB_P4_v4_0_0 UART_PC (
        .cts_in(1'b0),
        .rts_out(Net_2),
        .interrupt(Net_3),
        .clock(1'b0),
        .rx_dma_out(Net_5),
        .tx_dma_out(Net_6),
        .s_mosi(1'b0),
        .s_sclk(1'b0),
        .s_ss(1'b0),
        .m_miso(1'b0),
        .m_mosi(Net_11),
        .m_sclk(Net_12),
        .m_ss0(Net_13),
        .m_ss1(Net_14),
        .m_ss2(Net_15),
        .m_ss3(Net_16),
        .s_miso(Net_17),
        .rx_in(1'b0),
        .tx_out(Net_19),
        .scl_b(Net_20),
        .sda_b(Net_21),
        .rx_tx_out(Net_22));

	wire [0:0] tmpOE__Thermocouple_Input_P_net;
	wire [0:0] tmpFB_0__Thermocouple_Input_P_net;
	wire [0:0] tmpIO_0__Thermocouple_Input_P_net;
	wire [0:0] tmpINTERRUPT_0__Thermocouple_Input_P_net;
	electrical [0:0] tmpSIOVREF__Thermocouple_Input_P_net;

	cy_psoc3_pins_v1_10
		#(.id("77715107-f8d5-47e5-a629-0fb83101ac6b"),
		  .drive_mode(3'b000),
		  .ibuf_enabled(1'b0),
		  .init_dr_st(1'b1),
		  .input_clk_en(0),
		  .input_sync(1'b0),
		  .input_sync_mode(1'b0),
		  .intr_mode(2'b00),
		  .invert_in_clock(0),
		  .invert_in_clock_en(0),
		  .invert_in_reset(0),
		  .invert_out_clock(0),
		  .invert_out_clock_en(0),
		  .invert_out_reset(0),
		  .io_voltage(""),
		  .layout_mode("CONTIGUOUS"),
		  .oe_conn(1'b0),
		  .oe_reset(0),
		  .oe_sync(1'b0),
		  .output_clk_en(0),
		  .output_clock_mode(1'b0),
		  .output_conn(1'b0),
		  .output_mode(1'b0),
		  .output_reset(0),
		  .output_sync(1'b0),
		  .pa_in_clock(-1),
		  .pa_in_clock_en(-1),
		  .pa_in_reset(-1),
		  .pa_out_clock(-1),
		  .pa_out_clock_en(-1),
		  .pa_out_reset(-1),
		  .pin_aliases(""),
		  .pin_mode("A"),
		  .por_state(4),
		  .sio_group_cnt(0),
		  .sio_hyst(1'b1),
		  .sio_ibuf(""),
		  .sio_info(2'b00),
		  .sio_obuf(""),
		  .sio_refsel(""),
		  .sio_vtrip(""),
		  .sio_hifreq(""),
		  .sio_vohsel(""),
		  .slew_rate(1'b0),
		  .spanning(0),
		  .use_annotation(1'b0),
		  .vtrip(2'b10),
		  .width(1),
		  .ovt_hyst_trim(1'b0),
		  .ovt_needed(1'b0),
		  .ovt_slew_control(2'b00),
		  .input_buffer_sel(2'b00))
		Thermocouple_Input_P
		 (.oe(tmpOE__Thermocouple_Input_P_net),
		  .y({1'b0}),
		  .fb({tmpFB_0__Thermocouple_Input_P_net[0:0]}),
		  .analog({Net_240}),
		  .io({tmpIO_0__Thermocouple_Input_P_net[0:0]}),
		  .siovref(tmpSIOVREF__Thermocouple_Input_P_net),
		  .interrupt({tmpINTERRUPT_0__Thermocouple_Input_P_net[0:0]}),
		  .in_clock({1'b0}),
		  .in_clock_en({1'b1}),
		  .in_reset({1'b0}),
		  .out_clock({1'b0}),
		  .out_clock_en({1'b1}),
		  .out_reset({1'b0}));

	assign tmpOE__Thermocouple_Input_P_net = (`CYDEV_CHIP_MEMBER_USED == `CYDEV_CHIP_MEMBER_3A && `CYDEV_CHIP_REVISION_USED < `CYDEV_CHIP_REVISION_3A_ES3) ? ~{1'b1} : {1'b1};

    PGA_P4_v1_10_1 PGA (
        .Vin(Net_240),
        .Vref(Net_28),
        .Vout(Net_27));

    Scan_ADC_v3_10_2 ADC_Temp (
        .sdone(Net_222),
        .eos(Net_223),
        .t_chidv(Net_224),
        .t_chid(Net_225[3:0]),
        .t_dav(Net_226),
        .t_da(Net_227[11:0]),
        .t_fvout(Net_228),
        .t_fvalid(Net_229),
        .t_fvinternal(Net_230[1:0]),
        .vagnd(Net_231),
        .vinPlus_0(Net_27));



endmodule

