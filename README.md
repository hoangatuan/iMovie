# 🎬 iMovie

![Static Badge](https://img.shields.io/badge/status-active-brightgreen)

This is a SwiftUI project that applies **Modular Architect & Clean Architect**. For the presentation layer, I'm using **MVVM-C**.  
Supports iOS 16+

## Preface

The purpose I developing this project is I want it to be used as a reference for large scale production apps.
Because of that, I don't spend too much efforts in building UI, so the UI is not fancy 😛

## Key Features

- Presentation layer: SwiftUI + MVVM-C + Modern concurrency
- Clean architecture: Decoupled Presentation, Business Logic, and Data Access layers
- Modular architecture
- Navigation using `NavigationStack`
- Dependency Injection using `CompositionRoot` approach, `DIContainer` & constructor injection to support testing.
- Cover with unit tests, [snapshot testing](https://github.com/pointfreeco/swift-snapshot-testing?tab=readme-ov-file#installation)
- Designed for scalability. It can be used as a reference for building large production apps   

### Inovates 💡

- Use Swift Macros to remove duplicate codes

## Modular Architecture Diagram

<img src=resources/modular_architect.png width=800/>

## Clean Architecture Diagram

<img src=resources/clean_architect.png width=800/>

For Clean Architecture, theoratically we should have `UseCaseInterface` and `UseCaseImplementation`. However, at this point I feel like bringing `Usecase` as an extra layer is unncessary.  
If we feel like need `Usecase` layer in future, we will add it.

## Why MVVM but not TCA, Redux, ... ?

Please read [this great article](https://betterprogramming.pub/swiftui-choosing-an-application-architecture-6ec9289f8e8f) from @Michael Long. I pretty much agreed with his thoughts.

# Getting Started

## Set up project

After clone the project, navigate to the project directory, then run this command:

```bash
    make
```

And that's all you need to do to set up the project 🚀

## Contribute ⚙️

Feel free to contribute for the project if you want. Here is the figma & api reference:

- [Figma Design](https://www.figma.com/file/rqjEdJecH0tr6uIyT72KXh/NAP001?type=design&node-id=6-9199&t=Ai7i6CXqzbqM468M-0)
- [API Document](https://developer.themoviedb.org/reference/intro/getting-started)

There are some ways you can contribute to the project:

1. I've created some tasks under `Issues` tab. There are bugs, features, ... there. If you want to pick a task, just need to comment on the issue.
2. If you want to work on a new issue, you can go to `Issues` tab, and create a new issue to describe what you want to do.

## References

These are articles I've written about the process building this project:

1. [How I build Navigation](https://medium.com/gitconnected/modular-navigation-in-swiftui-a-comprehensive-guide-5eeb8a511583)

These are articles that I used as references while developing this project:

1. [Choosing SwiftUI Architecture](https://betterprogramming.pub/swiftui-choosing-an-application-architecture-6ec9289f8e8f)
