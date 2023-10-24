//
//  File.swift
//  
//
//  Created by Hoang Anh Tuan on 24/10/2023.
//

import Foundation
import Network
import Models

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
    
    enum CodingKeys: String, CodingKey {
        case name, username
        case avatarPath = "avater_path"
    }
}

struct AuthorDetailResponseMapper: Mappable {
    func map(_ input: AuthorDetailResponse) throws -> AuthorDetail {
        .init(
            name: input.name,
            username: input.username,
            avatarPath: URL(string: imageBaseURL + (input.avatarPath ?? ""))
        )
    }
}

struct ReviewResponse: Decodable {
    let author: String
    let authorDetail: AuthorDetailResponse
    let content: String
    let createdAt: Date
    let id: String
    let updatedAt: Date?
}

struct ReviewResponseMapper: Mappable {
    func map(_ input: ReviewResponse) throws -> Review {
        .init(
            author: input.author,
            authorDetail: try AuthorDetailResponseMapper().map(input.authorDetail),
            content: input.content,
            createdAt: input.createdAt,
            id: input.id,
            updatedAt: input.updatedAt
        )
    }
}
