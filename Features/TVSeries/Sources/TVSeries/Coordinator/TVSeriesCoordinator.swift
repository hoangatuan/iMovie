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

public enum PublicTVSeriesDestination {
    case search
}

enum Destination: Hashable {
    case tvSeriesDetail(TVSeries)
}

public struct TVSeriesCoordinator: View {
    private let dependencies: Dependencies

    public init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }

    public var body: some View {
        TVSeriesHomeView(repository: TVSeriesRepository(apiClientService: dependencies.apiClient))
        .navigationDestination(for: Destination.self) { destination in
            switch destination {
            case .tvSeriesDetail(let tvSeries):
                Text("TV Series")
                    .toolbar(.hidden, for: .tabBar)
            }
        }
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
