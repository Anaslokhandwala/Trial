// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Trial",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Trial",
            targets: ["Trial"]),
    ],
    dependencies: [
        .package(url: "https://github.com/AFNetworking/AFNetworking.git", .exact("4.0.0")),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .binaryTarget(
            name: "AccuraOCR",
            path: "./Sources/AccuraOCR.xcframework"
        ),
        .target(
            name: "Trial",
            dependencies: [
                .target(name: "AccuraOCR"),
                .product(name: "AFNetworking", package: "AFNetworking"),
         ]),
        .testTarget(
            name: "TrialTests",
            dependencies: ["Trial"]),
    ]
)
