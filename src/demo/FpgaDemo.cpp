/*
 *  This file is part of LSST M2 support system package.
 *
 * This product includes software developed by the
 * LSST Project (http://www.lsst.org/).
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the LSST License Statement and
 * the GNU General Public License along with this program.  If not,
 * see <http://www.lsstcorp.org/LegalNotices/>.
 */

// Class header
#include "demo/FpgaDemo.h"

// System headers
#include <iostream>
#include <thread>
#include <unistd.h>

// Project headers
#include "m2fpga_c/NiFpga_mainFPGA.h"

using namespace std;
namespace LSST {

int FpgaDemo::run() {
    cout << "Initializing...\n";
    NiFpga_Status status = NiFpga_Initialize();
    if (NiFpga_IsNotError(status)) {
        NiFpga_Session session;
        // opens a session, downloads the bitstream, and runs the FPGA
        cout << "Opening a session...\n";
        // TODO: NiFpga_FPGA_VI_Bitfile probably needs to be prepended with a path
        string cwd = get_current_dir_name();
        string bitfile = cwd + "/" + NiFpga_mainFPGA_Bitfile;
        //&&&string bitfile = cwd + "/" + "m2fpga_FPGATarget2_mainFPGA_QMvIodQP5L8.lvbitx";
        cout << "opening " << bitfile << endl;
        NiFpga_MergeStatus(&status, NiFpga_Open(bitfile.c_str(), NiFpga_mainFPGA_Signature, "RIO0",
                                                NiFpga_OpenAttribute_NoRun, &session));
        cout << "NiFpga_MergeStatus complete status=" << status << endl;
        if (NiFpga_IsNotError(status)) {
            // run the FPGA application
            cout << "Running the FPGA...\n";
            NiFpga_MergeStatus(&status, NiFpga_Run(session, 0));

            cout << "loop start" << endl;
            NiFpga_Bool ilcMotorPowerOn = 0; // &&& doc
            uint8_t ilcCommPowerOn = 5; // &&& doc
            uint32_t inputPortReadU32 = 0; // &&& doc
            uint8_t outputPortLBReadU8 = 0; // &&& doc

            const int SIZE = 10; // &&& doc
            uint8_t inputSwitches[SIZE]; /// input fromm FPGA switches
            int16_t output[SIZE] = {0}; /// output to FPGA FIFO_A  TODO:Remove once testing is done
            int16_t input[SIZE];  /// input from FPGA FIFO_B  TODO:Remove once testing is done

            uint8_t outputPort[SIZE]; /// ouput to FPGA DO_DAQ
            uint32_t inputPort[SIZE]; /// input from FPGA DI_DAQ

            // Put something identifiable in the output buffer
            for (int j=1; j < SIZE; ++j) {
                output[j] = output[j-1] + 1;
            }

            // Set the output source, indicator of FIFO
            NiFpga_Bool outputSourceControl = NiFpga_True;
            NiFpga_MergeStatus(&status, NiFpga_WriteBool(session, NiFpga_mainFPGA_ControlBool_useOutputControl, outputSourceControl));

            uint8_t outputPortWriteVal = 0;
            while (_loop) {
                // Write a value to the outputPort
                NiFpga_MergeStatus(&status, NiFpga_WriteBool(session, NiFpga_mainFPGA_ControlU8_outputPort_U8, outputPortWriteVal));
                ++outputPortWriteVal;

                // read boolean indicators ILCMotorPowerOn
                NiFpga_MergeStatus(&status, NiFpga_ReadBool(session, NiFpga_mainFPGA_IndicatorBool_ILC_MotorPowerOnLB,
                                                            &ilcMotorPowerOn));
                NiFpga_MergeStatus(&status, NiFpga_ReadBool(session, NiFpga_mainFPGA_IndicatorBool_ILC_CommPowerOnLB,
                                                            &ilcCommPowerOn));

                // read uint8 indicators
                NiFpga_MergeStatus(&status, NiFpga_ReadU8(session, NiFpga_mainFPGA_IndicatorU8_outputPort_U8_LB,
                                                            &outputPortLBReadU8));

                // read uint32 indicators
                NiFpga_MergeStatus(&status, NiFpga_ReadU32(session, NiFpga_mainFPGA_IndicatorU32_inputPort_U32,
                                                            &inputPortReadU32));

                int opw = outputPortWriteVal;
                int oplb = outputPortLBReadU8;
                cout << "ilcMotorPowerOn=" << ((ilcMotorPowerOn) ? "t" : "f") << " " << hex << (int)ilcMotorPowerOn;
                cout << " ilcCommPowerOn=" << ((ilcCommPowerOn) ? "t" : "f") << " " << hex << (int)ilcCommPowerOn << endl;
                cout << "outputPortWrite=" << dec << opw << " outputLB=" << oplb << " inputPortRead=" << inputPortReadU32 << endl;

                // copy FIFO data from the FPGA that's connected to the switches.
                int sz = 1;
                NiFpga_MergeStatus(
                        &status, NiFpga_ReadFifoU8(session, NiFpga_mainFPGA_TargetToHostFifoU8_U8_FIFO, inputSwitches,
                                                    sz, NiFpga_InfiniteTimeout, NULL));

                // copy ouput port information to FPGA
                NiFpga_MergeStatus(&status,
                                   NiFpga_WriteFifoU8(session, NiFpga_mainFPGA_HostToTargetFifoU8_FIFO_ToFPGA_U8,
                                                       outputPort, 1, NiFpga_InfiniteTimeout, NULL));

                // copy FIFO data from FIFO_FromFPGA_U32
                NiFpga_MergeStatus(&status,
                                    NiFpga_ReadFifoU32(session,  NiFpga_mainFPGA_TargetToHostFifoU32_FIFO_FromFPGA_U32, inputPort,
                                                    1, NiFpga_InfiniteTimeout, NULL));

                string str("switches=");
                for (int j = 0; j < sz; ++j) {
                    str += to_string(inputSwitches[j]) + " ";
                }
                cout << str << endl;

                // copy FIFO data to FPGA FIFO_A
                NiFpga_MergeStatus(&status,
                                   NiFpga_WriteFifoI16(session, NiFpga_mainFPGA_HostToTargetFifoI16_FIFO_A,
                                                       output, SIZE, NiFpga_InfiniteTimeout, NULL));

                // copy FIFO data from the FPGA FIFO_B
                NiFpga_MergeStatus(&status,
                                    NiFpga_ReadFifoI16(session, NiFpga_mainFPGA_TargetToHostFifoI16_FIFO_B, input,
                                                    SIZE, NiFpga_InfiniteTimeout, NULL));

                str = " input=";
                for (int j = 0; j < SIZE; ++j) {
                    str += to_string(input[j]) + " ";
                }
                cout << str << endl;

                str = "output=";
                for (int j = 0; j < SIZE; ++j) {
                    str += to_string(output[j]) + " ";
                }
                cout << str << endl;

                // Change the output for the next loop
                output[0] = output[SIZE - 1];
                if (output[0] > 20000) output[0] = -20000;
                for (int j=1; j < SIZE; ++j) {
                    output[j] = output[j-1] + 1;
                }

                this_thread::sleep_for(100ms);
            }

            /* TODO: There's no stop control in this FPGA VI. Maybe one should be added.
            cout << "Stopping the FPGA...\n";
            NiFpga_MergeStatus(&status,
                               NiFpga_WriteBool(session, NiFpga_ExampleCompactRIO_ControlBool_Stop, 1));
            */
            // close the session now that we're done
            cout << "Closing the session...\n";
            NiFpga_MergeStatus(&status, NiFpga_Close(session, 0));
        }
        // must be called after all other calls
        cout << "Finalizing...\n";
        NiFpga_MergeStatus(&status, NiFpga_Finalize());
    }
    // check if anything went wrong
    if (NiFpga_IsError(status)) {
        cout << "Error " << status << endl;
        cout << "Press <Enter> to quit...\n";
        getchar();
    }
    return status;
}

}  // namespace LSST
