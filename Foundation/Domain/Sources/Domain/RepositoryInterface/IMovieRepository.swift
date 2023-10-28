//
//  IMovieRepository.swift
//  iMovie
//
//  Created by Tuan Hoang on 18/06/2023.
//

import Foundation

public protocol IMovieRepository {
    func fetchListGenres() async throws -> [Genre]
    func fetchDiscoveryMovies() async throws -> [Movie]
    func fetchTrendingMovies() async throws -> [Movie]
    func fetchPopularMovies() async throws -> [Movie]
    func fetchTopRatedMovies() async throws -> [Movie]
    func fetchLatestMovies() async throws -> [Movie]
}
