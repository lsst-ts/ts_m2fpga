# M2 Cell Controller Field Programmable Gate Arrays (FPGA) Code

## Overview

This project will improve the FPGA code in the [M2 Cell Controller LabVIEW project](https://github.com/lsst-ts/ts_mtm2_cell).
In that version, the VI named **4-port serial Master Slave.vi**, under `Chassis (cRIO-9038) >> FPGA Target (RIO0, cRIO-9038)` in the Project Explorer, interacts with the hardware inputs and outputs.

## Platform

- Windows 10
- LabVIEW 2018 SP1 32-bit
- cRIO-9038 (S/N: 01AD906F)

## Needed Package

- LabVIEW NI Device Drivers (DVD-Jan-19-1)
- LabVIEW 2018 FPGA Module
- LabVIEW 2018 SP1 CompactRIO Module 18.5 (Jan, 2019)
- LabVIEW 2018 FPGA Module Xilinx Compilation Tool for Vivado 2017.2 (optional, you can use the LabVIEW FPGA Compile Cloud Service)
- FPGA Interface C API 18.0

## NI Package Installation

1. There is the order of NI package installation.
The NI Device Drivers needs to be installed first, followed by Real-Time or FPGA module, and the CompactRIO module is the final one.
2. The details can follow: [Install NI Software for Your CompactRIO System](https://learn.ni.com/learn/article/getting-started-with-compactrio-hardware-and-labview).

## Directory Structure

```text
ts_m2fpga
├── src
│   ├── m2fpga.lvproj
│   ├── mainFPGA.vi
│   ├── support
│       ├── switchRelays.vi
│       ├── readDaq.vi
│       ├── ilcCommmunication.vi
│   ├── m2fpga_c
│       ├── NiFpga_mainFPGA.h
│       ├── NiFpga.c
│       ├── NiFpga.h
│       ├── NiFpga_mainFPGA.lvbitx
├── doc
│   ├── versionHistory.md
│   ├── switchRelays.md
│   ├── readDaq.md
│   ├── ilcCommmunication.md
│   ├── appendix.md
├── fpgaInterface
│   ├── bitfile
│       ├── .gitkeep
├── README.md
└── .gitignore
```

- `src`: contains the LabVIEW FPGA project.
- `doc`: documentation like `versionHistory.md`.
- `fpgaInterface`: in here are all files generated by the FPGA Interface C API.
- `fpgaInterface/bitfile`: contains the bitfile (.lvbitx).
The bitfile contains all the configuration information from the LabVIEW block diagram defining the internal logic and digital circuit of the FPGA and device-specific information from other files associated with the FPGA target.
When the FPGA application executes, the bitfile loads on the FPGA chip and reconfigures the gate array logic.
Follow [this link](https://knowledge.ni.com/KnowledgeArticleDetails?id=kA03q000000YHVTCA4&l=en-US) if you want to know more about the LabVIEW FPGA compilation process.

Header files will be inside of `fpgaInterface` directory, because they are related to the hardware and need to be part of version control.
However, the original `lvbitx` inside of `fpgaInterface/bitfile` directory will be no part of version control, because **NiFpga_mainFPGA.lvbitx** is a version of it and it is not necessary to duplicate files.

## FPGA Interface C API

The FPGA Interface C API enables C/C++ applications to interact directly with the compiled LabVIEW FPGA VI on real-time controllers, generating C functions calls to read from and write to named controls and indicators, perform Direct Memory Access (DMA) data transfers, and wait on and acknowledge interrupts.

The C API is generated from the LabView Project Exporer Window:
  Project -> RT CompactRIO Target -> Chassis -> FPGA Target -> mainFPGA.vi: right click and select Launch C API Generator
The API will like need the full paths for the bitfile and output directories (verify they match your system).

The following files are generated by the FPGA Interface C API:

- **NiFpga_mainFPGA.h:** C header file that contains all the constants required by function calls in your application.
- **NiFpga_mainFPGA.lvbitx:** version of the original `.lvbitx` bitfile created after the FPGA compilation, renamed to match the prefix of the constants in the `.h` header file.
- **NiFpga.h:** C header file.
It is identical for all generated C APIs.
It declares all the errors, types, constants, and functions needed to write an application.
Most of these functions are defined in `NiFpga.c`.
- **NiFpga.c:** C source file that you must include in your application.
It is identical for all generated C APIs.
It defines all the functions your application can call.
`NiFpga.c` loads and unloads the `NiFpga` library at runtime, and forwards function calls to that library.

The FPGA Interface C API Generator names files and constants based on the name of the FPGA VI from which the application bitfile was compiled, like this:

```
NiFpga_<FPGA_VI_name>.h
```

For instance, if the FPGA VI name is **mainFPGA.vi**, the header file will be named `NiFpga_mainFPGA.h`.

Follow this link with a [FPGA C API Demo](https://confluence.lsstcorp.org/display/LTS/FPGA+C+API+Interface+Demo).

## FPGA VIs

The main LabVIEW FPGA code will be named **mainFPGA.vi** and it will call three VIs running in parallel: (1) **switchRelays.vi**, (2) **readDaq.vi**, and (3) **ilcCommmunication.vi**.

### switchRelays VI

This VI will be in `src/` directory.
Follow [here](doc/switchRelays.md) for details.

### readDaq VI

This VI will be explained in this [JIRA ticket](https://jira.lsstcorp.org/browse/DM-35829).

### ilcCommunication VI

This VI will be explained in this [JIRA ticket](https://jira.lsstcorp.org/browse/DM-35830).

## Bitfile Deployment - WARNING

Developer has to be aware that everytime he/she executes the compiled source code into the CompactRIO, the `NiFpga_Open()` function opens a session to the FPGA and automatically downloads the bitfile to configure the circuitry of FPGA.
In the following [document](doc/bitfileDeployment.md) you will find different options to download the bitfile into the CompactRIO.

If Real-Time Processor has an executable (`.rtexe`) running as startup, and the new C/C++ executable wants to run, the developer will be warned that there is another application running, and he/she will need to **stop this executable first** in terms of running the new C/C++ executable.
This would be very dangerous if the first executable is running an important process.

To stop a running executable by NI user, you can do:

```bash
/etc/init.d/nilvrt stop
```

To run the executable if it is not running, you can  do the following if you do not want to reboot the machine:

```bash
/etc/init.d/nilvrt start
```

It is noted that the machine on summit is under the control of `puppet`.
If you want to reboot the machine, you would need to announce in the Slack channel and let IT knows if it is possible.
After the rebooting, the related switch in global interlock system (GIS) will be reset and the M2 will not be able to use (the interlock will cut-off the power of actuators).
You need to notify the people on summit to release the interlock of M2 before using it.

In addition, the developer should notify the user (such as the operator or hardware engineer or system engineer) before any test with C/C++ executable.
This is to remind the users on summit do not use the M2 at this test period.

For the M2 specific project, after you rerun the default executable, you would see a new log file with the current time at `/u/log`.
You should wait for 3 min to check the contents in the new log file to say all processes start successfully (the download of bitfile needs 60-90 seconds).
If not, notify the LabVIEW developer immediately to avoid the blocking of tests or operations on summit.
In addition, you also need to announce in the Slack channel to avoid any user to use the M2 before the problem is fixed.

## Running bin/m2fpga

bin/m2fpga is purely a demo/test program that will be removed once the required functionality has been put in the
ts_m2cellcpp project. It will be difficult to do so until the software is running with the hardware. bin/m2fpga allows
some testing with the FPGA. The software can be built on CentOS or similar systems and then scp the program to the target
cRIO device. Also use scp to copy the bitfile (src/m2fpga_c/NiFpga_mainFPGA.lvbitx) to the same director on the cRIO as the m2fpga executable.
