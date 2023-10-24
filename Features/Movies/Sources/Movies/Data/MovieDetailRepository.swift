//
//  File.swift
//  
//
//  Created by Hoang Anh Tuan on 24/10/2023.
//

import Foundation
import Network
import Models

final class MovieDetailRepository: IMovieDetailRepository {
    
    private let apiClientService: IAPIClientService
    init(apiClientService: IAPIClientService) {
        self.apiClientService = apiClientService
    }
    
    func fetchGenres(for movieId: Int) async throws -> [GenreDetail] {
        try await apiClientService.request(
            APIEndpoints.fetchMovieDetail(for: movieId),
            for: MovieDetail.self
        ).genres
    }
    
    func fetchImages(for movieId: Int) async throws -> [MovieImage] {
        try await apiClientService.request(
            APIEndpoints.fetchMovieImages(for: movieId),
            mapper: SearchMovieImageResponseMapper()
        )
    }
    
    func fetchActors(for movieId: Int) async throws -> [Credit] {
        try await apiClientService.request(
            APIEndpoints.fetchCredits(for: movieId),
            mapper: SearchCreditResponseMapper()
        )
    }
    
    func fetchReviews(for movieId: Int) async throws -> [Review] {
        try await apiClientService.request(
            APIEndpoints.fetchReviews(for: movieId),
            mapper: SearchReviewResponseMapper()
        )
    }
    
    func fetchRecommendationMovies(for movieId: Int) async throws -> [Movie] {
        try await apiClientService.request(
            APIEndpoints.fetchRecommendationMovies(for: movieId),
            mapper: TrendingMovieResponseMapper()
        )
    }
    
}
