//
//  MovieDetailView.swift
//
//
//  Created by Hoang Anh Tuan on 23/10/2023.
//

import CommonUI
import Domain
import Router
import SwiftUI

struct MovieDetailView: View {
    @EnvironmentObject private var router: Router
    @StateObject private var viewModel: MovieDetailViewModel

    init(viewModel: MovieDetailViewModel) {
        _viewModel = .init(wrappedValue: viewModel)
    }

    var body: some View {
        ZStack {
            Color.color040F23
                .ignoresSafeArea()
                .frame(maxWidth: .infinity, maxHeight: .infinity)

            switch viewModel.state {
            case .loading:
                EmptyView()
            // TODO: UI for loading state using default shimmer
            case let .display(sections):
                ZStack(alignment: .bottom) {
                    List {
                        ForEach(sections) { section in
                            switch section {
                            case let .shortInfo(genres):
                                MovieDetailShortInfoSectionView(movie: viewModel.movie, genres: genres)
                            case let .gallery(images):
                                MovieGallerySectionView(movieImages: images)
                            case let .overview(content):
                                Text(content)
                                    .font(.regular14)
                                    .foregroundColor(.gray)
                                    .listRowInsets(EdgeInsets(top: 24, leading: 16, bottom: 0, trailing: 16))
                                    .listRowBackground(Color.clear)
                            case let .actors(actors):
                                MovieActorSectionView(actors: actors)
                            case let .reviews(reviews):
                                ReviewSectionView(reviews: reviews)
                            case let .recommendMovies(movies):
                                PopularSectionView(sectionTitle: "You may also like...", movies: movies)
                            }
                        }
                    }
                    .listStyle(PlainListStyle())
                    .padding(.bottom, 52)
                    
                    UserActionSectionView(
                        isFavorite: viewModel.isFavorite,
                        isWatchlist: viewModel.addedToWatchedList,
                        onSelect: { action in
                            switch action {
                            case .toggleFavorite:
                                Task {
                                    await viewModel.toggleFavorite()
                                }
                            case .share:
                                router.presentSheet(destination: MovieSheetDesination.share(movie: viewModel.movie))
                            case .toggleWatchlist:
                                Task {
                                    await viewModel.toggleWatchlist()
                                }
                            }
                        }
                    )
                        .frame(height: 52)
                        .background(Color.color040F23)
                }
            case .error:
                EmptyView()
            }
        }
        .ignoresSafeArea(edges: .top)
        .customBackButton(action: {
            router.navigateBack()
        })
        .toolbar(.hidden, for: .tabBar)
    }
}

extension Double {
    var integerValue: Int {
        let components = String(self).split(separator: ".")
        return Int(components[0]) ?? 0
    }

    var firstDecimalValue: Int {
        let components = String(self).split(separator: ".")
        let decimalPart = String(components[1])
        let firstDecimal = decimalPart.first.map { String($0) } ?? ""
        return Int(firstDecimal) ?? 0
    }
}
