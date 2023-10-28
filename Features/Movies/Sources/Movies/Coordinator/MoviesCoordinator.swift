//
//  MoviesCoordinator.swift
//
//
//  Created by Hoang Anh Tuan on 15/10/2023.
//

import Domain
import DomainData
import Factory
import Network
import Router
import SwiftUI

public enum PublicMoviesDestination: IDestination {
    case search
}

enum Destination: IDestination {
    case genreDetail
    case movieDetail(movie: Movie)
}

public struct MoviesCoordinator: View {
    private let dependencies: Dependencies

    public init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }

    public var body: some View {
        MoviesHomeView(
            viewModel: .init(movieRepository: MovieRepository(apiClientService: dependencies.apiClient))
        )
        .navigationDestination(for: Destination.self) { destination in
            switch destination {
            case .genreDetail:
                Text("Genre detail")
            case let .movieDetail(movie):
                MovieDetailView(viewModel: .init(movie: movie, movieRepository: MovieDetailRepository(apiClientService: dependencies.apiClient)))
            }
        }
    }
}

public extension MoviesCoordinator {
    struct Dependencies {
        let apiClient: IAPIClientService
        public init(apiClient: IAPIClientService) {
            self.apiClient = apiClient
        }
    }
}
