// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BookBaramAction",
    platforms: [.iOS(.v17)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "BookBaramAction",
            targets: ["BookBaramAction"])
    ],
    dependencies: [
        .package(name: "BookBaramUtils", path: "../Utils"),
        .package(name: "BookBaramDB", path: "../Database"),
        .package(name: "BookBaramNetwork", path: "../Network")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "BookBaramAction",
            dependencies: [
                .product(name: "BookBaramUtils", package: "BookBaramUtils"),
                .product(name: "BookBaramNetwork", package: "BookBaramNetwork"),
                .product(name: "BookBaramDB", package: "BookBaramDB")
            ]
        )
    ]
)
