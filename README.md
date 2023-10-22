# 🎬 iMovie

This is a SwiftUI project that apply Modular Architect & Clean Architect. For the presentation layer, I'm using MVVM-C.   
Supports iOS 16+

# Getting Started

![Static Badge](https://img.shields.io/badge/status-active-brightgreen)
![platform](https://img.shields.io/badge/platform-iOS16+-brightgreen)
![Codecov](https://img.shields.io/codecov/c/github/hoangatuan/iMovie)

## Key Features

- Presentation layer: SwiftUI + MVVM-C + Modern concurrency async-await
- Clean architecture: Decoupled Presentation, Business Logic, and Data Access layers
- Modular architecture
- Navigation using `NavigationStack`
- Data persistence with SwiftData (planning)
- Dependency Injection using `DIContainer` & constructor injection to support testing. Using [Factory](https://github.com/hmlongco/Factory) to support DI.
- Designed for scalability. It can be used as a reference for building large production apps
- Unit tests using `XCTest` and [OHHTTPStubs](https://github.com/AliSoftware/OHHTTPStubs)

## Contribute ⚙️

Feel free to contribute for the project if you want. Here is the figma & api reference:

- [Figma Design](https://www.figma.com/file/rqjEdJecH0tr6uIyT72KXh/NAP001?type=design&node-id=6-9199&t=Ai7i6CXqzbqM468M-0)
- [API Document](https://developer.themoviedb.org/reference/intro/getting-started)

To contribute, please create an issue to describe about what you gonna work on.

## Todo:
    
### Code

- Build features
- Add tests
- Support iOS 17: @Observation, @SwiftData

### Refactor

- Refactor dependency injection
- Refactor enviroment value

### CI/CD

- Add github workflow:
    + Buid, run test before merge
    + Code coverage + create badge
- swiftlint
- swiftformat
