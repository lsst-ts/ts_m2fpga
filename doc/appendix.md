# Appendix

This document sumarizes the experiments done with the `daqFIFO` to understand the behavior of C API available functions to get elements from FIFO.

## Using the NiFpga_ReadFifoU16() function

If you want to read 1 element and there is no element in FIFO:
* (a) timeout = 0.
You will get the [timeout error -50400](https://www.ni.com/docs/en-US/bundle/fpga-interface-c-api-ref/page/capi/errors.html) immediately after calling the NiFpga_ReadFifoU16() function.
* (b) timeout = -1.
You will wait for the element forever.

If you want to read 1 element and there is 1 element in FIFO.
No matter what the timeout value is, you will get the element.

If you want to read 2 elements and there is only 1 element in FIFO.
* (a) timeout = 0.
You will get the timeout error -50400 immediately after calling the NiFpga_ReadFifoU16() function.
* (b) timeout = -1.
You will wait for the element forever.

## Using the NiFpga_AcquireFifoReadElementsU16() function

If you want to acquire 1 element and there is no element in FIFO.
* (a) timeout = 0.
You will get the timeout error -50400 immediately after calling the NiFpga_AcquireFifoReadElementsU16() function.
* (b) timeout = -1.
You will wait for the element forever.

If you want to acquire 1 element and there is 1 element in FIFO.
No matter what the timeout value is, you will get the element.

If you want to acquire 2 elements and there is only 1 element in FIFO.
* (a) timeout = 0.
You will get the timeout error -50400 immediately after calling the NiFpga_AcquireFifoReadElementsU16() function.
* (b) timeout = -1.
You will wait for the element forever.

## FIFO is full in the FPGA side

If you have the `Target-to-host DMA` FIFO with 5 elements as the `Requested Number of Elements`, the maximum number of elements the FIFO can hold will be 15.
After adding the 16th element to FIFO, the [Write FIFO Method](https://www.ni.com/docs/en-US/bundle/labview-fpga-module/page/lvfpga/fifo_write.html) will output a `True` value in the `Timed Out?` terminal, according to the timeout value:
* (a) timeout = 0.
The `Timed Out?` terminal will be `True` immediately.
* (b) timeout = -1.
The method will wait for available space forever.
