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
static const char* const NiFpga_mainFPGA_Signature = "71DD216B20A51141B5904E85717796DE";

typedef enum
{
   NiFpga_mainFPGA_IndicatorBool_FIFO_A_TimedOut = 0x18022,
   NiFpga_mainFPGA_IndicatorBool_FIFO_B_TimedOut = 0x18026,
   NiFpga_mainFPGA_IndicatorBool_ILC_CommPowerOnLB = 0x1801E,
   NiFpga_mainFPGA_IndicatorBool_ILC_MotorPowerOnLB = 0x1801A,
   NiFpga_mainFPGA_IndicatorBool_U8_FIFO_TimedOut = 0x1802A,
} NiFpga_mainFPGA_IndicatorBool;

typedef enum
{
   NiFpga_mainFPGA_IndicatorU8_debugControlRelays = 0x18006,
} NiFpga_mainFPGA_IndicatorU8;

typedef enum
{
   NiFpga_mainFPGA_ControlBool_ILC_CommPowerOn = 0x18016,
   NiFpga_mainFPGA_ControlBool_ILC_MotorPowerOn = 0x18012,
} NiFpga_mainFPGA_ControlBool;

typedef enum
{
   NiFpga_mainFPGA_ControlU8_controlRelays = 0x18002,
} NiFpga_mainFPGA_ControlU8;

typedef enum
{
   NiFpga_mainFPGA_TargetToHostFifoU8_U8_FIFO = 0,
} NiFpga_mainFPGA_TargetToHostFifoU8;

typedef enum
{
   NiFpga_mainFPGA_TargetToHostFifoI16_FIFO_B = 1,
} NiFpga_mainFPGA_TargetToHostFifoI16;

typedef enum
{
   NiFpga_mainFPGA_HostToTargetFifoI16_FIFO_A = 2,
} NiFpga_mainFPGA_HostToTargetFifoI16;

#endif