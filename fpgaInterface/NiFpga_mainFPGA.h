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
static const char* const NiFpga_mainFPGA_Signature = "0BF68F2C7F3E55E38FD1E21FFD07C8E7";

typedef enum
{
   NiFpga_mainFPGA_IndicatorBool_dataFifoFull = 0x18002,
} NiFpga_mainFPGA_IndicatorBool;

typedef enum
{
   NiFpga_mainFPGA_ControlU32_waitInMs = 0x18004,
} NiFpga_mainFPGA_ControlU32;

typedef enum
{
   NiFpga_mainFPGA_IndicatorArrayU16_data = 0x18008,
} NiFpga_mainFPGA_IndicatorArrayU16;

typedef enum
{
   NiFpga_mainFPGA_IndicatorArrayU16Size_data = 9,
} NiFpga_mainFPGA_IndicatorArrayU16Size;

typedef enum
{
   NiFpga_mainFPGA_TargetToHostFifoU16_daqFIFO = 0,
} NiFpga_mainFPGA_TargetToHostFifoU16;

#endif
