//
//  MoviesHomeView.swift
//  iMovie
//
//  Created by Tuan Hoang on 18/06/2023.
//

import SwiftUI

public struct MoviesHomeView: View {
    @StateObject private var viewModel: MoviesHomeViewModel
    
    public init(viewModel: MoviesHomeViewModel) {
        self._viewModel = .init(wrappedValue: viewModel)
    }
    
    public var body: some View {
        NavigationView {
            ZStack {
                Color(red: 4/255, green: 15/255, blue: 35/255)
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
                        }
                    case let .error(error):
                        EmptyView()
                }
            }
            .ignoresSafeArea()
            .task {
                await viewModel.fetch()
            }
        }
    }
}