// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Search",
    platforms: [
        .iOS(.v16),
    ],
    products: [
        .library(
            name: "Search",
            targets: ["Search"]
        ),
    ],
    dependencies: [
        .package(path: "../Core/CommonUI"),

        .package(path: "../Foundation/Network"),
        .package(path: "../Foundation/Domain"),
        .package(path: "../Foundation/Router"),
        .package(path: "../Foundation/DesignSystem"),
    ],
    targets: [
        .target(
            name: "Search",
            dependencies: [
                "Network",
                "CommonUI",
                "Domain",
                .product(name: "DomainData", package: "Domain"),
                "Router",
                "DesignSystem",
            ]
        ),
        .testTarget(
            name: "SearchTests",
            dependencies: [
                "Search",
                .product(name: "NetworkMock", package: "Network"),
            ],
            resources: [
                .process("Resources")
            ]
        ),
    ]
)
