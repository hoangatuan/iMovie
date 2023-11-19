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
import People

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
                    case let .personDetail(personId):
                        PersonDetailCoordinator(dependencies: .init(personId: personId, apiClient: Container.shared.apiClientService()))
                    }
                }
                .navigationDestination(for: PublicPeopleDestination.self) { destination in
                    switch destination {
                    case .movieDetail(let movie):
                        MovieDetailCoordinator(dependencies: .init(movie: movie, apiClient: Container.shared.apiClientService()))
                    case .tvDetail(let tvSeries):
                        Text("TV Series Detail")
                    }
                }
        }
        .environmentObject(router)
    }
}
