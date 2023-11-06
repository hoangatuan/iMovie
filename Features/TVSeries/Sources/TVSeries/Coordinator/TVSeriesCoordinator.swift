//
//  TVSeriesCoordinator.swift
//
//
//  Created by Hoang Anh Tuan on 06/11/2023.
//

import Domain
import DomainData
import Factory
import Network
import Router
import SwiftUI

public struct TVSeriesCoordinator: View {
    private let dependencies: Dependencies

    public init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }

    public var body: some View {
        TVSeriesHomeView(
            viewModel: .init(movieRepository: TVSeriesRepository(apiClientService: dependencies.apiClient))
        )
    }
}

public extension TVSeriesCoordinator {
    struct Dependencies {
        let apiClient: IAPIClientService
        public init(apiClient: IAPIClientService) {
            self.apiClient = apiClient
        }
    }
}
