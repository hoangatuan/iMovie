//
//  SearchCoordinator.swift
//
//
//  Created by Hoang Anh Tuan on 15/10/2023.
//

import DomainData
import Network
import SwiftUI

public struct SearchCoordinator: View {
    private let dependencies: Dependencies

    public init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }

    public var body: some View {
        SearchView(searchRepository: SearchRepository(apiClientService: dependencies.apiClient))
            .toolbar(.hidden, for: .tabBar)
    }
}

public extension SearchCoordinator {
    struct Dependencies {
        let apiClient: IAPIClientService
        public init(apiClient: IAPIClientService) {
            self.apiClient = apiClient
        }
    }
}
