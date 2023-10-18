// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Movies",
    platforms: [
        .iOS(.v16),
    ],
    products: [
        .library(
            name: "Movies",
            targets: ["Movies"]
        ),
    ],
    dependencies: [
        .package(path: "../Core/Network"),
        .package(path: "../Core/CommonUI"),
        
        .package(path: "../Foundation/Models"),
        .package(path: "../Foundation/Router"),
        .package(path: "../Foundation/DesignSystem"),
    ],
    targets: [
        .target(
            name: "Movies",
            dependencies: [
                "Network",
                "CommonUI",
                "Models",
                "Router",
                "DesignSystem"
            ]
        ),
        .testTarget(
            name: "MoviesTests",
            dependencies: ["Movies"]),
    ]
)
