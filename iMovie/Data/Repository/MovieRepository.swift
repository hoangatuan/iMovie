//
//  MovieRepository.swift
//  iMovie
//
//  Created by Tuan Hoang on 18/06/2023.
//

import Foundation
import Network

final class MovieRepository: IMovieRepository {
    private let apiClientService: IAPIClientService
    init(apiClientService: IAPIClientService) {
        self.apiClientService = apiClientService
    }

    func fetchListGenres() async throws -> [Genre] {
        try await apiClientService.request(APIEndpoints.fetchMovieListGenres(), for: GenresResponse.self).genres
    }

    func fetchTrendingMovies() async throws -> [Movie] {
        try await apiClientService.request(
            APIEndpoints.fetchTrendingMovies(),
            mapper: TrendingMovieResponseMapper()
        )
    }
}
