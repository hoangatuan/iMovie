//
//  File.swift
//  
//
//  Created by Hoang Anh Tuan on 15/10/2023.
//

import SwiftUI
import Network
import Router

public enum PublicMoviesDestination: IDestination {
    case search
}

enum Destination: IDestination {
    case genreDetail
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
