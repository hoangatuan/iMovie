# 🎬 iMovie

This is a SwiftUI project that apply Modular Architect & Clean Architect. For the presentation layer, I'm using MVVM.   
Supports iOS 16+

## Key Features

- Presentation layer: SwiftUI + MVVM-C + Modern concurrency
- Clean architecture: Decoupled Presentation, Business Logic, and Data Access layers
- Modular architecture
- Navigation using `NavigationStack`
- Data persistence with SwiftData (planning)
- Dependency Injection using `DIContainer` & constructor injection to support testing. Using [Factory](https://github.com/hmlongco/Factory) to support DI.
- Designed for scalability. It can be used as a reference for building large production apps

# Getting Started

## Set up project

After clone the project, navigate to the project directory, then run this command:

```bash
    make
```

And that's all you need to do to set up the project 🚀

## Contribute ⚙️

Feel free to contribute for the project if you want. Here is the figma & api reference:

- Figma Design: https://www.figma.com/file/rqjEdJecH0tr6uIyT72KXh/NAP001?type=design&node-id=6-9199&t=Ai7i6CXqzbqM468M-0
- API Document: https://developer.themoviedb.org/reference/intro/getting-started

To contribute, please create an issue to describe about what you gonna work on.

## Todo
    
### Code

- Add tests
- Support iOS 17: @Observation, @SwiftData
- Build features

### Refactor

- Refactor dependency injection
- Refactor enviroment value

### CI/CD

- Add github workflow:
    + Buid, run test before merge
    + Code coverage + create badge
