/*
   MCP3008.swift

   Copyright (c) 2017 Umberto Raimondi
   Licensed under the MIT license, as follows:

   Permission is hereby granted, free of charge, to any person obtaining a copy
   of this software and associated documentation files (the "Software"), to deal
   in the Software without restriction, including without limitation the rights
   to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
   copies of the Software, and to permit persons to whom the Software is
   furnished to do so, subject to the following conditions:

   The above copyright notice and this permission notice shall be included in all
   copies or substantial portions of the Software.

   THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
   IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
   FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
   AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
   LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
   OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
   SOFTWARE.)
*/

import SwiftyGPIO  //Comment this when not using the package manager


public class MCP3008{
   var spi: SPIOutput

   public init(_ spi: SPIOutput) {
       self.spi = spi
   }

   /// Read the analog value converted to digital 0...1023 from one of the 8 input pins
   ///
   /// - Parameter channel: The channel id, from 0 to 7
   ///
   /// - Returns: The value read converted as a 10 bits integer between 0 and 1023 as a 
   ///            fraction of Vref. Most of the times you'll connect Vdd and Vref to +5V. 
   ///
   public func readValue(for channel: Int) -> UInt32{
      let tx: [UInt8] = [1, (8+channel) << 4, 0]

      let rx = spi.sendDataAndRead(tx)
      return (UInt32(rx[1]&3) << 8) + UInt32(rx[2])
   }

}
