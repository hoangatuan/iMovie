//
//  MovieRepository.swift
//  iMovie
//
//  Created by Tuan Hoang on 18/06/2023.
//

import Foundation
import Network
import Models

public final class MovieRepository: IMovieRepository {
    private let apiClientService: IAPIClientService
    public init(apiClientService: IAPIClientService) {
        self.apiClientService = apiClientService
    }

    public func fetchListGenres() async throws -> [Genre] {
        try await apiClientService.request(APIEndpoints.fetchMovieListGenres(), for: GenresResponse.self).genres
    }

    public func fetchDiscoveryMovies() async throws -> [Movie] {
        try await apiClientService.request(
            APIEndpoints.fetchDiscoveryMovies(),
            mapper: TrendingMovieResponseMapper()
        )
    }

    public func fetchPopularMovies() async throws -> [Movie] {
        try await apiClientService.request(
            APIEndpoints.fetchPopularMovies(),
            mapper: TrendingMovieResponseMapper()
        )
    }

    public func fetchTrendingMovies() async throws -> [Movie] {
        try await apiClientService.request(
            APIEndpoints.fetchTrendingMovies(),
            mapper: TrendingMovieResponseMapper()
        )
    }
}
