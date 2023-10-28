//
//  CreditResponse.swift
//
//
//  Created by Hoang Anh Tuan on 24/10/2023.
//

import Domain
import Foundation
import Network

struct SearchCreditResponse: Decodable {
    let cast: [CreditResponse]
}

struct SearchCreditResponseMapper: Mappable {
    func map(_ input: SearchCreditResponse) throws -> [Credit] {
        try input.cast.map { try CreditResponseMapper().map($0) }
    }
}

struct CreditResponse: Decodable {
    let gender: Gender
    let id: Int
    let department: String
    let name: String
    let originalName: String
    let profilePath: String?
    let castId: Int
    let popularity: Double
    let character: String?
    let job: String?

    enum CodingKeys: String, CodingKey {
        case gender, id, name, character, job, popularity
        case department = "known_for_department"
        case originalName = "original_name"
        case profilePath = "profile_path"
        case castId = "cast_id"
    }
}

struct CreditResponseMapper: Mappable {
    func map(_ input: CreditResponse) throws -> Credit {
        .init(
            gender: input.gender,
            id: input.id,
            department: input.department,
            name: input.name,
            originalName: input.originalName,
            profilePath: URL(string: imageBaseURL + (input.profilePath ?? "")),
            castId: input.castId,
            popularity: input.popularity,
            character: input.character,
            job: input.job
        )
    }
}
