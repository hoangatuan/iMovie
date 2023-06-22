//
//  MoviesHomeView.swift
//  iMovie
//
//  Created by Tuan Hoang on 18/06/2023.
//

import SwiftUI
import ComposableArchitecture

struct MoviesHomeView: View {
    let store: StoreOf<MoviesHomeReducer>
    
    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            ZStack {
                Color(red: 4/255, green: 15/255, blue: 35/255)
                    .ignoresSafeArea()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)

                VStack {
                    List {
                        ForEach(viewStore.sections) { section in
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
            }
            .ignoresSafeArea()
            .onAppear {
                viewStore.send(.onAppear)
            }
        }
    }
}
