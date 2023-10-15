//
//  Movie.swift
//  iMovie
//
//  Created by Tuan Hoang on 18/06/2023.
//

import Foundation

public struct Movie: Equatable {
    public let id: Int
    public let isAdult: Bool
    public let backdropPath: URL?
    public let title: String
    public let originalLanguage: String
    public let originalTitle: String
    public let overview: String
    public let posterPath: URL?
    public let mediaType: String?
    public let genreIds: [Int]
    public let popularity: Double
    public let releaseDate: String
    public let hasVideo: Bool
    public let voteAverage: Double
    public let voteCount: Int
    
    public init(
        id: Int,
        isAdult: Bool,
        backdropPath: URL?,
        title: String,
        originalLanguage: String,
        originalTitle: String,
        overview: String,
        posterPath: URL?,
        mediaType: String?,
        genreIds: [Int],
        popularity: Double,
        releaseDate: String,
        hasVideo: Bool,
        voteAverage: Double,
        voteCount: Int
    ) {
        self.id = id
        self.isAdult = isAdult
        self.backdropPath = backdropPath
        self.title = title
        self.originalLanguage = originalLanguage
        self.originalTitle = originalTitle
        self.overview = overview
        self.posterPath = posterPath
        self.mediaType = mediaType
        self.genreIds = genreIds
        self.popularity = popularity
        self.releaseDate = releaseDate
        self.hasVideo = hasVideo
        self.voteAverage = voteAverage
        self.voteCount = voteCount
    }
}
