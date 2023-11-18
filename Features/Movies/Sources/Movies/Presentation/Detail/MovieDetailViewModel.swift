//
//  MovieDetailViewModel.swift
//
//
//  Created by Hoang Anh Tuan on 23/10/2023.
//

import Domain
import DomainData
import Foundation

@MainActor
final class MovieDetailViewModel: ObservableObject {
    let movie: Movie
    private let repository: IMovieDetailRepository

    init(movie: Movie, movieRepository: IMovieDetailRepository) {
        self.movie = movie
        repository = movieRepository

        Task {
            await fetch()
        }
    }

    enum SectionType: Equatable, Identifiable {
        case shortInfo([GenreDetail])
        case gallery([MovieImage])
        case overview(String)
        case actors([Credit])
        case reviews([Review])
        case recommendMovies([Movie])
        case userActions

        var isEmpty: Bool {
            switch self {
            case .shortInfo, .overview, .userActions:
                return false
            case let .gallery(array):
                return array.isEmpty
            case let .actors(array):
                return array.isEmpty
            case let .reviews(array):
                return array.isEmpty
            case let .recommendMovies(array):
                return array.isEmpty
            }
        }

        var id: UUID {
            return UUID()
        }
    }

    enum State {
        case loading, display(data: [SectionType]), error(error: Error)
    }

    @Published
    var state: State = .loading

    private func fetch() async {
        async let genres = repository.fetchGenres(for: movie.id)
        async let movieImages = repository.fetchImages(for: movie.id)
        async let actors = repository.fetchActors(for: movie.id)
        async let reviews = repository.fetchReviews(for: movie.id)
        async let recommendationMovies = repository.fetchRecommendationMovies(for: movie.id)

        var result: [SectionType] = [
            .shortInfo((try? await genres) ?? []),
            .gallery((try? await movieImages) ?? []),
            .overview(movie.overview),
            .actors((try? await actors) ?? []),
            .reviews((try? await reviews) ?? []),
            .recommendMovies((try? await recommendationMovies) ?? []),
            .userActions
        ]

        result = result.filter { !$0.isEmpty }

        state = .display(data: result)
    }
}
