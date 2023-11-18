//
//  MovieDetailRepository.swift
//
//
//  Created by Hoang Anh Tuan on 24/10/2023.
//

import Domain
import Foundation
import Network

public final class MovieDetailRepository: IMovieDetailRepository {
    private let apiClientService: IAPIClientService
    public init(apiClientService: IAPIClientService) {
        self.apiClientService = apiClientService
    }

    public func fetchGenres(for movieId: Int) async throws -> [GenreDetail] {
        try await apiClientService.request(
            APIEndpoints.fetchMovieDetail(for: movieId),
            for: MovieDetail.self
        ).genres
    }

    public func fetchImages(for movieId: Int) async throws -> [MovieImage] {
        try await apiClientService.request(
            APIEndpoints.fetchMovieImages(for: movieId),
            mapper: SearchMovieImageResponseMapper()
        )
    }

    public func fetchActors(for movieId: Int) async throws -> [Credit] {
        try await apiClientService.request(
            APIEndpoints.fetchCredits(for: movieId),
            mapper: SearchCreditResponseMapper()
        )
    }

    public func fetchReviews(for movieId: Int) async throws -> [Review] {
        try await apiClientService.request(
            APIEndpoints.fetchReviews(for: movieId),
            mapper: SearchReviewResponseMapper()
        )
    }

    public func fetchRecommendationMovies(for movieId: Int) async throws -> [Movie] {
        try await apiClientService.request(
            APIEndpoints.fetchRecommendationMovies(for: movieId),
            mapper: TrendingMovieResponseMapper()
        )
    }
    
    public func addRating(for movieId: Int, value: Double) async throws -> Bool {
        do {
            let result = try await apiClientService.request(
                APIEndpoints.addMovieRating(movieId: movieId, value: value),
                for: Result.self
            )
            
            return result.success
        } catch {
            return false
        }
    }
}
