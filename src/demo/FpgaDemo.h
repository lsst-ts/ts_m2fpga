// -*- LSST-C++ -*-
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

#ifndef LSST_FPGADEMO_H
#define LSST_FPGADEMO_H

// System headers
#include <atomic>

namespace LSST {

/// Class used to test cRIO FPGA communication.
class FpgaDemo {
public:
    FpgaDemo() = default;
    ~FpgaDemo() = default;

    /// Try to repeatedly read and write to the FPGA until `stop()` is called.
    int run();

    /// Terminate the loop in `run()`.
    void stop() { _loop = false; }

private:
    std::atomic<bool> _loop{true};
};

}  // namespace LSST

#endif  // LSST_FPGADEMO_H
