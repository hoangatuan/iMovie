//
//  File.swift
//  
//
//  Created by Hoang Anh Tuan on 15/10/2023.
//

import SwiftUI
import Network
import Router
import Models
import Factory

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
                case .movieDetail(let movie):
                    MovieDetailView(viewModel: .init(movie: movie, movieRepository: MovieDetailRepository(apiClientService: dependencies.apiClient)))
            }
        }
    }
}

extension MoviesCoordinator {
    public struct Dependencies {
        let apiClient: IAPIClientService
        public init(apiClient: IAPIClientService) {
            self.apiClient = apiClient
        }
    }
}
