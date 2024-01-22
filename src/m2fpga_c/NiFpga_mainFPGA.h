/*
 * Generated with the FPGA Interface C API Generator 18.0.0
 * for NI-RIO 18.0.0 or later.
 */

#ifndef __NiFpga_mainFPGA_h__
#define __NiFpga_mainFPGA_h__

#ifndef NiFpga_Version
   #define NiFpga_Version 1800
#endif

#include "NiFpga.h"

/**
 * The filename of the FPGA bitfile.
 *
 * This is a #define to allow for string literal concatenation. For example:
 *
 *    static const char* const Bitfile = "C:\\" NiFpga_mainFPGA_Bitfile;
 */
#define NiFpga_mainFPGA_Bitfile "NiFpga_mainFPGA.lvbitx"

/**
 * The signature of the FPGA bitfile.
 */
static const char* const NiFpga_mainFPGA_Signature = "477A035645CD7EA71D26E0DECDCC159E";

typedef enum
{
   NiFpga_mainFPGA_IndicatorU8_debugControlRelays = 0x18006,
} NiFpga_mainFPGA_IndicatorU8;

typedef enum
{
   NiFpga_mainFPGA_IndicatorI16_ILC_Comm_Current = 0x1801E,
   NiFpga_mainFPGA_IndicatorI16_ILC_Comm_Voltage = 0x18022,
   NiFpga_mainFPGA_IndicatorI16_ILC_Motor_Current = 0x18016,
   NiFpga_mainFPGA_IndicatorI16_ILC_Motor_Voltage = 0x1801A,
} NiFpga_mainFPGA_IndicatorI16;

typedef enum
{
   NiFpga_mainFPGA_IndicatorU32_inputPort_U32 = 0x18010,
} NiFpga_mainFPGA_IndicatorU32;

typedef enum
{
   NiFpga_mainFPGA_ControlU8_controlRelays = 0x18002,
} NiFpga_mainFPGA_ControlU8;

typedef enum
{
   NiFpga_mainFPGA_TargetToHostFifoI16_FIFO_CommCurrent = 5,
   NiFpga_mainFPGA_TargetToHostFifoI16_FIFO_CommVoltage = 4,
   NiFpga_mainFPGA_TargetToHostFifoI16_FIFO_MotorCurrent = 2,
   NiFpga_mainFPGA_TargetToHostFifoI16_FIFO_MotorVoltage = 1,
} NiFpga_mainFPGA_TargetToHostFifoI16;

typedef enum
{
   NiFpga_mainFPGA_TargetToHostFifoU32_FIFO_FromFPGAInPort_U32 = 3,
} NiFpga_mainFPGA_TargetToHostFifoU32;

typedef enum
{
   NiFpga_mainFPGA_HostToTargetFifoU8_FIFO_ToFPGAOutPort_U8 = 0,
} NiFpga_mainFPGA_HostToTargetFifoU8;

#endif
