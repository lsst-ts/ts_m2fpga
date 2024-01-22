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

/// Convert a signed 16 bit fixed point value (FPX) to a float.
/// Input 16 bits has the signed integer value in the high order bits while
/// the lower order bits contain a value that is scaled between 0 and 1.
/// @param inVal bytes representing the input value.
/// @param highOrderBits the number of bits representing the integer
///              portion of the value.
/// @return The float equivalent of `inVal`.
float convertFxp16(int16_t inVal, int highOrderBits) {
    if (highOrderBits < 1 || highOrderBits > 15) {
        throw std::out_of_range("highOrderBits out of range");
    }
    int16_t const bits = 16;
    int16_t const baseMask = 0b1000000000000000;
    // Since the first bit is already set, we need to subtract one from highOrderBits
    // when shifting to create the other bits. Since this is signed, the right shift
    // will duplicate the one when shifting.
    int16_t const maskHi = baseMask >> (highOrderBits - 1);  // high order bitmask
    int16_t const maskLow = ~maskHi;                         // low order bitmask
    // maxLow - The scaling value for the fractional part of the FXP.
    int16_t const maxLow = maskLow + 1;  // Single bit set just to the left of the low order mask.
    int16_t const highOrderVal = inVal & maskHi;
    int16_t const lowOrderVal = inVal & maskLow;
    // Shift high order bits all the way to the right.
    float highOrderDbl = highOrderVal >> (bits - highOrderBits);
    float lowOrderDbl = lowOrderVal;
    lowOrderDbl /= maxLow;  // scale the low order bits
    float outVal = highOrderDbl + lowOrderDbl;
    cout << "maskHi=" << std::hex << maskHi << " maskLow=" << maskLow << " maxLow=" << maxLow
         << "\nhighOrderVal=" << highOrderVal << " lowOrderVal=" << lowOrderVal
         << "\nhighOrderDbl=" << highOrderDbl << " lowOrderDbl=" << lowOrderDbl << "\noutVal=" << outVal
         << endl;
    return outVal;
}


/// Test the output of the convertFxp16 function.
/// Binary input values and floating point output values were found by simulating
/// FXP controls and binary arrays in LabView.
/// @param inVal Input FXP
/// @param outVal
/// @param highOrderBits
/// @param log
/// @return
bool test_convertFxp16(int16_t inVal, float outVal, int highOrderBits, bool log = false) {
    float convVal = convertFxp16(inVal, highOrderBits);
    float maxLow = 1 << (16 - highOrderBits);
    float minDelta = 1.0 / maxLow;
    if (log) {
        cout << dec << "FXP16 convVal=" << convVal << " bits=" << highOrderBits << " minDelta=" << minDelta
             << " inVal=" << hex << inVal << endl;
    }
    if (convVal > (outVal + minDelta) || convVal < (outVal - minDelta)) {
        cout << "FAILED! " << dec << " FXP16 convVal=" << convVal << " outVal=" << outVal
             << " bits=" << highOrderBits << " inVal=" << hex << inVal << endl;
        return false;
    }
    return true;
}

int FpgaDemo::run() {
    // test conversions
    int16_t const voltHighOrderBits = 7;
    int16_t inVal = 0b0000001000000000;
    float outVal = 1.0;
    if (!test_convertFxp16(inVal, outVal, voltHighOrderBits)) exit(-1);
    if (test_convertFxp16(inVal, outVal + .5, voltHighOrderBits)) {
        cout << "Conversion should have failed." << endl;
        exit(-1);
    }
    inVal = 0b0000001000110011;
    outVal = 1.09961;
    if (!test_convertFxp16(inVal, outVal, voltHighOrderBits)) exit(-1);
    inVal = 0b0001010000110011;
    outVal = 10.09961;
    if (!test_convertFxp16(inVal, outVal, voltHighOrderBits)) exit(-1);
    inVal = 0b1110101111001101;
    outVal = -10.09961;
    if (!test_convertFxp16(inVal, outVal, voltHighOrderBits)) exit(-1);
    inVal = 0;
    outVal = 0.0;
    if (!test_convertFxp16(inVal, outVal, voltHighOrderBits)) exit(-1);

    int16_t const currentHighOrderBits = 5;
    inVal = 0b0000100000000000;
    outVal = 1.0;
    if (!test_convertFxp16(inVal, outVal, currentHighOrderBits)) exit(-1);
    inVal = 0b0000100011001101;
    outVal = 1.1001;
    if (!test_convertFxp16(inVal, outVal, currentHighOrderBits)) exit(-1);
    inVal = 0b0101000011001101;
    outVal = 10.1001;
    if (!test_convertFxp16(inVal, outVal, currentHighOrderBits)) exit(-1);
    inVal = 0b1010111100110011;
    outVal = -10.1001;
    if (!test_convertFxp16(inVal, outVal, currentHighOrderBits)) exit(-1);

    cout << "end conversion tests" << endl;

    cout << "Initializing...\n";
    NiFpga_Status status = NiFpga_Initialize();
    if (NiFpga_IsNotError(status)) {
        NiFpga_Session session;
        // opens a session, downloads the bitstream, and runs the FPGA
        cout << "Opening a session...\n";
        string cwd = get_current_dir_name();
        string bitfile = cwd + "/" + NiFpga_mainFPGA_Bitfile;
        cout << "opening " << bitfile << endl;
        NiFpga_MergeStatus(&status, NiFpga_Open(bitfile.c_str(), NiFpga_mainFPGA_Signature, "RIO0",
                                                NiFpga_OpenAttribute_NoRun, &session));
        cout << "NiFpga_MergeStatus complete status=" << status << endl;
        if (NiFpga_IsNotError(status)) {
            // run the FPGA application
            cout << "Running the FPGA...\n";
            NiFpga_MergeStatus(&status, NiFpga_Run(session, 0));

            cout << "loop start" << endl;
            uint32_t inputPortReadU32 = 0;  // Value read from inputPort U32 indicator.

            const int SIZE = 10;       // Size of arrays used with FIFO's. Usually only element 0 is used.
            uint8_t outputPort[SIZE];  /// output to FPGA DO_DAQ
            uint32_t inputPort[SIZE];  /// input from FPGA DI_DAQ

            while (_loop) {
                // read uint32 indicators
                NiFpga_MergeStatus(&status,
                                   NiFpga_ReadU32(session, NiFpga_mainFPGA_IndicatorU32_inputPort_U32,
                                                  &inputPortReadU32));

                // A to D tests
                // copy FIFO data from Comm Voltage FIFO and convert.
                int16_t commVoltFxp16_7[1];
                NiFpga_MergeStatus(
                        &status,
                        NiFpga_ReadFifoI16(session, NiFpga_mainFPGA_TargetToHostFifoI16_FIFO_CommVoltage,
                                           commVoltFxp16_7, 1, NiFpga_InfiniteTimeout, NULL));
                float commVolt = convertFxp16(commVoltFxp16_7[0], 7);
                cout << "commVoltFxp16_7[0]=" << commVoltFxp16_7[0] << " commVolt=" << commVolt << endl;


                // copy ouput port information to FPGA
                NiFpga_MergeStatus(
                        &status,
                        NiFpga_WriteFifoU8(session, NiFpga_mainFPGA_HostToTargetFifoU8_FIFO_ToFPGAOutPort_U8,
                                           outputPort, 1, NiFpga_InfiniteTimeout, NULL));

                // copy FIFO data from FIFO_FromFPGA_U32
                NiFpga_MergeStatus(
                        &status,
                        NiFpga_ReadFifoU32(session, NiFpga_mainFPGA_TargetToHostFifoU32_FIFO_FromFPGAInPort_U32,
                                           inputPort, 1, NiFpga_InfiniteTimeout, NULL));

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
