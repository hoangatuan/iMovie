//
//  ReviewResponse.swift
//
//
//  Created by Hoang Anh Tuan on 24/10/2023.
//

import Domain
import Foundation
import Network

let imageBaseURL = "https://image.tmdb.org/t/p/w500"

struct SearchReviewResponse: Decodable {
    let results: [ReviewResponse]
}

struct SearchReviewResponseMapper: Mappable {
    func map(_ input: SearchReviewResponse) throws -> [Review] {
        try input.results.map { try ReviewResponseMapper().map($0) }
    }
}

struct AuthorDetailResponse: Decodable {
    let name: String
    let username: String
    let avatarPath: String?
    let rating: Int?

    enum CodingKeys: String, CodingKey {
        case name, username, rating
        case avatarPath = "avatar_path"
    }
}

struct AuthorDetailResponseMapper: Mappable {
    func map(_ input: AuthorDetailResponse) throws -> AuthorDetail {
        .init(
            name: input.name,
            username: input.username,
            avatarPath: URL(string: imageBaseURL + (input.avatarPath ?? "")),
            rating: input.rating
        )
    }
}

struct ReviewResponse: Decodable {
    let author: String
    let authorDetail: AuthorDetailResponse
    let content: String
    let createdAt: String
    let id: String
    let updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case author, content, id
        case authorDetail = "author_details"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

struct ReviewResponseMapper: Mappable {
    func map(_ input: ReviewResponse) throws -> Review {
        try .init(
            author: input.author,
            authorDetail: AuthorDetailResponseMapper().map(input.authorDetail),
            content: input.content,
            createdAt: Date(),
            id: input.id,
            updatedAt: Date()
        )
    }
}
