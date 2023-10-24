//
//  File.swift
//  
//
//  Created by Hoang Anh Tuan on 24/10/2023.
//

import Foundation
import Models

protocol IMovieDetailRepository {
    func fetchGenres(for movieId: Int) async throws -> [GenreDetail]
    func fetchImages(for movieId: Int) async throws -> [MovieImage]
    func fetchActors(for movieId: Int) async throws -> [Credit]
    func fetchReviews(for movieId: Int) async throws -> [Review]
    func fetchRecommendationMovies(for movieId: Int) async throws -> [Movie]
}
