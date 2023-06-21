//
//  MoviesHomeReducer.swift
//  iMovie
//
//  Created by Tuan Hoang on 18/06/2023.
//

import Foundation
import ComposableArchitecture

enum SectionType: Equatable, Identifiable {
    case discoverMovies([Movie])
    case genres([Genre])
    case popularMovies([Movie])

    var id: UUID {
        return UUID()
    }
}

struct MoviesHomeReducer: ReducerProtocol {

    struct State: Equatable {
        var isLoading = false
        var sections: [SectionType] = []
    }

    enum Action: Equatable {
        case onAppear
        case finishFetch(discoveryMovies: [Movie]?, genres: [Genre]?, popularMovies: [Movie]?)
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
                async let popularMovies = movieRepository.fetchPopularMovies()
                await send(.finishFetch(
                    discoveryMovies: try? await discoveryMovies,
                    genres: try? await genres,
                    popularMovies: try? await popularMovies
                ))
            })

        case let .finishFetch(discoverMovies, genres, popularMovies):
            state.isLoading = false
            state.sections = prepareSections(discoverMovies: discoverMovies, genres: genres, popularMovies: popularMovies)
            return .none
        }
    }

    private func prepareSections(
        discoverMovies: [Movie]?,
        genres: [Genre]?,
        popularMovies: [Movie]?
    ) -> [SectionType] {
        var sections: [SectionType] = []
        if let discoverMovies = discoverMovies, !discoverMovies.isEmpty {
            sections.append(.discoverMovies(discoverMovies))
        }

        if let genres = genres, !genres.isEmpty {
            sections.append(.genres(genres))
        }

        if let popularMovies = popularMovies, !popularMovies.isEmpty {
            sections.append(.popularMovies(popularMovies))
        }

        return sections
    }

}
