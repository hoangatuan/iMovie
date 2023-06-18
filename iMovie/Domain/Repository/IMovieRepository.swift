//
//  IMovieRepository.swift
//  iMovie
//
//  Created by Tuan Hoang on 18/06/2023.
//

import Foundation

protocol IMovieRepository {
    func fetchListGenres() async throws -> [Genre]
    func fetchTrendingMovies() async throws -> [Movie]
}
