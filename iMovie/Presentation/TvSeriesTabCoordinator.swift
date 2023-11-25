//
//  TvSeriesTabCoordinator.swift
//  iMovie
//
//  Created by Hoang Anh Tuan on 06/11/2023.
//

import Router
import SwiftUI
import TVSeries
import Search

struct TvSeriesTabCoordinator: View {
    @ObservedObject var router = Router()
    @EnvironmentObject var configuration: Configuration

    var body: some View {
        NavigationStack(path: $router.navPath) {
            TVSeriesCoordinator(dependencies: .init(apiClient: configuration.apiClientService))
                .toolbar(.visible, for: .tabBar)
                .navigationDestination(for: PublicTVSeriesDestination.self) { destination in
                    switch destination {
                    case .search:
                        SearchCoordinator(dependencies: .init(apiClient: configuration.apiClientService))
                    }
                }
        }
        .environmentObject(router)
    }
}
