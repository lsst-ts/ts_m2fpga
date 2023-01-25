# readDaq VI

This VI will read data from analog sensors and relay status.
The data will be put into a first-in first-out (FIFO) data structure.
The FIFO name is `daqFIFO`.

## DAQ FIFO

The `daqFiFO` is a `target-to-host DMA` FIFO, which means the element will be written in the target's FPGA and read by the host's real-time processor.
The data type is **U16**.
At each iteration, there will be 9 elements to be written theoretically by a `for` loop (if there is no overflow happens).

The `daqFiFO` is declared as an enum field:

```c
{
   NiFpga_mainFPGA_TargetToHostFifoU16_daqFIFO = 0,
} NiFpga_mainFPGA_TargetToHostFifoU16;
```

## How to get elements from FIFO

The C API provides two functions to get elements from FIFO: (1) [NiFpga_ReadFifoU16()](https://www.ni.com/docs/en-US/bundle/fpga-interface-c-api-ref/page/capi/functions_fifo_read.html) and (2) [NiFpga_AcquireFifoReadElementsU16()](https://www.ni.com/docs/en-US/bundle/fpga-interface-c-api-ref/page/capi/functions_fifo_read_acquire.html).
The behavior of these functions is based on the experiments done in the [appendix](appendix.md).

### 1) NiFpga_ReadFifoU16() function

Here is an example to get elements from `daqFIFO`:

```c
uint16_t data[9] = {0};
size_t numberOfElements = 9;
uint32_t timeout = 0;
size_t elementsRemaining;
NiFpga_Status errorCode;

errorCode = NiFpga_ReadFifoU16(session, NiFpga_mainFPGA_TargetToHostFifoU16_daqFIFO, &data[0], numberOfElements, timeout, &elementsRemaining);
```

where:

- `session` handles a currently FPGA session.
- `NiFpga_mainFPGA_TargetToHostFifoU16_daqFIFO` is the FIFO from which to read.
- `data` outputs the data that was read as an array of elements.
You will need to allocate the memory by yourself when using this method.
- `numberOfElements` is the number of elements to read.
- `timeout` specifies the time in milliseconds the function waits for available data in the FIFO, if the FIFO is empty.
- `elementsRemaining` outputs the number of elements remaining in the real-time target memory part of FIFO.

Note:

- Session has to be opened with:

```c
NiFpga_Session session;
```

- Session must be closed when no longer needed, with:

```c
NiFpga_Close(session, 0);
```

### 2) NiFpga_AcquireFifoReadElementsU16() function

Here is an example to acquire elements from `daqFIFO`:

```c
uint16_t* pData = NULL;
size_t elementsRequested = 9;
uint32_t timeout = 0;
size_t elementsRemaining;
size_t elementsAcquired;
NiFpga_Status errorCode;

errorCode = NiFpga_AcquireFifoReadElementsU16(session, NiFpga_mainFPGA_TargetToHostFifoU16_daqFIFO, &pData, elementsRequested, timeout, &elementsAcquired, &elementsRemaining);
```

where:

- `session` handles a currently FPGA session.
- `NiFpga_mainFPGA_TargetToHostFifoU16_daqFIFO` is the FIFO from which to acquire.
- `&pData` outputs a pointer to the elements acquired.
- `elementsRequested` is the requested number of elements.
- `timeout` specifies the time in milliseconds the function waits for available data in the FIFO, if the FIFO is empty.
- `elementsAcquired` is the actual number of elements acquired.
- `elementsRemaining` outputs the number of elements remaining in the real-time target memory part of FIFO.

You do not need to allocate the memory of data when using this function.
Instead, the system will transfer the memory block to you.
Therefore, you need to release the acquired memory to let the system can re-allocate the memory.

## How to release elements from FIFO

The C API provides one function to release elements from FIFO [NiFpga_ReleaseFifoElements()](https://www.ni.com/docs/en-US/bundle/fpga-interface-c-api-ref/page/capi/functions_fifo_method.html).
Only call this function if you use the `NiFpga_AcquireFifoReadElementsU16()` function above.

Here is an example to release elements from `daqFIFO`:

```c
size_t elements = 9;
NiFpga_Status errorCode;

errorCode = NiFpga_ReleaseFifoElements(session, NiFpga_mainFPGA_TargetToHostFifoU16_daqFIFO, elements);
```

where:

- `session` handles a currently FPGA session.
- `NiFpga_mainFPGA_TargetToHostFifoU16_daqFIFO` is the FIFO from which to release.
- `elements` is the number of elements to release.

## daqFifoFull indicator

The `daqFifoFull` is a boolean indicator.
If `daqFifo` is full, `daqFifoFull` will be True and data is not written to the FIFO until space becomes available.

You need to take actions to avoid FIFO being full and losing data.
If the overflow happens, the FPGA side should provide a way to compensate this.
The details is TBD.

The `daqFifoFull` is declared as an enum field:

```c
{
   NiFpga_mainFPGA_IndicatorBool_daqFifoFull = 0x1801E,
} NiFpga_mainFPGA_IndicatorBool;
```

Do not care about the 0x1801E value.
It is created after the FPGA compilation.

Here is an example how to read a value in this indicator:

```c
NiFpga_Bool fifoStatus = 0;
NiFpga_Status errorCode;

errorCode = NiFpga_ReadBool(session, NiFpga_mainFPGA_IndicatorBool_daqFifoFull, &fifoStatus);
```

where `session` handles a currently FPGA session.
