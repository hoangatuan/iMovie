//
//  AppTabView.swift
//  iMovie
//
//  Created by Tuan Hoang on 18/06/2023.
//

import CommonUI
import DesignSystem
import SwiftUI

struct AppTabView: View {
    @State private var selection = 0

    var body: some View {
        TabView(selection: $selection) {
            /// We need to create `MovieTabCoordinator` here because if we use `NavigationStack` and `navigationDestination` with `tabItem`, the tab item will not be shown.
            MovieTabCoordinator()
                .tabItem {
                    Image("movies")
                    Text("Movies")
                        .foregroundColor(.color04EECD)
                }
                .tag(0)
                .toolbarBackground(
                    Color.color4E89FF,
                    for: .tabBar
                )

            TvSeriesTabCoordinator()
                .tabItem {
                    Image("tvseries")
                    Text("TV Series")
                        .foregroundColor(.color04EECD)
                }
                .tag(1)
                .toolbarBackground(
                    Color.color4E89FF,
                    for: .tabBar
                )
        }
        .onAppear {
            UITabBar.appearance().barTintColor = .white
        }
    }
}
