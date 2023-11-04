//
//  MovieRepository.swift
//  iMovie
//
//  Created by Tuan Hoang on 18/06/2023.
//

import Domain
import Foundation
import Network

public final class MovieRepository: IMovieRepository {
    private let apiClientService: IAPIClientService
    public init(apiClientService: IAPIClientService) {
        self.apiClientService = apiClientService
    }

    public func fetchListGenres() async throws -> [Genre] {
        try await apiClientService.request(
            APIEndpoints.fetchMovieListGenresEndpoint,
            for: GenresResponse.self
        ).genres
    }

    public func fetchDiscoveryMovies() async throws -> [Movie] {
        try await apiClientService.request(
            APIEndpoints.fetchDiscoveryMoviesEndpoint,
            mapper: TrendingMovieResponseMapper()
        )
    }

    public func fetchPopularMovies() async throws -> [Movie] {
        try await apiClientService.request(
            APIEndpoints.fetchPopularMoviesEndpoint,
            mapper: TrendingMovieResponseMapper()
        )
    }

    public func fetchLatestMovies() async throws -> [Movie] {
        try await apiClientService.request(
            APIEndpoints.fetchLatestMoviesEndpoint,
            mapper: TrendingMovieResponseMapper()
        )
    }

    public func fetchTopRatedMovies() async throws -> [Movie] {
        try await apiClientService.request(
            APIEndpoints.fetchTopRatedMoviesEndpoint,
            mapper: TrendingMovieResponseMapper()
        )
    }

    public func fetchTrendingMovies() async throws -> [Movie] {
        try await apiClientService.request(
            APIEndpoints.fetchTrendingMoviesEndpoint,
            mapper: TrendingMovieResponseMapper()
        )
    }

    public func fetchMoviesByGenre(_ genreId: Int) async throws -> [Movie] {
        try await apiClientService.request(
            APIEndpoints.fetchMoviesByGenre(genreId),
            mapper: TrendingMovieResponseMapper()
        )
    }
}
