import ProjectDescription

let project = Project(
    name: "iMovie",
    organizationName: nil,
    packages: [
        .package(url: "https://github.com/apple/swift-log.git", from: "1.2.0"),
        .package(url: "https://github.com/apple/swift-syntax.git", from: "509.0.0"),
        .package(url: "https://github.com/AliSoftware/OHHTTPStubs", from: "9.1.0"),
        .package(url: "https://github.com/kean/Nuke", from: "12.0.0"),
        .package(url: "https://github.com/markiv/SwiftUI-Shimmer", .exact("1.1.0")),
        .package(path: .relativeToRoot("Foundation/HelperMacros")),
    ],
    settings: nil,
    targets: [
        Target(
            name: "Logger",
            destinations: .iOS,
            product: .framework,
            bundleId: "io.tuist.Logger",
            deploymentTargets: .iOS("13.0"),
            sources: ["Foundation/Logger/Sources/Logger/**"],
            resources: nil,
            dependencies: [
                .package(product: "Logging", type: .runtime, condition: nil),
            ]
        ),
        Target(
            name: "Router",
            destinations: .iOS,
            product: .framework,
            bundleId: "io.tuist.Router",
            deploymentTargets: .iOS("16.0"),
            sources: ["Foundation/Router/Sources/Router/**"],
            resources: nil,
            dependencies: []
        ),
        Target(
            name: "RouterTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "io.tuist.RouterTests",
            deploymentTargets: .iOS("16.0"),
            sources: ["Foundation/Router/Tests/RouterTests/**"],
            resources: nil,
            dependencies: [
                .target(name: "Router"),
            ]
        ),
        Target(
            name: "DesignSystem",
            destinations: .iOS,
            product: .framework,
            bundleId: "io.tuist.DesignSystem",
            deploymentTargets: .iOS("16.0"),
            sources: ["Foundation/DesignSystem/Sources/DesignSystem/**"],
            resources: nil,
            dependencies: []
        ),
        Target(
            name: "Network",
            destinations: .iOS,
            product: .framework,
            bundleId: "io.tuist.Network",
            deploymentTargets: .iOS("16.0"),
            sources: ["Foundation/Network/Sources/Network/**"],
            resources: nil,
            dependencies: [
                .target(name: "Logger"),
            ]
        ),
        Target(
            name: "NetworkMock",
            destinations: .iOS,
            product: .framework,
            bundleId: "io.tuist.NetworkMock",
            deploymentTargets: .iOS("16.0"),
            sources: ["Foundation/Network/Sources/NetworkMock/**"],
            resources: nil,
            dependencies: [
                .target(name: "Network"),
                .package(product: "OHHTTPStubsSwift", type: .runtime, condition: nil),
            ]
        ),
        Target(
            name: "Domain",
            destinations: .iOS,
            product: .framework,
            bundleId: "io.tuist.Domain",
            deploymentTargets: .iOS("16.0"),
            sources: ["Foundation/Domain/Sources/Domain/**"],
            resources: nil,
            dependencies: [
                .package(product: "HelperMacros", type: .macro),
            ]
        ),
        Target(
            name: "DomainData",
            destinations: .iOS,
            product: .framework,
            bundleId: "io.tuist.DomainData",
            deploymentTargets: .iOS("16.0"),
            sources: ["Foundation/Domain/Sources/DomainData/**"],
            resources: nil,
            dependencies: [
                .target(name: "Domain"),
                .target(name: "Network"),
            ]
        ),
        Target(
            name: "CommonUI",
            destinations: .iOS,
            product: .framework,
            bundleId: "io.tuist.CommonUI",
            deploymentTargets: .iOS("16.0"),
            sources: ["Core/CommonUI/Sources/CommonUI/**"],
            resources: nil,
            dependencies: [
                .target(name: "Domain"),
                .package(product: "Shimmer", type: .runtime, condition: nil),
                .package(product: "NukeUI", type: .runtime, condition: nil),
            ]
        ),
        Target(
            name: "People",
            destinations: .iOS,
            product: .framework,
            bundleId: "io.tuist.People",
            deploymentTargets: .iOS("16.0"),
            sources: ["Features/People/Sources/People/**"],
            resources: nil,
            dependencies: [
                .target(name: "Domain"),
                .target(name: "Network"),
                .target(name: "CommonUI"),
                .target(name: "DomainData"),
                .target(name: "Router"),
                .target(name: "DesignSystem"),
            ]
        ),
        Target(
            name: "PeopleTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "io.tuist.PeopleTests",
            deploymentTargets: .iOS("16.0"),
            sources: ["Features/People/Tests/PeopleTests/**"],
            resources: nil,
            dependencies: [
                .target(name: "People"),
                .target(name: "NetworkMock"),
            ]
        ),
        Target(
            name: "TVSeries",
            destinations: .iOS,
            product: .framework,
            bundleId: "io.tuist.TVSeries",
            deploymentTargets: .iOS("16.0"),
            sources: ["Features/TVSeries/Sources/TVSeries/**"],
            resources: nil,
            dependencies: [
                .target(name: "Domain"),
                .target(name: "Network"),
                .target(name: "CommonUI"),
                .target(name: "DomainData"),
                .target(name: "Router"),
                .target(name: "DesignSystem"),
            ]
        ),
        Target(
            name: "TVSeriesTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "io.tuist.TVSeriesTests",
            deploymentTargets: .iOS("16.0"),
            sources: ["Features/TVSeries/Tests/TVSeriesTests/**"],
            resources: nil,
            dependencies: [
                .target(name: "TVSeries"),
                .target(name: "NetworkMock"),
            ]
        ),
        Target(
            name: "Movies",
            destinations: .iOS,
            product: .framework,
            bundleId: "io.tuist.Movies",
            deploymentTargets: .iOS("16.0"),
            sources: ["Features/Movies/Sources/Movies/**"],
            resources: nil,
            dependencies: [
                .target(name: "Domain"),
                .target(name: "Network"),
                .target(name: "CommonUI"),
                .target(name: "DomainData"),
                .target(name: "Router"),
                .target(name: "DesignSystem"),
            ]
        ),
        Target(
            name: "MoviesTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "io.tuist.MoviesTests",
            deploymentTargets: .iOS("16.0"),
            sources: ["Features/Movies/Tests/MoviesTests/**"],
            resources: nil,
            dependencies: [
                .target(name: "Movies"),
                .target(name: "NetworkMock"),
            ]
        ),
        Target(
            name: "Search",
            destinations: .iOS,
            product: .framework,
            bundleId: "io.tuist.Search",
            deploymentTargets: .iOS("16.0"),
            sources: ["Features/Search/Sources/Search/**"],
            resources: nil,
            dependencies: [
                .target(name: "Domain"),
                .target(name: "Network"),
                .target(name: "CommonUI"),
                .target(name: "DomainData"),
                .target(name: "Router"),
                .target(name: "DesignSystem"),
            ]
        ),
        Target(
            name: "SearchTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "io.tuist.SearchTests",
            deploymentTargets: .iOS("16.0"),
            sources: ["Features/Search/Tests/SearchTests/**"],
            resources: nil,
            dependencies: [
                .target(name: "Search"),
                .target(name: "NetworkMock"),
            ]
        ),
        Target(
            name: "iMovie",
            destinations: .iOS,
            product: .app,
            bundleId: "io.tuist.iMovie",
            deploymentTargets: .iOS("16.0"),
            sources: [
                "iMovie/Application/**",
                "iMovie/Presentation/**",
            ],
            resources: [
                "iMovie/Resources/**",
            ],
            dependencies: [
                .target(name: "People"),
                .target(name: "Movies"),
                .target(name: "Search"),
                .target(name: "TVSeries"),
            ]
        ),
    ]
)
