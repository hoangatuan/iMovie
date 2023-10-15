// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Movies",
    platforms: [
        .iOS(.v15),
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Movies",
            targets: ["Movies"]
        ),
    ],
    dependencies: [
        .package(path: "../Core/Network"),
        .package(path: "../Core/CommonUI"),
        
        .package(path: "../Foundation/Models")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Movies",
            dependencies: [
                "Models",
                "Network",
                "CommonUI"
            ]
        ),
        .testTarget(
            name: "MoviesTests",
            dependencies: ["Movies"]),
    ]
)
