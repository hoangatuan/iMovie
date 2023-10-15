//
//  GenresResponse.swift
//  iMovie
//
//  Created by Tuan Hoang on 18/06/2023.
//

import Foundation
import Models

public struct GenresResponse: Decodable {
    let genres: [Genre]
}
