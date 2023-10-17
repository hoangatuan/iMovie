# Router

A package contains navigation logic.

`NavigationView` has been deprecated by Apple from iOS 16+. Currently we're using `NavigationStack`.

1 problem with `NavigationStack` is that it will be conflict with `TabView` if you use both of them in the same place. For this case, the tab item will not be shown.

Example:

```swift
    ...
        TabView {
            HomeView()
                .navigationDestination(...)
                .tabItem {
                    Image("movies")
                    Text("Movies")
                        .foregroundColor(Color(hex: "04EECD"))
                }
        }
    ...
```

To fix:

https://betterprogramming.pub/swiftui-navigation-stack-and-ideal-tab-view-behaviour-e514cc41a029
