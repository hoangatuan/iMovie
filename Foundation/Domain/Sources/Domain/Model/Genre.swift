//
//  Genre.swift
//  iMovie
//
//  Created by Tuan Hoang on 18/06/2023.
//

import Foundation

public struct Genre: Decodable, Equatable, Hashable {
    public enum GenreType: String, Decodable {
        case action = "Action"
        case adventure = "Adventure"
        case animation = "Animation"
        case comedy = "Comedy"
        case crime = "Crime"
        case documentary = "Documentary"
        case drama = "Drama"
        case family = "Family"
        case fantasy = "Fantasy"
        case history = "History"
        case horror = "Horror"
        case music = "Music"
        case mystery = "Mystery"
        case scienceFiction = "Science Fiction"
        case tvMovie = "TV Movie"
        case thriller = "Thriller"
        case war = "War"
        case western = "Western"
        case romance = "Romance"
    }

    public let id: Int
    public let name: GenreType

    public init(id: Int, name: GenreType) {
        self.id = id
        self.name = name
    }
}
