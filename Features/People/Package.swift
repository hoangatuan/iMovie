// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "People",
    platforms: [
        .iOS(.v16),
    ],
    products: [
        .library(
            name: "People",
            targets: ["People"]
        ),
    ],
    dependencies: [
        .package(path: "../Core/CommonUI"),

        .package(path: "../Foundation/Network"),
        .package(path: "../Foundation/Domain"),
        .package(path: "../Foundation/Router"),
        .package(path: "../Foundation/DesignSystem"),
        .package(
           url: "https://github.com/pointfreeco/swift-snapshot-testing",
           from: "1.12.0"
         ),
    ],
    targets: [
        .target(
            name: "People",
            dependencies: [
                "Network",
                "CommonUI",
                "Domain",
                .product(name: "DomainData", package: "Domain"),
                "Router",
                "DesignSystem",
            ],
            resources: [
                .process("Resources/")
            ],
            swiftSettings: [
                .unsafeFlags([
                    "-Xfrontend", "-warn-long-function-bodies=200", "-Xfrontend", "-warn-long-expression-type-checking=200",
                ]),
            ]
        ),
        .testTarget(
            name: "PeopleTests",
            dependencies: [
                "People",
                .product(name: "NetworkMock", package: "Network"),
                .product(name: "SnapshotTesting", package: "swift-snapshot-testing"),
            ],
            resources: [
                .process("Resources/"),
            ]
        ),
    ]
)

// for target in package.targets {
//    target.swiftSettings = target.swiftSettings ?? []
//    target.swiftSettings?.append(
//        .unsafeFlags([
//            "-Xfrontend", "-warn-long-function-bodies=200", "-Xfrontend", "-warn-long-expression-type-checking=200"
//        ])
//    )
// }
