//
//  File.swift
//  
//
//  Created by Hoang Anh Tuan on 20/10/2023.
//

import Foundation

public enum Gender: Int, Decodable {
    case male = 0
    case female
    case other
}

public struct Actor: Equatable, Decodable {
    
    public let adult: Bool
    public let gender: Gender
    public let id: Int
    public let name: String?
    public let originalName: String?
    public let popularity: Double?
    public let profilePath: String?
    public let knownFor: [KnownFor]
}

public struct KnownFor: Equatable, Decodable {
    
    public let backdropPath: String?
    public let id: Int
    public let title: String?
    public let originalTitle: String?
    public let overview: String?
    public let posterPath: String?
    public let popularity: Double?
    public let mediaType: String?
    public let voteAverage: Double?
    public let voteCount: Int?
    
}
