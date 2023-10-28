//
//  MoviesHomeViewModel.swift
//  iMovie
//
//  Created by Hoang Anh Tuan on 15/10/2023.
//

import Domain
import DomainData
import Foundation

@MainActor
final class MoviesHomeViewModel: ObservableObject {
    private let movieRepository: IMovieRepository

    init(movieRepository: IMovieRepository) {
        self.movieRepository = movieRepository

        Task {
            await fetch()
        }
    }

    enum SectionType: Equatable, Identifiable {
        case discover([Movie])
        case genres([Genre])
        case popular([Movie])
        case latest([Movie])
        case topRated([Movie])
        case trending([Movie])

        var id: UUID {
            return UUID()
        }

        var isEmpty: Bool {
            switch self {
            case let .discover(array), let .popular(array), let .latest(array), let .topRated(array), let .trending(array):
                return array.isEmpty
            case let .genres(array):
                return array.isEmpty
            }
        }
    }

    enum State {
        case loading, display(data: [SectionType]), error(error: Error)
    }

    @Published
    var state: State = .loading

    func fetch() async {
        async let discoveryMovies = movieRepository.fetchDiscoveryMovies()
        async let genres = movieRepository.fetchListGenres()
        async let popularMovies = movieRepository.fetchPopularMovies()
        async let latestMovies = movieRepository.fetchLatestMovies()
        async let topRatingMovies = movieRepository.fetchTopRatedMovies()
        async let trendingMovies = movieRepository.fetchTrendingMovies()

        var sections: [SectionType] = [
            .discover((try? await discoveryMovies) ?? []),
            .genres((try? await genres) ?? []),
            .popular((try? await popularMovies) ?? []),
            .latest((try? await latestMovies) ?? []),
            .topRated((try? await topRatingMovies) ?? []),
            .trending((try? await trendingMovies) ?? []),
        ]

        sections = sections.filter { !$0.isEmpty }
        // TODO: Handle error
        state = .display(data: sections)
    }
}
