//
//  MovieTabCoordinator.swift
//  iMovie
//
//  Created by Hoang Anh Tuan on 17/10/2023.
//

import Factory
import Movies
import Router
import Search
import SwiftUI

struct MovieTabCoordinator: View {
    @ObservedObject var router = Router()

    var body: some View {
        NavigationStack(path: $router.navPath) {
            MoviesCoordinator(dependencies: .init(apiClient: Container.shared.apiClientService()))
                .toolbar(.visible, for: .tabBar)
                .navigationDestination(for: PublicMoviesDestination.self) { destination in
                    switch destination {
                    case .search:
                        SearchCoordinator(dependencies: .init(apiClient: Container.shared.apiClientService()))
                    }
                }
        }
        .environmentObject(router)
    }
}
