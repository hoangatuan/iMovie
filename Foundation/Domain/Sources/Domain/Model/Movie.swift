//
//  Movie.swift
//  iMovie
//
//  Created by Tuan Hoang on 18/06/2023.
//

import Foundation
import HelperMacros

@DefaultInit
public struct Movie: Equatable, Hashable {
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
}
