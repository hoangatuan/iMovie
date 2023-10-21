//
//  File.swift
//  
//
//  Created by Hoang Anh Tuan on 15/10/2023.
//

import SwiftUI
import Network

public struct SearchCoordinator: View {
    private let dependencies: Dependencies
    
    public init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    public var body: some View {
        SearchView(viewModel: .init(searchRepository: SearchRepository(apiClientService: dependencies.apiClient)))
            .toolbar(.hidden, for: .tabBar)
    }
}

extension SearchCoordinator {
    
    public struct Dependencies {
        let apiClient: IAPIClientService
        public init(apiClient: IAPIClientService) {
            self.apiClient = apiClient
        }
    }
    
}

