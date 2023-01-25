# Appendix

This document sumarizes the experiments done with the `daqFIFO` to understand the behavior of C API available functions to get elements from FIFO.

## Use the read() function

In this document, the data type of **U16** in FIFO is used as an example, and the related `read()` function is `NiFpga_ReadFifoU16()`.
The function can be a blocking call `(timeout = -1)` or non-blocking call `(timeout >= 0)`.
The unit of `timeout` is ms.
To simplify the possible edge cases, the case of `timeout > 0` is ignored in the following discussion.
Its behavior is straightforward based on the cases of `timeout = 0` and `timeout = -1`.

Assume you want to read 1 element and there is none in FIFO (length >= 2):

* (a) timeout = 0.
You will get the `timeout error -50400` immediately after calling the `NiFpga_ReadFifoU16()` function.
The list of error code is [here](https://www.ni.com/docs/en-US/bundle/fpga-interface-c-api-ref/page/capi/errors.html).
* (b) timeout = -1.
You will wait for the element forever.

Assume you want to read 1 element and there is 1 element in FIFO, no matter what the timeout value is, you will get the element.

Assume you want to read 2 elements and there is only 1 element in FIFO.

* (a) timeout = 0.
You will get the `timeout error -50400` immediately after calling the `NiFpga_ReadFifoU16()` function.
* (b) timeout = -1.
You will wait for the element forever.

## Use the acquire() function

In this example, the `NiFpga_AcquireFifoReadElementsU16()` is used.
As the `read()` function, the `acquire()` function can be blocking or non-blocking, which depends on the `timeout` argument.

Assume you want to acquire 1 element and there is none in FIFO.

* (a) timeout = 0.
You will get the `timeout error -50400` immediately after calling the `NiFpga_AcquireFifoReadElementsU16()` function.
* (b) timeout = -1.
You will wait for the element forever.

Assume you want to acquire 1 element and there is 1 element in FIFO, no matter what the timeout value is, you will get the element immediately.

Assume you want to acquire 2 elements and there is only 1 element in FIFO.

* (a) timeout = 0.
You will get the `timeout error -50400` immediately after calling the `NiFpga_AcquireFifoReadElementsU16()` function.
* (b) timeout = -1.
You will wait for the element forever.

## FIFO is full in the FPGA side

The maximum number of elements in FIFO might be different from the requested value.
For example, if you have the `Target-to-host DMA` FIFO with 5 `Requested Number of Elements`, the maximum number in FIFO will be 15 instead of 5.
Please see the followings for the details:

1. [General Page (FIFO Properties Dialog Box)](https://www.ni.com/docs/en-US/bundle/labview-fpga-module/page/lvfpgadialog/fifo_general_page.html)
2. [Implementing Block Memory FIFOs (FPGA Module)](https://www.ni.com/docs/en-US/bundle/labview-fpga-module/page/lvfpgaconcepts/fpga_fifo_block_mem_rest.html)

When adding the 16th element to a full FIFO (length = 15), the [Write FIFO Method](https://www.ni.com/docs/en-US/bundle/labview-fpga-module/page/lvfpga/fifo_write.html) will output a `True` value in the `Timed Out?` terminal, according to the timeout value:

* (a) timeout = 0.
The `Timed Out?` terminal will be `True` immediately.
The new element will not be written in.
* (b) timeout = -1.
The method will wait for available space forever.
