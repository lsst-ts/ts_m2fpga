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
static const char* const NiFpga_mainFPGA_Signature = "7957F9F7BCC5197F4E7942B697839512";

typedef enum
{
   NiFpga_mainFPGA_IndicatorBool_dataFifoFull = 0x1801E,
} NiFpga_mainFPGA_IndicatorBool;

typedef enum
{
   NiFpga_mainFPGA_IndicatorU8_debugControlRelays = 0x18006,
} NiFpga_mainFPGA_IndicatorU8;

typedef enum
{
   NiFpga_mainFPGA_ControlBool_enableCapture = 0x18016,
   NiFpga_mainFPGA_ControlBool_simulationMode = 0x1801A,
} NiFpga_mainFPGA_ControlBool;

typedef enum
{
   NiFpga_mainFPGA_ControlU8_controlRelays = 0x18002,
} NiFpga_mainFPGA_ControlU8;

typedef enum
{
   NiFpga_mainFPGA_ControlU32_loopRate_us = 0x18010,
} NiFpga_mainFPGA_ControlU32;

typedef enum
{
   NiFpga_mainFPGA_TargetToHostFifoU16_daqFIFO = 0,
} NiFpga_mainFPGA_TargetToHostFifoU16;

#endif
