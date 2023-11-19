//
//  SwiftUIView.swift
//  
//
//  Created by Tuan Hoang on 19/11/23.
//

import CommonUI
import Domain
import Router
import SwiftUI

struct PersonDetailView: View {
    
    @EnvironmentObject private var router: Router
    @StateObject private var viewModel: PersonDetailViewModel
    
    init(viewModel: PersonDetailViewModel) {
        _viewModel = .init(wrappedValue: viewModel)
    }
    
    var body: some View {
        ZStack {
            Color.color040F23
                .ignoresSafeArea()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            VStack {
                switch viewModel.state {
                case .loading:
                    EmptyView()
                // TODO: UI for loading state using default shimmer
                case let .display(sections):
                    List {
                        ForEach(sections) { section in
                            switch section {
                            case let .detailInfo(detail, numberOfFilms):
                                DetailInfoSectionView(detail: detail, numberOfFilms: numberOfFilms)
                            case let .images(images):
                                CreditImagesSectionView(images: images)
                            case let .movies(movies):
                                CreditMoviesSectionView(movies: movies)
                            case let .tvSeries(tvSeries):
                                CreditTVSeriesSectionView(tvSeries: tvSeries)
                            }
                        }
                    }
                    .listStyle(PlainListStyle())
                case .error:
                    EmptyView()
                // TODO: UI for error
                }
            }
        }
//        .ignoresSafeArea(edges: .top)
        .customBackButton(action: {
            router.navigateBack()
        })
        .toolbar(.hidden, for: .tabBar)
    }
}
