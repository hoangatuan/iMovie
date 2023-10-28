//
//  TVSeries.swift
//
//
//  Created by Hoang Anh Tuan on 21/10/2023.
//

import Foundation

public struct TVSeries: Equatable, Decodable {
    public let adult: Bool
    public let backdropPath: URL?
    public let id: Int
    public let originalName: String?
    public let overview: String?
    public let popularity: Double?
    public let posterPath: URL?
    public let name: String?
    public let voteAverage: Double
    public let voteCount: Double

    public init(
        adult: Bool,
        backdropPath: URL?,
        id: Int,
        originalName: String?,
        overview: String?,
        popularity: Double?,
        posterPath: URL?,
        name: String?,
        voteAverage: Double,
        voteCount: Double
    ) {
        self.adult = adult
        self.backdropPath = backdropPath
        self.id = id
        self.originalName = originalName
        self.overview = overview
        self.popularity = popularity
        self.posterPath = posterPath
        self.name = name
        self.voteAverage = voteAverage
        self.voteCount = voteCount
    }
}
