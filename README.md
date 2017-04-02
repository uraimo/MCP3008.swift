# MCP3008.swift

*A Swift library for the MCP3008 10-bit SPI ADC*

<p>
<img src="https://img.shields.io/badge/os-linux-green.svg?style=flat" alt="Linux-only" />
<a href="https://developer.apple.com/swift"><img src="https://img.shields.io/badge/swift3-compatible-4BC51D.svg?style=flat" alt="Swift 3 compatible" /></a>
<a href="https://raw.githubusercontent.com/uraimo/5110lcd_pcd8544.swift/master/LICENSE"><img src="http://img.shields.io/badge/license-BSD-blue.svg?style=flat" alt="License: BSD" /></a>
</p>
 

# Summary

This simple library can control an SG90 servo motor with a PWM, that has a 20ms period and duty cycle that represent these positions:

* 1ms = 5%: _-90°, left position_
* 1.5ms = 7.5%: _-90°, middle position_
* 2ms = 10%: _+90°, right position_

Your servo could have slightly different settings (1-2% difference), play around with the values in the `Position` enum (expressed in percentage) to find the right duty cycles for your servo.

## Supported Boards

Every board supported by [SwiftyGPIO](https://github.com/uraimo/SwiftyGPIO): RaspberryPis, BeagleBones, C.H.I.P., etc...

To use this library, you'll need a Linux ARM board with Swift 3.x.

The example below will use a RaspberryPi 2 board but you can easily modify the example to use one the the other supported boards, a full working demo projects for the RaspberryPi2 is available in the `Examples` directory.

## Usage

The first thing we need to do is to obtain an instance of `SPIOutput` from SwiftyGPIO and use it to initialize the `MCP3008` object:

```swift
import SwiftyGPIO
import MCP3008

let spis = SwiftyGPIO.hardwareSPIs(for:.RaspberryPi2)!
let spi = (spis[0]?[0])!
let m = MCP3008(spi)
```

Then use `readValue` to read the current converted value (0...1023) from one of the analog inputs:

```swift
m.readValue(0)
```

## Installation

Please refer to the [SwiftyGPIO](https://github.com/uraimo/SwiftyGPIO) readme for Swift installation instructions.

Once your board runs Swift, if your version support the Swift Package Manager, you can simply add this library as a dependency of your project and compile with `swift build`:

  let package = Package(
      name: "MyProject",
      dependencies: [
    .Package(url: "https://github.com/uraimo/MCP3008.swift.git", majorVersion: 1),
    ...
      ]
      ...
  ) 

The directory `Examples` contains sample projects that uses SPM, compile it and run the sample with `sudo ./.build/debug/TestServo`.

If SPM is not supported, you'll need to manually download the library and its dependencies: 

    wget https://raw.githubusercontent.com/uraimo/MCP3008.swift/master/Sources/MCP3008.swift https://raw.githubusercontent.com/uraimo/SwiftyGPIO/master/Sources/SwiftyGPIO.swift https://raw.githubusercontent.com/uraimo/SwiftyGPIO/master/Sources/Presets.swift https://raw.githubusercontent.com/uraimo/SwiftyGPIO/master/Sources/SPI.swift https://raw.githubusercontent.com/uraimo/SwiftyGPIO/master/Sources/SunXi.swift
     
And once all the files have been downloaded, create an additional file that will contain the code of your application (e.g. main.swift). When your code is ready, compile it with:

    swiftc *.swift

The compiler will create a **main** executable.

As everything interacting with GPIOs, if you are not already root or member of a specific gpio group, you will need to run that binary with `sudo ./main`.