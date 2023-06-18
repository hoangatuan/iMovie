//
//  MoviesReducer.swift
//  iMovie
//
//  Created by Tuan Hoang on 18/06/2023.
//

import Foundation
import ComposableArchitecture

struct MoviesReducer: ReducerProtocol {

    struct State: Equatable {
        fileprivate(set) var isLoading = false
        fileprivate(set) var genres: [Genre] = []
        fileprivate(set) var trendingMovies: [Movie] = []
    }

    enum Action: Equatable {
        case onAppear
        case errorOccur
        case finishFetch(trendingMovies: [Movie], genres: [Genre])
    }

    private let movieRepository: IMovieRepository
    init(movieRepository: IMovieRepository) {
        self.movieRepository = movieRepository
    }

    func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
        switch action {
        case .onAppear:
            state.isLoading = true
            return .run(operation: { send in
                async let genres = movieRepository.fetchListGenres()
                async let trendingMovies = movieRepository.fetchTrendingMovies()
                await send(.finishFetch(trendingMovies: try await trendingMovies, genres: try await genres))
            }, catch: { error, send in
                await send(.errorOccur)
            })

        case let .finishFetch(trendingMovies, genres):
            state.isLoading = false
            state.trendingMovies = trendingMovies
            state.genres = genres
            return .none

        case .errorOccur:
            state.isLoading = false
            return .none
        }
    }

}
