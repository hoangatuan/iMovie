//
//  Genre.swift
//  iMovie
//
//  Created by Tuan Hoang on 18/06/2023.
//

import Foundation

struct Genre: Decodable, Equatable {

    enum GenreType: String, Decodable {
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

    let id: Int
    let name: GenreType

}
