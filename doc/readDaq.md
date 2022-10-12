# readDaq VI

This VI will read data from analog sensors and status of relays, using NI modules.
This data will be put into a data structure that holds elements in the order they are received and provides access to those elements using a first-in, first-out (FIFO) basis, and will be named `daqFIFO`.

This VI will have a control named `loopRate_us`, a control named `enableCapture`, and an indicator named `dataFifoFull`.

## Loop Rate

The `loopRate_us` is an 32-bit unsigned (U32) integer control that controls the acquisition rate.
The unit of this control is micro seconds.
If this control is set to zero, the slower NI module will set the acquisition rate, for instance the NI-9201 will scan all channels every 2 micro seconds.

This control is declared as a typedef enum like this:

```c
{
   NiFpga_mainFPGA_ControlU32_loopRate_us = 0x18010,
} NiFpga_mainFPGA_ControlU32;
```

Do not care about the 0x18010 value.
It is created after the FPGA compilation.

Here is an example how to write a value in this control using C/C++:

```c 
NiFpga_WriteU32(session, NiFpga_mainFPGA_ControlU32_loopRate_us, 0);
```

where `session` handles a currently FPGA session, opened with:

```c
NiFpga_Session session;
```

and `0` is the `uint32_t` value written to the control.

Session must be closed when no longer needed.

## Enable Capture

The `enableCapture` is a boolean control.
When this control is TRUE the read data is put into the `daqFIFO`.
When is FALSE, the read data is not.
It is declared as a typedef enum like this:

```c
{
   NiFpga_mainFPGA_ControlBool_enableCapture = 0x18016,
} NiFpga_mainFPGA_ControlBool;
```

Do not care about the 0x18016 value.
It is created after the FPGA compilation.

Here is an example how to write a value in this control using C/C++:

```c 
NiFpga_WriteBool(session, NiFpga_mainFPGA_ControlBool_enableCapture, 0);
```

where `session` handles a currently FPGA session, opened with:

```c
NiFpga_Session session;
```

and `0` is the value written to the control meaning FALSE.
If you write `1` it will set the value TRUE.

Session must be closed when no longer needed.

## Data FIFO Full

The `dataFifoFull` is a boolean indicator.
If it is TRUE the FIFO is full and data is not written to the FIFO until space becomes available.
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
NiFpga_Bool fifoStatus = NiFpga_False; /* Declare the variable */
NiFpga_ReadBool(session, NiFpga_mainFPGA_IndicatorBool_dataFifoFull, &fifoStatus);
```

where `session` handles a currently FPGA session, opened with:

```c
NiFpga_Session session;
```

Session must be closed when no longer needed.

## DAQ FIFO

The `daqFiFO` is a data structure with an U16 data type defined, 255 elements to store, and configured as a `target-to-host DMA` FIFO.
This data structure will store the data read by NI modules and it can be read by the Real-Time processor.
It is declared as a typedef enum like this:

```c
{
   NiFpga_mainFPGA_TargetToHostFifoU16_daqFIFO = 0,
} NiFpga_mainFPGA_TargetToHostFifoU16;
```

Here is an example to read from the `daqFIFO` using C/C++.
The parameter `data` is provided as a pointer to the location to store the data.
The number of points to return from the FIFO read is specified by `numberOfElements`.
The `timeout` specifies the number of clock ticks the function waits for available data in the FIFO if the FIFO is empty.
A value of `0` indicates that the function does not wait.

```c 
/* Declare the variables */
uint16_t data = 0;
size_t numberOfElements = 255;
uint32_t timeout = 0;
size_t value = 0; 
NiFpga_ReadFifoU16(session, NiFpga_mainFPGA_TargetToHostFifoU16, data, numberOfElements, timeout, &value);
```

where `session` handles a currently FPGA session, opened with:

```c
NiFpga_Session session;
```

Session must be closed when no longer needed.
