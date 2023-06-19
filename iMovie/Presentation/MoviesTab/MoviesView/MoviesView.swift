//
//  MoviesView.swift
//  iMovie
//
//  Created by Tuan Hoang on 18/06/2023.
//

import SwiftUI
import ComposableArchitecture

struct MoviesView: View {
    let store: StoreOf<MoviesReducer>
    
    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            VStack {
                List {
                    ForEach(viewStore.sections) { section in
                        switch section {
                        case let .discoverMovies(movies):
                            DiscoveryMoviesSectionView(movies: movies)
                        case let .genres(genres):
                            GenresSectionView(genres: genres)
                        }
                    }
                }
                .listStyle(PlainListStyle())
            }
            .onAppear {
                viewStore.send(.onAppear)
            }
        }
    }
}
