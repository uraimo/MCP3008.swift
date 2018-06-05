import PackageDescription

let package = Package(
    name: "TestMCP",
    targets: [],
    dependencies: [
        .Package(url: "https://github.com/uraimo/MCP3008.swift.git",
                 majorVersion: 2)
    ]
)
