//
//  SearchResponse.swift
//
//
//  Created by Hoang Anh Tuan on 21/10/2023.
//

import Domain
import Foundation
import Network

struct SearchPersonResponse: Decodable {
    let results: [PersonResponse]
}

struct SearchPersonResponseMapper: Mappable {
    func map(_ input: SearchPersonResponse) throws -> [Person] {
        try input.results.map { try PersonResponseMapper().map($0) }
    }
}

struct PersonResponse: Decodable {
    let adult: Bool
    let gender: Gender
    let id: Int
    let department: String
    let name: String?
    let popularity: Double?
    let originalName: String?
    let profilePath: String?
    let knownFor: [KnownForResponse]

    enum CodingKeys: String, CodingKey {
        case adult, gender, id, name, popularity
        case originalName = "original_name"
        case profilePath = "profile_path"
        case knownFor = "known_for"
        case department = "known_for_department"
    }
}

struct KnownForResponse: Decodable {
    let backdropPath: String?
    let id: Int
    let title: String?
    let originalTitle: String?
    let overview: String?
    let posterPath: String?
    let popularity: Double?
    let mediaType: String?
    let voteAverage: Double?
    let voteCount: Int?

    enum CodingKeys: String, CodingKey {
        case id, title, overview, popularity
        case backdropPath = "backdrop_path"
        case originalTitle = "original_title"
        case posterPath = "poster_path"
        case mediaType = "media_type"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

struct PersonResponseMapper: Mappable {
    // TODO: Need refector to avoid duplication
    let imageBaseURL = "https://image.tmdb.org/t/p/w500"

    func map(_ input: PersonResponse) throws -> Person {
        try .init(
            adult: input.adult,
            gender: input.gender,
            id: input.id,
            department: input.department,
            name: input.name,
            originalName: input.originalName,
            popularity: input.popularity,
            profilePath: URL(string: imageBaseURL + (input.profilePath ?? "")),
            knownFor: input.knownFor.map { try KnowForResponseMapper().map($0) }
        )
    }
}

struct KnowForResponseMapper: Mappable {
    // TODO: Need refector to avoid duplication
    let imageBaseURL = "https://image.tmdb.org/t/p/w500"

    func map(_ input: KnownForResponse) throws -> KnownFor {
        .init(
            backdropPath: URL(string: imageBaseURL + (input.backdropPath ?? "")),
            id: input.id,
            title: input.title,
            originalTitle: input.originalTitle,
            overview: input.overview,
            posterPath: URL(string: imageBaseURL + (input.posterPath ?? "")),
            popularity: input.popularity,
            mediaType: input.mediaType,
            voteAverage: input.voteAverage,
            voteCount: input.voteCount
        )
    }
}

struct SearchTVSeriesResponse: Decodable {
    let results: [TVSeriresResponse]
}

struct SearchTVSeriesResponseMapper: Mappable {
    func map(_ input: SearchTVSeriesResponse) throws -> [TVSeries] {
        return try input.results.map { try TVseriresResposeMappable().map($0) }
    }
}

struct TVSeriresResponse: Decodable {
    let adult: Bool
    let backdropPath: String?
    let id: Int
    let originalName: String?
    let overview: String?
    let popularity: Double?
    let posterPath: String?
    let name: String?
    let voteAverage: Double
    let voteCount: Double

    enum CodingKeys: String, CodingKey {
        case id, adult, overview, popularity, name
        case backdropPath = "backdrop_path"
        case originalName = "original_name"
        case posterPath = "poster_path"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

struct TVseriresResposeMappable: Mappable {
    // TODO: Need refector to avoid duplication
    let imageBaseURL = "https://image.tmdb.org/t/p/w500"

    func map(_ input: TVSeriresResponse) throws -> TVSeries {
        return .init(
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
