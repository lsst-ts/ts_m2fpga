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

#include <iostream>
#include <thread>
#include "demo/FpgaDemo.h"

using namespace std;
using namespace LSST;

int main(int argc, char *argv[]) {
    cout << "Hi, press enter to exit" << endl;
    FpgaDemo fpga;

    // Run the loop in a separate thread.
    thread thrd([&fpga]() {fpga.run();});

    // When a key is pressed, end the loop in `run()` and wait to join.
    getchar();
    cout << "stopping loop...\n";
    fpga.stop();
    thrd.join();

    return 0;
}
