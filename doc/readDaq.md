# readDaq VI

This VI will read data from analog sensors and status of relays, using NI modules.
This data will be put into a data structure that holds elements in the order they are received and provides access to those elements using a first-in, first-out (FIFO) basis, and will be named `daqFIFO`.

This VI will have a control named `loopRateInUs`, a control named `enableCapture`, and an indicator named `dataFifoFull`.

## Enable Capture

The `enableCapture` is a boolean control.
When this control is TRUE the read data is put into the `daqFIFO`, so the Real-Time processor will receive the acquired data.
When is FALSE, the read data is not, so the Real-Time processor will not receive the acquired data.
C/C++ developer must initialize to FALSE this control during the FPGA initialization.

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

### FIFO Elements Description

The following table describes the meaning of each element in the `daqFifo`.

| Element |  Name  |  Data Type   | Description |
|:---:|:-----:|:-----:|:-----:| 
|1| ilcMotorCurrent | FXP | Motor Power Supply Current Sense (Mod2/AI0) |
|2| ilcCommCurrent | FXP | Communication Power Supply Current Sense (Mod2/AI1)|
|3| ilcMotorVoltage | FXP | Motor Power Supply Voltage Sense (Mod3/AI0)|
|4| ilcCommVoltage | FXP | Communication Power Supply Voltage Sense (Mod3/AI1)|
|5| Mod4/CH7:0| U8 | Power supplies and cRIO interlock relays status monitoring |
|6| Mod5/DI7:0 | U8 | Digital Inputs 7 to 0 |
|7| Mod5/DI15:8 | U8 | Digital Inputs 15 to 8 |
|8| Mod5/DI23:16 | U8 | Digital Inputs 23 to 16 |
|9| Mod5/DI31:24 | U8 | Digital Inputs 31 to 24 |

### Element 1 of FIFO

This is the current measurement for the actuator motor power supply.

### Element 2 of FIFO

This is the current measurement for the communication power supply.

### Element 3 of FIFO

This is the voltage measurement for the actuator motor power supply.

### Element 4 of FIFO

This is the voltage measurement for the communication power supply.

### Element 5 of FIFO

This element contains the status of relays that switch power supplies and cRIO interlocks.
The bit description in in the `switchRelay` file, so click [here](./switchRelays.md#control-bit-description) to see the details.

### Element 6 of FIFO

Digital inputs.

| Bit7 | Bit6 | Bit5 | Bit4 | Bit3 | Bit2 | Bit1 | Bit0 | 
|:---:|:-----:|:-----:|:-----:|:-----:|:-----:|:-----:|:-----:|
|  CB2_DR2  | CB1_DR2 | I_In_PS#1 | I_In_PS#2 | PS#1_14 | PS#2_14 | RED_MOD_23 | RED_MOD_13 | 

- CB2_DR2: Connector Block 2 in DIN Rail 2 (no more info about this).
- CB1_DR2: Connector Block 1 in DIN Rail 2 (no more info about this).
- I_In_PS#1: (explain).
- I_In_PS#2: (explain).
- PS#1_14: Power Supply 1 input 14.
- PS#2_14: Power Supply 2 input 14.
- RED_MOD_23: Redundancy Module input 23.
- RED_MOD_13: Redundancy Module input 13.

### Element 7 of FIFO

Digital inputs.

| Bit15 | Bit14 | Bit13 | Bit12 | Bit11 | Bit10 | Bit9 | Bit8 | 
|:---:|:-----:|:-----:|:-----:|:-----:|:-----:|:-----:|:-----:|
|  CB10 | CB9 | CB8 | CB7 | CB6 | CB5 | CB4 | CB3

- CB10: (no more info).
- CB9: (no more info).
- CB8: (no more info).
- CB7: (no more info).
- CB6: (no more info).
- CB5: (no more info).
- CB4: (no more info).
- CB3: (no more info).

### Element 8 of FIFO

### Element 9 of FIFO

