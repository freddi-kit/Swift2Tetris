// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftdeOS",
    products: [
        .executable(name: "SwiftdeOS", targets: ["SwiftdeOS"]),
        .library(name: "SwiftdeOSKit", targets: ["SwiftdeOSKit"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "SwiftdeOS",
            dependencies: ["SwiftdeOSKit"]),
        .target(
            name: "SwiftdeOSKit",
            dependencies: []),
        .testTarget(
            name: "SwiftdeOSTests",
            dependencies: ["SwiftdeOSKit"]),
    ]
)