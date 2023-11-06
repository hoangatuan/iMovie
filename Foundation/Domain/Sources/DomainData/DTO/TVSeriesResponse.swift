//
//  TVSeriesResponse.swift
//
//
//  Created by Hoang Anh Tuan on 06/11/2023.
//

import Domain
import Foundation
import Network

struct TVSeriesListResponse: Decodable {
    let results: [TVSeriesResponse]
}

struct TVSeriesListResponseMapper: Mappable {
    func map(_ input: TVSeriesListResponse) throws -> [TVSeries] {
        return try input.results.map { try TVSeriesResponseMapper().map($0) }
    }
}

struct TVSeriesResponse: Decodable {
    let adult: Bool
    let backdropPath: String?
    let id: Int
    let originalName: String
    let overview: String
    let popularity: Double
    let posterPath: String?
    let name: String
    let voteAverage: Double
    let voteCount: Double

    enum CodingKeys: String, CodingKey {
        case id, adult, name, overview, popularity
        case backdropPath = "backdrop_path"
        case originalName = "original_name"
        case posterPath = "poster_path"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

struct TVSeriesResponseMapper: Mappable {
    func map(_ input: TVSeriesResponse) throws -> TVSeries {
        .init(
            adult: input.adult,
            backdropPath: URL(string: imageBaseURL + (input.backdropPath ?? "")),
            id: input.id,
            originalName: input.originalName,
            overview: input.overview,
            popularity: input.popularity,
            posterPath: URL(string: imageBaseURL + (input.posterPath ?? "")),
            name: input.name,
            voteAverage: input.voteAverage,
            voteCount: input.voteCount
        )
    }
}
