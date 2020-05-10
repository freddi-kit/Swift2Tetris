// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Swift2Tetris",
    products: [
        .executable(name: "Swift2Tetris", targets: ["Swift2Tetris"]),
        .library(name: "Swift2TetrisSoftwareKit", targets: ["Swift2TetrisSoftwareKit"]),
        .library(name: "Swift2TetrisHardwareKit", targets: ["Swift2TetrisHardwareKit"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "Swift2Tetris",
            dependencies: ["Swift2TetrisHardwareKit", "Swift2TetrisSoftwareKit"]),
        .target(
            name: "Swift2TetrisHardwareKit",
            dependencies: []),
        .target(
            name: "Swift2TetrisSoftwareKit",
            dependencies: []),
        .testTarget(
            name: "Swift2TetrisTests",
            dependencies: []),
        .testTarget(
            name: "Swift2TetrisHardwareKitTests",
            dependencies: ["Swift2TetrisHardwareKit"]),
    ]
)
