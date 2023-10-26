//
//  File.swift
//  
//
//  Created by Hoang Anh Tuan on 24/10/2023.
//

import Foundation

public struct GenreDetail: Equatable, Decodable {
    public let id: Int
    public let name: String
}

public struct MovieDetail: Equatable, Decodable {
    public let genres: [GenreDetail]
}
