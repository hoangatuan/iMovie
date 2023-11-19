//
//  File.swift
//  
//
//  Created by Tuan Hoang on 19/11/23.
//

import Foundation
import Domain
import Network

struct PersondetaiMapper: Mappable {
    func map(_ input: PersonDetailResponse) throws -> PersonDetail {
        .init(
            adult: input.adult,
            biography: input.biography,
            birthday: input.birthday,
            gender: input.gender,
            id: input.id,
            name: input.name,
            profilePath: URL(string: imageBaseURL + (input.profilePath ?? "")),
            department: input.department,
            placeOfBirth: input.placeOfBirth
        )
    }
}

struct PersonDetailResponse: Decodable {
    let adult: Bool
    let biography: String
    let birthday: String
    let gender: Gender
    let id: Int
    let name: String
    let profilePath: String?
    let department: String
    let placeOfBirth: String
    
    enum CodingKeys: String, CodingKey {
        case adult, gender, id, name, biography, birthday
        case profilePath = "profile_path"
        case placeOfBirth = "place_of_birth"
        case department = "known_for_department"
    }
}

struct PersonImageResponse: Decodable {
    let profiles: [MovieImageResponse]
}

struct PersonImageResponseMapper: Mappable {
    func map(_ input: PersonImageResponse) throws -> [MovieImage] {
        try input.profiles.map { try MovieImageResponseMapper().map($0) }
    }
}

struct PersonMovieCreditResponse: Decodable {
    let cast: [MovieResponse]
}

struct PersonMovieCreditResponseMapper: Mappable {
    func map(_ input: PersonMovieCreditResponse) throws -> [Movie] {
        return try input.cast.map { try MovieResponseMapper().map($0) }
    }
}

struct PersonTVCreditResponse: Decodable {
    let cast: [TVSeriesResponse]
}

struct PersonTVCreditResponseMapper: Mappable {
    func map(_ input: PersonTVCreditResponse) throws -> [TVSeries] {
        return try input.cast.map { try TVSeriesResponseMapper().map($0) }
    }
}
