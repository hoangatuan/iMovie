import ProjectDescription

/// Project helpers are functions that simplify the way you define your project.
/// Share code to create targets, settings, dependencies,
/// Create your own conventions, e.g: a func that makes sure all shared targets are "static frameworks"
/// See https://docs.tuist.io/guides/helpers/

// MARK: - Foundation targets

public extension Target {
    enum Foundation: String, CaseIterable {
        case logger = "Logger"
        case router = "Router"
        case routerTest = "RouterTests"
        case designSystem = "DesignSystem"
        case network = "Network"
        case networkMock = "NetworkMock"
        case domain = "Domain"
        case domainData = "DomainData"

        public var target: Target {
            switch self {
            case .logger:
                Target(
                    name: rawValue,
                    destinations: .iOS,
                    product: .framework,
                    bundleId: "io.tuist.Logger",
                    deploymentTargets: .iOS("13.0"),
                    sources: ["Foundation/Logger/Sources/Logger/**"],
                    resources: nil,
                    dependencies: [
                        .package(product: "Logging", type: .runtime, condition: nil),
                    ]
                )
            case .router:
                Target(
                    name: rawValue,
                    destinations: .iOS,
                    product: .framework,
                    bundleId: "io.tuist.Router",
                    deploymentTargets: .iOS("16.0"),
                    sources: ["Foundation/Router/Sources/Router/**"],
                    resources: nil,
                    dependencies: []
                )
            case .routerTest:
                Target(
                    name: rawValue,
                    destinations: .iOS,
                    product: .unitTests,
                    bundleId: "io.tuist.RouterTests",
                    deploymentTargets: .iOS("16.0"),
                    sources: ["Foundation/Router/Tests/RouterTests/**"],
                    resources: nil,
                    dependencies: [
                        .target(name: Foundation.router.rawValue),
                    ]
                )
            case .designSystem:
                Target(
                    name: rawValue,
                    destinations: .iOS,
                    product: .framework,
                    bundleId: "io.tuist.DesignSystem",
                    deploymentTargets: .iOS("16.0"),
                    sources: ["Foundation/DesignSystem/Sources/DesignSystem/**"],
                    resources: nil,
                    dependencies: []
                )
            case .network:
                Target(
                    name: rawValue,
                    destinations: .iOS,
                    product: .framework,
                    bundleId: "io.tuist.Network",
                    deploymentTargets: .iOS("16.0"),
                    sources: ["Foundation/Network/Sources/Network/**"],
                    resources: nil,
                    dependencies: [
                        .target(name: Foundation.logger.rawValue),
                    ]
                )
            case .networkMock:
                Target(
                    name: rawValue,
                    destinations: .iOS,
                    product: .framework,
                    bundleId: "io.tuist.NetworkMock",
                    deploymentTargets: .iOS("16.0"),
                    sources: ["Foundation/Network/Sources/NetworkMock/**"],
                    resources: nil,
                    dependencies: [
                        .target(name: Foundation.network.rawValue),
                        .package(product: "OHHTTPStubsSwift", type: .runtime, condition: nil),
                    ]
                )
            case .domain:
                Target(
                    name: rawValue,
                    destinations: .iOS,
                    product: .framework,
                    bundleId: "io.tuist.Domain",
                    deploymentTargets: .iOS("16.0"),
                    sources: ["Foundation/Domain/Sources/Domain/**"],
                    resources: nil,
                    dependencies: [
                        .package(product: "HelperMacros", type: .macro),
                    ]
                )
            case .domainData:
                Target(
                    name: rawValue,
                    destinations: .iOS,
                    product: .framework,
                    bundleId: "io.tuist.DomainData",
                    deploymentTargets: .iOS("16.0"),
                    sources: ["Foundation/Domain/Sources/DomainData/**"],
                    resources: nil,
                    dependencies: [
                        .target(name: Foundation.domain.rawValue),
                        .target(name: Foundation.network.rawValue),
                    ]
                )
            }
        }
    }

    enum Core: String, CaseIterable {
        case commonUI = "CommonUI"

        public var target: Target {
            switch self {
            case .commonUI:
                Target(
                    name: "CommonUI",
                    destinations: .iOS,
                    product: .framework,
                    bundleId: "io.tuist.CommonUI",
                    deploymentTargets: .iOS("16.0"),
                    sources: ["Core/CommonUI/Sources/CommonUI/**"],
                    resources: nil,
                    dependencies: [
                        .target(name: Foundation.domain.rawValue),
                        .package(product: "Shimmer", type: .runtime, condition: nil),
                        .package(product: "NukeUI", type: .runtime, condition: nil),
                    ]
                )
            }
        }
    }

    enum Features: String, CaseIterable {
        case people = "People"
        case peopleTests = "PeopleTests"
        case tvSeries = "TVSeries"
        case tvSeriesTests = "TVSeriesTests"
        case movies = "Movies"
        case MoviesTests
        case search = "Search"
        case searchTests = "SearchTests"

        public var target: Target {
            switch self {
            case .people:
                Target(
                    name: rawValue,
                    destinations: .iOS,
                    product: .framework,
                    bundleId: "io.tuist.People",
                    deploymentTargets: .iOS("16.0"),
                    sources: ["Features/People/Sources/People/**"],
                    resources: nil,
                    dependencies: [
                        .target(name: Foundation.domain.rawValue),
                        .target(name: Foundation.network.rawValue),
                        .target(name: Core.commonUI.rawValue),
                        .target(name: Foundation.domainData.rawValue),
                        .target(name: Foundation.router.rawValue),
                        .target(name: Foundation.designSystem.rawValue),
                    ]
                )
            case .peopleTests:
                Target(
                    name: rawValue,
                    destinations: .iOS,
                    product: .unitTests,
                    bundleId: "io.tuist.PeopleTests",
                    deploymentTargets: .iOS("16.0"),
                    sources: ["Features/People/Tests/PeopleTests/**"],
                    resources: nil,
                    dependencies: [
                        .target(name: Features.people.rawValue),
                        .target(name: Foundation.networkMock.rawValue),
                    ]
                )
            case .tvSeries:
                Target(
                    name: rawValue,
                    destinations: .iOS,
                    product: .framework,
                    bundleId: "io.tuist.TVSeries",
                    deploymentTargets: .iOS("16.0"),
                    sources: ["Features/TVSeries/Sources/TVSeries/**"],
                    resources: nil,
                    dependencies: [
                        .target(name: Foundation.domain.rawValue),
                        .target(name: Foundation.network.rawValue),
                        .target(name: Core.commonUI.rawValue),
                        .target(name: Foundation.domainData.rawValue),
                        .target(name: Foundation.router.rawValue),
                        .target(name: Foundation.designSystem.rawValue),
                    ]
                )
            case .tvSeriesTests:
                Target(
                    name: rawValue,
                    destinations: .iOS,
                    product: .unitTests,
                    bundleId: "io.tuist.TVSeriesTests",
                    deploymentTargets: .iOS("16.0"),
                    sources: ["Features/TVSeries/Tests/TVSeriesTests/**"],
                    resources: nil,
                    dependencies: [
                        .target(name: Features.tvSeries.rawValue),
                        .target(name: Foundation.networkMock.rawValue),
                    ]
                )
            case .movies:
                Target(
                    name: rawValue,
                    destinations: .iOS,
                    product: .framework,
                    bundleId: "io.tuist.Movies",
                    deploymentTargets: .iOS("16.0"),
                    sources: ["Features/Movies/Sources/Movies/**"],
                    resources: nil,
                    dependencies: [
                        .target(name: Foundation.domain.rawValue),
                        .target(name: Foundation.network.rawValue),
                        .target(name: Core.commonUI.rawValue),
                        .target(name: Foundation.domainData.rawValue),
                        .target(name: Foundation.router.rawValue),
                        .target(name: Foundation.designSystem.rawValue),
                    ]
                )
            case .MoviesTests:
                Target(
                    name: rawValue,
                    destinations: .iOS,
                    product: .unitTests,
                    bundleId: "io.tuist.MoviesTests",
                    deploymentTargets: .iOS("16.0"),
                    sources: ["Features/Movies/Tests/MoviesTests/**"],
                    resources: nil,
                    dependencies: [
                        .target(name: Features.movies.rawValue),
                        .target(name: Foundation.networkMock.rawValue),
                    ]
                )
            case .search:
                Target(
                    name: rawValue,
                    destinations: .iOS,
                    product: .framework,
                    bundleId: "io.tuist.Search",
                    deploymentTargets: .iOS("16.0"),
                    sources: ["Features/Search/Sources/Search/**"],
                    resources: nil,
                    dependencies: [
                        .target(name: Foundation.domain.rawValue),
                        .target(name: Foundation.network.rawValue),
                        .target(name: Core.commonUI.rawValue),
                        .target(name: Foundation.domainData.rawValue),
                        .target(name: Foundation.router.rawValue),
                        .target(name: Foundation.designSystem.rawValue),
                    ]
                )
            case .searchTests:
                Target(
                    name: rawValue,
                    destinations: .iOS,
                    product: .unitTests,
                    bundleId: "io.tuist.SearchTests",
                    deploymentTargets: .iOS("16.0"),
                    sources: ["Features/Search/Tests/SearchTests/**"],
                    resources: nil,
                    dependencies: [
                        .target(name: Features.search.rawValue),
                        .target(name: Foundation.networkMock.rawValue),
                    ]
                )
            }
        }
    }
}
