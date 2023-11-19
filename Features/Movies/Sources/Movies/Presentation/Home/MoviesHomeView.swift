//
//  MoviesHomeView.swift
//  iMovie
//
//  Created by Tuan Hoang on 18/06/2023.
//

import DesignSystem
import SwiftUI
import Network
import Domain

struct MoviesHomeView: View {
    @StateObject private var viewModel: MoviesHomeViewModel

    init(repository: IMovieRepository) {
        _viewModel = .init(wrappedValue: MoviesHomeViewModel(movieRepository: repository))
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
                    List {
                        ForEach(sections) { section in
                            switch section {
                            case let .discover(movies):
                                DiscoveryMoviesSectionView(movies: movies)
                            case let .genres(genres):
                                GenresSectionView(genres: genres)
                            case let .popular(movies):
                                PopularSectionView(sectionTitle: "Popular Movies", movies: movies)
                            case let .latest(movies):
                                NowPlayingSectionView(movies: movies)
                            case let .topRated(movies):
                                TopRatedMoviesSectionView(movies: movies)
                            case let .trending(movies):
                                PopularSectionView(sectionTitle: "Trending", movies: movies)
                            }
                        }
                    }
                    .listStyle(PlainListStyle())
                case .error:
                    EmptyView()
                }
            }
            .ignoresSafeArea(edges: .top)
        }
    }
}
