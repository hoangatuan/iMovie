// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CommonUI",
    platforms: [
        .iOS(.v16),
    ],
    products: [
        .library(
            name: "CommonUI",
            targets: ["CommonUI"]
        ),
    ],
    dependencies: [
        .package(path: "../Foundation/Domain"),
        .package(url: "https://github.com/kean/Nuke", from: "12.0.0"),
        .package(url: "https://github.com/markiv/SwiftUI-Shimmer", exact: "1.1.0"),
    ],
    targets: [
        .target(
            name: "CommonUI",
            dependencies: [
                "Domain",
                .product(name: "Shimmer", package: "SwiftUI-Shimmer"),
                .product(name: "NukeUI", package: "Nuke"),
            ]
        ),
        .testTarget(
            name: "CommonUITests",
            dependencies: ["CommonUI"]
        ),
    ]
)
