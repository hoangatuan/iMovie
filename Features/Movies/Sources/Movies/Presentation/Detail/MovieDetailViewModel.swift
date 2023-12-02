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
    
    struct Dependencies {
        let movie: Movie
        let movieDetailRepository: IMovieDetailRepository
        let accountRepository: IAccountRepository
    }
    
    let movie: Movie
    private let repository: IMovieDetailRepository
    private let accountRepository: IAccountRepository

    init(dependencies: Dependencies) {
        self.movie = dependencies.movie
        repository = dependencies.movieDetailRepository
        self.accountRepository = dependencies.accountRepository
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

        var isEmpty: Bool {
            switch self {
            case .shortInfo, .overview:
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
        case loading, display(data: [SectionType]), error
    }

    @Published
    var state: State = .loading
    
    @Published var isFavorite = false
    @Published var addedToWatchedList = false

    private func fetch() async {
        async let genres = repository.fetchGenres(for: movie.id)
        async let movieImages = repository.fetchImages(for: movie.id)
        async let actors = repository.fetchActors(for: movie.id)
        async let reviews = repository.fetchReviews(for: movie.id)
        async let recommendationMovies = repository.fetchRecommendationMovies(for: movie.id)
        
        async let favioriteMovies = accountRepository.fetchFavoriteMovies()
        async let watchedlistMovies = accountRepository.fetchWatchlistMovies()
        
        isFavorite = ((try? await favioriteMovies) ?? []).contains(where: { $0.id == movie.id })
        addedToWatchedList = ((try? await watchedlistMovies) ?? []).contains(where: { $0.id == movie.id })

        guard let genres = try? await genres,
              let gallery = try? await movieImages,
              let actors = try? await actors,
              let reviews = try? await reviews,
              let recommendationmovies = try? await recommendationMovies else {
            state = .error
            return
        }
        
        var result: [SectionType] = [
            .shortInfo(genres),
            .gallery(gallery),
            .overview(movie.overview),
            .actors(actors),
            .reviews(reviews),
            .recommendMovies(recommendationmovies)
        ]

        result = result.filter { !$0.isEmpty }
        state = .display(data: result)
    }
    
    func toggleFavorite() async {
        let isSuccess = await accountRepository.addFavorite(mediaType: MediaType.movie.rawValue, mediaId: movie.id, favorite: !isFavorite)
        if isSuccess {
            isFavorite.toggle()
        } else {
            // Show error
        }
    }
    
    func toggleWatchlist() async {
        let isSuccess = await accountRepository.addToWatchList(mediaType: MediaType.movie.rawValue, mediaId: movie.id, watchlist: !addedToWatchedList)
        if isSuccess {
            addedToWatchedList.toggle()
        } else {
            // Show error
        }
    }
}
