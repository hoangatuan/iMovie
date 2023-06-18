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
            ZStack {
                VStack {
                    if let movie = viewStore.trendingMovies.first {
                        TrendingMovieView(movie: movie)
                    }

                    Text("Genre Movies")
                }

                if viewStore.isLoading {
                    ProgressView()
                }
            }
            .onAppear {
                viewStore.send(.onAppear)
            }
        }
    }
}
