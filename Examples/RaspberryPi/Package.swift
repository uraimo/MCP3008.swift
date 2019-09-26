// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "TestMCP",
    dependencies: [
        .package(url: "https://github.com/uraimo/SwiftyGPIO.git", from: "1.0.0"),
        .package(url: "https://github.com/uraimo/MCP3008.swift.git",from: "2.0.0")
    ],
    targets: [
        .target(name: "TestMCP", 
                dependencies: ["SwiftyGPIO","MCP3008"],
                path: "Sources")
    ]
) 