# readDaq VI

This VI will read data from analog sensors and status of relays, using NI modules.
This data will be put into a data structure that holds elements in the order they are received and provides access to those elements using a first-in, first-out (FIFO) basis, and will be named `daqFIFO`.

This VI will have an indicator named `dataFifoFull`.

## DAQ FIFO

The `daqFiFO` is a data structure with an U16 data type defined, 9 elements to store, and configured as a `target-to-host DMA` FIFO, that means the elements will be written in the FPGA target and read by the real-time processor (host).

It is declared as a typedef enum like this:

```c
{
   NiFpga_mainFPGA_TargetToHostFifoU16_daqFIFO = 0,
} NiFpga_mainFPGA_TargetToHostFifoU16;
```

Here is an example to read from the `daqFIFO` using C/C++, where the parameter `session` handles a currently FPGA session, `NiFpga_mainFPGA_TargetToHostFifoU16`  is the FIFO from which to read, `data` outputs the data that was read as an array of elements, `numberOfElements` is the number of elements to read, `timeout` specifies the time in miliseconds the function waits for available data in the FIFO if the FIFO is empty, and `elementsRemaining` outputs the number of elements remaining in the host memory part of the FIFO.

A value of `0` in `timeout` indicates that the function does not wait for available data.
If use `NiFpga_InfiniteTimeout` it waits forever for available data. 

```c 
/* Declare the variables */
uint16_t data[9] ={0}; // if you want to put 9 elements into the array
size_t numberOfElements = 9;
uint32_t timeout = 0;
size_t elementsRemaining = 0;

NiFpga_ReadFifoU16(session, NiFpga_mainFPGA_TargetToHostFifoU16, &data[0], numberOfElements, timeout, &elementsRemaining);
```

## Data FIFO Full Indicator

The `dataFifoFull` is a boolean indicator.
If it is TRUE the `daqFIFO` is full and data is not written to the FIFO until space becomes available.
The following data that is trying to write into the FIFO will be lost until there is new space available. 
The C/C++ developer can use this to determine if the code reads data slower than the FPGA adds elements into the FIFO, then make a decision.

It is declared as a typedef enum like this:

```c
{
   NiFpga_mainFPGA_IndicatorBool_dataFifoFull = 0x1801E,
} NiFpga_mainFPGA_IndicatorBool;
```

Do not care about the 0x1801E value.
It is created after the FPGA compilation.

Here is an example how to read a value in this control using C/C++:

```c 
/* Declare the variable */
NiFpga_Bool fifoStatus = 0;

NiFpga_ReadBool(session, NiFpga_mainFPGA_IndicatorBool_dataFifoFull, &fifoStatus);
```

where `session` handles a currently FPGA session, opened with:

```c
NiFpga_Session session;
```

Session must be closed when no longer needed.
