//
//  MovieRepositoryMock.swift
//  iMovieTests
//
//  Created by Tuan Hoang on 21/06/2023.
//

import Foundation
@testable import iMovie

final class MovieRepositoryMock: IMovieRepository {
    func fetchListGenres() async throws -> [Genre] {
        return [.init(id: 1, name: .action)]
    }

    func fetchDiscoveryMovies() async throws -> [Movie] {
        return [
            .init(id: 1)
        ]
    }

    func fetchTrendingMovies() async throws -> [Movie] {
        return [
            .init(id: 2)
        ]
    }

    func fetchPopularMovies() async throws -> [Movie] {
        return [
            .init(id: 3)
        ]
    }
}
