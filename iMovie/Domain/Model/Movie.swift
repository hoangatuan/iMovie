//
//  Movie.swift
//  iMovie
//
//  Created by Tuan Hoang on 18/06/2023.
//

import Foundation

struct Movie: Equatable {
    let id: Int
    let isAdult: Bool
    let backdropPath: URL?
    let title: String
    let originalLanguage: String
    let originalTitle: String
    let overview: String
    let posterPath: URL?
    let mediaType: String?
    let genreIds: [Int]
    let popularity: Double
    let releaseDate: String
    let hasVideo: Bool
    let voteAverage: Double
    let voteCount: Int
}
