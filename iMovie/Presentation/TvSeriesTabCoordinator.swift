//
//  TvSeriesTabCoordinator.swift
//  iMovie
//
//  Created by Hoang Anh Tuan on 06/11/2023.
//

import Factory
import Router
import SwiftUI
import TVSeries

struct TvSeriesTabCoordinator: View {
    @ObservedObject var router = Router()

    var body: some View {
        NavigationStack(path: $router.navPath) {
            TVSeriesCoordinator(dependencies: .init(apiClient: Container.shared.apiClientService()))
                .toolbar(.visible, for: .tabBar)
        }
        .environmentObject(router)
    }
}
