//
//  SwiftUIView.swift
//  
//
//  Created by Tuan Hoang on 19/11/23.
//

import Domain
import DomainData
import Factory
import Network
import Router
import SwiftUI

public struct MovieDetailCoordinator: View {
    @EnvironmentObject private var router: Router
    
    private let dependencies: Dependencies
    
    public init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    public var body: some View {
        MovieDetailView(
            viewModel: .init(
                movie: dependencies.movie,
                movieRepository: MovieDetailRepository(apiClientService: dependencies.apiClient),
                accountRepository: AccountRepository(apiClientService: dependencies.apiClient)
            )
        )
        .navigationDestination(for: Destination.self) { destination in
            switch destination {
            case let .movieDetail(movie):
                MovieDetailView(
                    viewModel: .init(
                        movie: movie,
                        movieRepository: MovieDetailRepository(apiClientService: dependencies.apiClient),
                        accountRepository: AccountRepository(apiClientService: dependencies.apiClient)
                    )
                )
            default:
                EmptyView()
            }
        }
    }
}

public extension MovieDetailCoordinator {
    
    struct Dependencies {
        let movie: Movie
        let apiClient: IAPIClientService
        
        public init(movie: Movie, apiClient: IAPIClientService) {
            self.movie = movie
            self.apiClient = apiClient
        }
    }
}
