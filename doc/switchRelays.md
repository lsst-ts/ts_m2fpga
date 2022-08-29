# switchRelays VI

This VI will interact with the cRIO outputs, driving 24 Volts relays.
It has a control named `controlRelays` and an indicator named `debugControlRelays` as an interface.

## Control Relays

The `controlRelays` is an 8-bit unsigned (U8) interger control.
It is declared as a typedef enum like this:

```c
{
   NiFpga_mainFPGA_ControlU8_controlRelays = 0x18002,
} NiFpga_mainFPGA_ControlU8;
```

Do not care about the 0x18002 value.
It is created after the FPGA compilation.

Here is an example how to write a value in this control using C/C++:

```c 
NiFpga_WriteU8(session, NiFpga_mainFPGA_ControlU8_controlRelays, 0);
```

where `session` handles a currently FPGA session, opened with:

```c
NiFpga_Session session;
```

and `0` is the `uint8_t` value written to the control.

Session must be closed when no longer needed.

## Control Bit Description

The following table describes the meaning of each bit in the `controlRelay` control.

| Bit |  0  |  1   |
|:---:|:-----:|:-----:|
|  0  | ILC Motor Power is Off | ILC Motor Power is On |
|  1  | ILC Communication Power is Off  | ILC Communication is On |
|  2  | Disable cRIO Interlock | Enable cRIO Interlock |
|  3  | Default value of Reset Power Motor Breakers | Reset Power Motor Breakers |
|  4  | Default value of Reset Communication Power Breakers | Reset Communication Power Breakers |
|  5  | Simulation Mode Off | Simulation Mode On |
|  6  | Spare | Spare |
|  7  | Spare | Spare |

where `ILC` stands for inner loop controller.

After putting bits 3 and 4 to be 1 is necessary put them back to 0 in the next functional call, to avoid power motor and communication power breakers continuing to reset.

Bit 5 allows setting the `Simulation Mode`.
This mode will allow FPGA code to interact with simulated sensors data when bit 5 is On, and with real sensors data when bit 5 is Off.

## Control Relay Debugging

 The `debugControlRelays` is an 8-bit unsigned (U8) integer indicator used to check the input values written in the `controlRelay` are really read by the FPGA code. It is declared as a typedef enum like this:

```c
{
   NiFpga_mainFPGA_IndicatorU8_debugControlRelays = 0x18006,
} NiFpga_mainFPGA_IndicatorU8;
```

Do not care about the 0x18006 value.
It is created after the FPGA compilation.

Here is an example how to read a value in the indicator using C/C++:

```c 
uint8_t value = 0; /* Declare the value variable */
NiFpga_ReadU8(session, NiFpga_mainFPGA_IndicatorU8_debugControlRelays, &value);
```

where `session` handles a currently session FPGA, opened with:

```c
NiFpga_Session session;
```

and `value` outputs what was read.
Its type is `uint8_t`.

Session must be closed when no longer needed.

The FPGA code will decode the `controlRelay` integer value from C/C++ interface, override the previous input (if any), and transmit to the hardware directly.
This implies the C/C++ developer needs to track the previous input actively.
The `debugControlRelays` can be used to check the current value in FPGA for the debugging purpose.
