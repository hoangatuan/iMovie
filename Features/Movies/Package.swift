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
        .package(path: "../Core/CommonUI"),

        .package(path: "../Foundation/Network"),
        .package(path: "../Foundation/Domain"),
        .package(path: "../Foundation/Router"),
        .package(path: "../Foundation/DesignSystem"),
    ],
    targets: [
        .target(
            name: "Movies",
            dependencies: [
                "Network",
                "CommonUI",
                "Domain",
                .product(name: "DomainData", package: "Domain"),
                "Router",
                "DesignSystem",
            ],
            resources: [
                .process("Resources")
            ]
        ),
        .testTarget(
            name: "MoviesTests",
            dependencies: [
                "Movies",
                .product(name: "NetworkMock", package: "Network"),
            ],
            resources: [
                .process("Resources"),
            ]
        ),
    ]
)

for target in package.targets {
    target.swiftSettings = target.swiftSettings ?? []
    target.swiftSettings?.append(
        .unsafeFlags([
            "-Xfrontend", "-warn-long-function-bodies=200", "-Xfrontend", "-warn-long-expression-type-checking=200",
        ])
    )
}
