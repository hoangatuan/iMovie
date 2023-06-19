//
//  MoviesReducer.swift
//  iMovie
//
//  Created by Tuan Hoang on 18/06/2023.
//

import Foundation
import ComposableArchitecture

enum SectionType: Equatable, Identifiable {
    case discoverMovies([Movie])
    case genres([Genre])

    var id: UUID {
        return UUID()
    }
}

struct MoviesReducer: ReducerProtocol {

    struct State: Equatable {
        fileprivate(set) var isLoading = false
        fileprivate(set) var sections: [SectionType] = []
    }

    enum Action: Equatable {
        case onAppear
        case finishFetch(trendingMovies: [Movie]?, genres: [Genre]?)
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
                async let discoveryMovies = movieRepository.fetchDiscoveryMovies()
                await send(.finishFetch(trendingMovies: try? await discoveryMovies, genres: try? await genres))
            })

        case let .finishFetch(discoverMovies, genres):
            state.isLoading = false
            state.sections = prepareSections(discoverMovies: discoverMovies, genres: genres)
            return .none
        }
    }

    private func prepareSections(
        discoverMovies: [Movie]?,
        genres: [Genre]?
    ) -> [SectionType] {
        var sections: [SectionType] = []
        if let discoverMovies = discoverMovies, !discoverMovies.isEmpty {
            sections.append(.discoverMovies(discoverMovies))
        }

        if let genres = genres, !genres.isEmpty {
            sections.append(.genres(genres))
        }

        return sections
    }

}
