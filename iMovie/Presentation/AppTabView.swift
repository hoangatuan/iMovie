//
//  AppTabView.swift
//  iMovie
//
//  Created by Tuan Hoang on 18/06/2023.
//

import SwiftUI
import Factory
import CommonUI
import DesignSystem

struct AppTabView: View {
    private let container: Container
    
    init(container: Container) {
        self.container = container
    }

    @State private var selection = 0

    var body: some View {
        TabView(selection: $selection) {
            MovieTabCoordinator()
                .tabItem {
                    Image("movies")
                    Text("Movies")
                        .foregroundColor(.color04EECD)
                }
                .tag(0)
                .toolbar(.visible, for: .tabBar)
                .toolbarBackground(
                    Color.color4E89FF,
                    for: .tabBar
                )
            
        }
        .onAppear() {
            UITabBar.appearance().barTintColor = .white
        }
    }
}
