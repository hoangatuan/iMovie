import ProjectDescription
import ProjectDescriptionHelpers

let packageDependencies: [ProjectDescription.Package] = [
    .package(url: "https://github.com/apple/swift-log.git", from: "1.2.0"),
    .package(url: "https://github.com/apple/swift-syntax.git", from: "509.0.0"),
    .package(url: "https://github.com/AliSoftware/OHHTTPStubs", from: "9.1.0"),
    .package(url: "https://github.com/kean/Nuke", from: "12.0.0"),
    .package(url: "https://github.com/markiv/SwiftUI-Shimmer", .exact("1.1.0")),
    .package(path: .relativeToRoot("Foundation/HelperMacros")),
]

let appTarget = Target(
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
    scripts: [
        TargetScript.post(
            script: """
            if [[ "$(uname -m)" == arm64 ]]; then
                export PATH="/opt/homebrew/bin:$PATH"
            fi

            if which swiftlint > /dev/null; then
              swiftlint
            else
              echo "warning: SwiftLint not installed, download from https://github.com/realm/SwiftLint"
            fi
            """,
            name: "Swiftlint"
        ),
    ],
    dependencies: [
        .target(name: Target.Features.people.rawValue),
        .target(name: Target.Features.movies.rawValue),
        .target(name: Target.Features.search.rawValue),
        .target(name: Target.Features.tvSeries.rawValue),
    ]
)

let targets: [Target] = Target.Foundation.allCases.map { $0.target } + Target.Core.allCases.map { $0.target } + Target.Features.allCases.map { $0.target } + [appTarget]

let project = Project(
    name: "iMovie",
    organizationName: nil,
    packages: packageDependencies,
    settings: nil,
    targets: targets,
    schemes: [
        Scheme(
            name: "iMovie",
            buildAction: .buildAction(targets: ["iMovie"]),
            testAction: .testPlans([
                .relativeToRoot("iMovie.xctestplan"),
            ]),
            runAction: .runAction(
                configuration: .debug,
                executable: "iMovie"
            )
        ),
    ]
)
