import ProjectDescription

let config = Config(
    cache: .cache(profiles: [
        .profile(name: "Simulator", configuration: "Debug", device: "iPhone 15 Pro"),
    ])
)
