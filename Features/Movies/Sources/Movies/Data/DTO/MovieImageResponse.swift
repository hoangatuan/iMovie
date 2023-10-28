//
//  MovieImageResponse.swift
//
//
//  Created by Hoang Anh Tuan on 24/10/2023.
//

import Foundation
import Models
import Network

struct SearchMovieImageResponse: Decodable {
    let backdrops: [MovieImageResponse]
}

struct SearchMovieImageResponseMapper: Mappable {
    func map(_ input: SearchMovieImageResponse) throws -> [MovieImage] {
        try input.backdrops.map { try MovieImageResponseMapper().map($0) }
    }
}

struct MovieImageResponse: Decodable {
    let aspectRatio: Double
    let height: Int
    let width: Int
    let filePath: String?

    enum CodingKeys: String, CodingKey {
        case height, width
        case aspectRatio = "aspect_ratio"
        case filePath = "file_path"
    }
}

struct MovieImageResponseMapper: Mappable {
    func map(_ input: MovieImageResponse) throws -> MovieImage {
        .init(
            aspectRatio: input.aspectRatio,
            height: input.height,
            width: input.width,
            filePath: URL(string: imageBaseURL + (input.filePath ?? ""))
        )
    }
}
