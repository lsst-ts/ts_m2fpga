# readDaq VI

This VI will read data from analog sensors and status of relays, using NI modules.
This data will be put into a first-in first-out (FIFO) data structure.
The name of this structure will be `daqFIFO`.

## DAQ FIFO

The `daqFiFO` is a data structure with an U16 data type defined, 9 elements to store, and configured as a `target-to-host DMA` FIFO, that means the elements will be written in the FPGA and read by the real-time processor.

It is declared as a typedef enum like this:

```c
{
   NiFpga_mainFPGA_TargetToHostFifoU16_daqFIFO = 0,
} NiFpga_mainFPGA_TargetToHostFifoU16;
```
## How to get elements from FIFO

The C API provides two functions to get elements from FIFO: (1) [NiFpga_ReadFifoU16()](https://www.ni.com/docs/en-US/bundle/fpga-interface-c-api-ref/page/capi/functions_fifo_read.html) and (2) [NiFpga_AcquireFifoReadElementsU16()](https://www.ni.com/docs/en-US/bundle/fpga-interface-c-api-ref/page/capi/functions_fifo_read_acquire.html).

### 1) NiFpga_ReadFifoU16() function

Here is an example to get elements from the `daqFIFO` using C/C++

```c 
uint16_t data[9] = {0};
size_t numberOfElements = 0;
uint32_t timeout = 0;
size_t elementsRemaining = 0;

NiFpga_ReadFifoU16(session, NiFpga_mainFPGA_TargetToHostFifoU16_daqFIFO, &data[0], numberOfElements, timeout, &elementsRemaining);
```

where:
- `session` handles a currently FPGA session
- `NiFpga_mainFPGA_TargetToHostFifoU16_daqFIFO` is the FIFO from which to read
- `data` outputs the data that was read as an array of elements.
The user will allocate the memory by himself/herself in this method.
- `numberOfElements` is the number of elements to read
- `timeout` specifies the time in milliseconds the function waits for available data in the FIFO, if the FIFO is empty
- `elementsRemaining` outputs the number of elements remaining in the host memory part of FIFO

Note:

- Session has to be oppened with:

```c
NiFpga_Session session;
```

- Session must be closed when no longer needed, with:

```c
NiFpga_Close(session, 0);
```

### 2) NiFpga_AcquireFifoReadElementsU16() function

Here is an example to get elements from the `daqFIFO` using C/C++

```c
uint16_t* pData = NULL;
size_t elementsRequested = 0;
uint32_t timeout = 0;
size_t elementsRemaining = 0;
size_t elementsAcquired = 0;

NiFpga_AcquireFifoReadElementsU16(session, NiFpga_mainFPGA_TargetToHostFifoU16_daqFIFO, &pData, elementsRequested, timeout, &elementsAcquired, &elementsRemaining);
```
where:
- `session` handles a currently FPGA session
- `NiFpga_mainFPGA_TargetToHostFifoU16_daqFIFO` is the FIFO from which to acquire
- `&pData` outputs a pointer to the elements acquired
- `elementsRequested` is the requested number of elements
- `timeout` specifies the time in milliseconds the function waits for available data in the FIFO, if the FIFO is empty
- `elementsAcquired` is the actual number of elements acquired
- `elementsRemaining` outputs the number of elements remaining in the host memory part of FIFO

Note that by using this function the user does not allocate memory of data.
Instead, the system will transfer the memory to the user.
Therefore, he/she needs to release acquired elements from FIFO.

## How to release elements from FIFO

The C API provides one function to release elements from FIFO [NiFpga_ReleaseFifoElements()](https://www.ni.com/docs/en-US/bundle/fpga-interface-c-api-ref/page/capi/functions_fifo_method.html).
Only need this if the user uses the NiFpga_AcquireFifoReadElementsU16() function above.

The NiFpga_AcquireFifoReadElementsU16() function will transfer FIFO’s memory to the user, and it is needed to release the elements from this memory region because it belongs to FIFO.
The NiFpga_ReleaseFifoElements() function “releases previously acquired FIFO elements” according to the NiFpga_ReleaseFifoElements() [function description](https://www.ni.com/docs/en-US/bundle/fpga-interface-c-api-ref/page/capi/functions_fifo_method.html), and it says that “the host must release elements after acquiring them”.

You are not supposed to use the NiFpga_ReleaseFifoElements()] function after the NiFpga_ReadFifoU16() function, because the NiFpga_ReadFifoU16() function allocates memory region by the user, therefore, the elements will not be in the FIFO’s memory when the NiFpga_ReleaseFifoElements() function tries to release those elements.
If this is done, you will get the [error -61073](https://www.ni.com/docs/en-US/bundle/fpga-interface-c-api-ref/page/capi/errors.html).

Here is an example to release elements from the `daqFIFO` using C/C++

```c 
size_t elements = 0;

NiFpga_ReleaseFifoElements(session, NiFpga_mainFPGA_TargetToHostFifoU16_daqFIFO, elements);
```

where:
- `session` handles a currently FPGA session
- `NiFpga_mainFPGA_TargetToHostFifoU16_daqFIFO` is the FIFO from which to release
- `elements` is the number of elements to release

## FIFO is full in the FPGA side

The maximum number of elements the `Target-to-host DMA` FIFO can hold is `2^M - 1`, where M = 16 (address width).
For example, if you want to transfer 5 elements using the FIFO, you are still able to add 10 elements more before FIFO is full (assuming there is no reader).
This is because the maximun number of elements is 15 (2^16 - 1).
If you want to transfer 23 elements using FIFO, the maximun number of elements now is 31, because LabVIEW coerces the maximun number of elements to the clossest one less than a power of two value.

The [Write FIFO Method](https://www.ni.com/docs/en-US/bundle/labview-fpga-module/page/lvfpga/fifo_write.html) provides you the `Timed Out?` terminal.
This is helpfull to know whether the FIFO is full or not.

Continuing with the first example, if you want to transfer 5 elements, after adding the 16th element to FIFO, the `Timed Out?` terminal will be True.
This `Timed Out?` terminal will be wired to the `daqFifoFull` indicator.

## daqFifoFull indicator

The `daqFifoFull` is a boolean indicator.
If `daqFifo` is full, `daqFifoFull` will be True and data is not written to the FIFO until space becomes available.

The C/C++ developer needs to take actions to avoid FIFO being full and losing data.
If the overflow happens, the FPGA side should provide a way (TBD) to compensate this.
This is not part of this document, since we are just trying to organize the results here instead of design.

The `daqFifoFull` is declared as a typedef enum like this:

```c
{
   NiFpga_mainFPGA_IndicatorBool_daqFifoFull = 0x1801E,
} NiFpga_mainFPGA_IndicatorBool;
```

Do not care about the 0x1801E value.
It is created after the FPGA compilation.

Here is an example how to read a value in this indicator using C/C++:

```c 
NiFpga_Bool fifoStatus = 0;

NiFpga_ReadBool(session, NiFpga_mainFPGA_IndicatorBool_daqFifoFull, &fifoStatus);
```

where `session` handles a currently FPGA session.

The behavior of the above functions is based on the experiments done in the [appendix](appendix.md). 