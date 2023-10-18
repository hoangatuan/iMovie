//
//  MoviesHomeView.swift
//  iMovie
//
//  Created by Tuan Hoang on 18/06/2023.
//

import SwiftUI
import DesignSystem

struct MoviesHomeView: View {
    @StateObject private var viewModel: MoviesHomeViewModel
    
    init(viewModel: MoviesHomeViewModel) {
        self._viewModel = .init(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.color040F23
                    .ignoresSafeArea()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                switch viewModel.state {
                    case .loading:
                        EmptyView()
                    case let .display(sections):
                        VStack {
                            List {
                                ForEach(sections) { section in
                                    switch section {
                                    case let .discoverMovies(movies):
                                        DiscoveryMoviesSectionView(movies: movies)
                                    case let .genres(genres):
                                        GenresSectionView(genres: genres)
                                    case let .popularMovies(movies):
                                        PopularSectionView(movies: movies)
                                    }
                                }
                            }
                            .listStyle(PlainListStyle())
                            
                            Spacer()
                        }
                    case let .error(error):
                        EmptyView()
                }
            }
            .ignoresSafeArea(edges: .top)
            .task {
                await viewModel.fetch()
            }
        }
    }
}
