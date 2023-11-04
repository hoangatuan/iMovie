//
//  GenreMoviesViewModel.swift
//
//
//  Created by Hoang Anh Tuan on 03/11/2023.
//

import Domain
import Foundation

@MainActor
final class GenreMoviesViewModel: ObservableObject {
    let genre: Genre
    let repository: IMovieRepository

    init(genre: Genre, repository: IMovieRepository) {
        self.genre = genre
        self.repository = repository
    }

    enum State {
        case loading, display([Movie]), error
    }

    private var movies: [Movie] = []

    @Published
    var state: State = .loading

    func fetch() async {
        do {
            let movies = try await repository.fetchMoviesByGenre(genre.id)
            self.movies = movies
            state = .display(movies)
        } catch {
            state = .error
        }
    }

    func applyFilter(_ filter: FilterState) {
        switch filter {
        case .all:
            state = .display(movies)
        case .nameAscending:
            let sortedMovies = movies.sorted(by: { $0.title < $1.title })
            state = .display(sortedMovies)
        case .nameDescending:
            let sortedMovies = movies.sorted(by: { $0.title > $1.title })
            state = .display(sortedMovies)
        case .rating:
            let sortedMovies = movies.sorted(by: { $0.voteAverage > $1.voteAverage })
            state = .display(sortedMovies)
        }
    }
}
