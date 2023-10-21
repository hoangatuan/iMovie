//
//  MovieResponse.swift
//  iMovie
//
//  Created by Tuan Hoang on 18/06/2023.
//

import Foundation
import Network
import Models

struct TrendingMovieResponse: Decodable {
    let results: [MovieResponse]
}

struct TrendingMovieResponseMapper: Mappable {
    func map(_ input: TrendingMovieResponse) throws -> [Movie] {
        return try input.results.map { try MovieResponseMapper().map($0) }
    }
}

struct MovieResponse: Decodable {
    let id: Int
    let adult: Bool
    let backdropPath: String?
    let title: String
    let originalLanguage: String
    let originalTitle: String
    let overview: String
    let posterPath: String?
    let mediaType: String?
    let genreIds: [Int]
    let popularity: Double
    let releaseDate: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int

    enum CodingKeys: String, CodingKey {
        case id, adult, title,overview, popularity, video
        case backdropPath = "backdrop_path"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case posterPath = "poster_path"
        case mediaType = "media_type"
        case genreIds = "genre_ids"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

struct MovieResponseMapper: Mappable {
    static let imageBaseURL = URL(string: "https://image.tmdb.org/t/p/w500")!
    
    func map(_ input: MovieResponse) throws -> Movie {
        let backdropPath = input.backdropPath == nil ? nil : URL(string: MovieResponseMapper.imageBaseURL.absoluteString + input.backdropPath!)
        let posterPath = input.posterPath == nil ? nil : URL(string: MovieResponseMapper.imageBaseURL.absoluteString + input.posterPath!)
        
        return .init(
            id: input.id,
            isAdult: input.adult,
            backdropPath: backdropPath,
            title: input.title,
            originalLanguage: input.originalLanguage,
            originalTitle: input.originalTitle,
            overview: input.overview,
            posterPath: posterPath,
            mediaType: input.mediaType,
            genreIds: input.genreIds,
            popularity: input.popularity,
            releaseDate: input.releaseDate,
            hasVideo: input.video,
            voteAverage: input.voteAverage,
            voteCount: input.voteCount
        )
    }
}
