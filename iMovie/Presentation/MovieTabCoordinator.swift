//
//  MovieTabCoordinator.swift
//  iMovie
//
//  Created by Hoang Anh Tuan on 17/10/2023.
//

import Movies
import Router
import Search
import SwiftUI
import People

struct MovieTabCoordinator: View {

    @EnvironmentObject var configuration: Configuration
    @StateObject var router = Router()

    var body: some View {
        NavigationStack(path: $router.navPath) {
            MoviesCoordinator(dependencies: .init(apiClient: configuration.apiClientService))
                .toolbar(.visible, for: .tabBar)
                .navigationDestination(for: PublicMoviesDestination.self) { destination in
                    switch destination {
                    case .search:
                        SearchCoordinator(dependencies: .init(apiClient: configuration.apiClientService))
                    case let .personDetail(personId):
                        PersonDetailCoordinator(dependencies: .init(personId: personId, apiClient: configuration.apiClientService))
                    }
                }
                .navigationDestination(for: PublicPeopleDestination.self) { destination in
                    switch destination {
                    case .movieDetail(let movie):
                        MovieDetailCoordinator(dependencies: .init(movie: movie, apiClient: configuration.apiClientService))
                    case .tvDetail(_):
                        Text("TV Series Detail")
                    }
                }
        }
        .environmentObject(router)
    }
}
