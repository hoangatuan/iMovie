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

public enum PublicMoviesDestination: Hashable {
    case search
}

enum MovieSheetDesination: Identifiable {
    var id: String {
        switch self {
        case .share:
            return "share"
        }
    }
    
    case share(movie: Movie)
}

enum Destination: Hashable {
    case listGenres(genres: [Genre])
    case movieByGenre(genre: Genre)
    case movieDetail(movie: Movie)
}

public struct MoviesCoordinator: View {
    
    @EnvironmentObject private var router: Router
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
            case let .movieByGenre(genre):
                GenreMoviesView(viewModel: .init(
                    genre: genre,
                    repository: MovieRepository(apiClientService: dependencies.apiClient)
                )
                )
            case let .movieDetail(movie):
                MovieDetailView(
                    viewModel: .init(
                        movie: movie,
                        movieRepository: MovieDetailRepository(apiClientService: dependencies.apiClient),
                        accountRepository: AccountRepository(apiClientService: dependencies.apiClient)
                    )
                )
            case let .listGenres(genres):
                ListGenresView(genres: genres)
            }
        }
        .sheet(item: $router.presentedSheet) { destination in
            if let destination = destination.destination as? MovieSheetDesination {
                switch destination {
                case .share(movie: let movie):
                    Text("Share movie")
                }
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
