//
//  AppTabView.swift
//  iMovie
//
//  Created by Tuan Hoang on 18/06/2023.
//

import SwiftUI
import Factory
import Movies

struct AppTabView: View {
    private let container: Container
    init(container: Container) {
        self.container = container
    }

    @State private var selection = 0

    var body: some View {
        TabView(selection: $selection) {
            MoviesHomeView(
                viewModel: .init(movieRepository: MovieRepository(apiClientService: container.apiClientService()))
            )
            .tabItem {
                Image("movies")
                Text("Movies")
            }
            .tag(0)

        }
        .onAppear() {
            UITabBar.appearance().barTintColor = .white
        }
    }
}
