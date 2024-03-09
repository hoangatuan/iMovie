//
//  MovieDetail.swift
//
//
//  Created by Hoang Anh Tuan on 24/10/2023.
//

import Foundation
//import HelperMacros
//
//@DefaultInit
public struct GenreDetail: Equatable, Decodable {
    public let id: Int
    public let name: String
    
    public init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
}

public struct MovieDetail: Equatable, Decodable {
    public let genres: [GenreDetail]
    
    public init(genres: [GenreDetail]) {
        self.genres = genres
    }
}
