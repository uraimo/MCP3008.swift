import MCP3008

let spis = SwiftyGPIO.hardwareSPIs(for:.RaspberryPi2)!
let spi = (spis[0]?[0])!

let m = MCP3008(spi)

for i in 0...7 {
    print("Value for channel ",i,": ",m.readValue(i))
}

