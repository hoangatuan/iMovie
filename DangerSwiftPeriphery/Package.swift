// swift-tools-version:5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let isDevelop = true

let developProducts: [Product] = isDevelop ? [
    .library(
        name: "DangerDeps",
        type: .dynamic,
        targets: ["DangerDependencies"]),
] : []

let developTargets: [Target] = isDevelop ? [
    .testTarget(
        name: "DangerSwiftPeripheryTests",
        dependencies: ["DangerSwiftPeriphery"]),
    .target(
        name: "DangerDependencies",
        dependencies: ["DangerSwiftPeriphery"]),
] : []

let package = Package(
    name: "DangerSwiftPeriphery",
    platforms: [
        .macOS(.v13),
    ],
    products: [
        .library(
            name: "DangerSwiftPeriphery",
            targets: ["DangerSwiftPeriphery"]),
    ] + developProducts,
    dependencies: [
        .package(url: "https://github.com/danger/swift.git", from: "3.0.0"),
        .package(url: "https://github.com/taji-taji/swift-shell.git", from: "1.0.0"),
        .package(url: "https://github.com/peripheryapp/periphery", from: "2.0.0"),
    ],
    targets: [
        .target(
            name: "DangerSwiftPeriphery",
            dependencies: [
                .product(name: "Danger", package: "swift"),
                .product(name: "periphery", package: "periphery"),
                .product(name: "SwiftShell", package: "swift-shell"),
            ]),
    ] + developTargets
)
