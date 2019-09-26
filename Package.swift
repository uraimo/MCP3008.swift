// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "MCP3008",
    products: [
        .library(
            name: "MCP3008",
            targets: ["MCP3008"]),
    ],
    dependencies: [
        .package(url: "https://github.com/uraimo/SwiftyGPIO.git", from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "MCP3008",
            dependencies: ["SwiftyGPIO"],
            path: ".",
            sources: ["Sources"])
    ]
)