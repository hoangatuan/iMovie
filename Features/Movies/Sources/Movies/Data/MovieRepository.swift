//
//  MovieRepository.swift
//  iMovie
//
//  Created by Tuan Hoang on 18/06/2023.
//

import Foundation
import Network
import Models

final class MovieRepository: IMovieRepository {
    private let apiClientService: IAPIClientService
    init(apiClientService: IAPIClientService) {
        self.apiClientService = apiClientService
    }

    func fetchListGenres() async throws -> [Genre] {
        try await apiClientService.request(
            APIEndpoints.fetchMovieListGenresEndpoint,
            for: GenresResponse.self
        ).genres
    }

    func fetchDiscoveryMovies() async throws -> [Movie] {
        try await apiClientService.request(
            APIEndpoints.fetchDiscoveryMoviesEndpoint,
            mapper: TrendingMovieResponseMapper()
        )
    }

    func fetchPopularMovies() async throws -> [Movie] {
        try await apiClientService.request(
            APIEndpoints.fetchPopularMoviesEndpoint,
            mapper: TrendingMovieResponseMapper()
        )
    }
    
    func fetchLatestMovies() async throws -> [Movie] {
        try await apiClientService.request(
            APIEndpoints.fetchLatestMoviesEndpoint,
            mapper: TrendingMovieResponseMapper()
        )
    }
    
    func fetchTopRatedMovies() async throws -> [Movie] {
        try await apiClientService.request(
            APIEndpoints.fetchTopRatedMoviesEndpoint,
            mapper: TrendingMovieResponseMapper()
        )
    }

    func fetchTrendingMovies() async throws -> [Movie] {
        try await apiClientService.request(
            APIEndpoints.fetchTrendingMoviesEndpoint,
            mapper: TrendingMovieResponseMapper()
        )
    }
}
