//
//  GenresResponse.swift
//  iMovie
//
//  Created by Tuan Hoang on 18/06/2023.
//

import Domain
import Foundation

struct GenresResponse: Decodable {
    let genres: [Genre]
}
