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

public struct Actor: Equatable {
    
    public let adult: Bool
    public let gender: Gender
    public let id: Int
    public let name: String?
    public let originalName: String?
    public let popularity: Double?
    public let profilePath: URL?
    public let knownFor: [KnownFor]
    
    public init(adult: Bool, gender: Gender, id: Int, name: String?, originalName: String?, popularity: Double?, profilePath: URL?, knownFor: [KnownFor]) {
        self.adult = adult
        self.gender = gender
        self.id = id
        self.name = name
        self.originalName = originalName
        self.popularity = popularity
        self.profilePath = profilePath
        self.knownFor = knownFor
    }
}

public struct KnownFor: Equatable {
    
    public let backdropPath: URL?
    public let id: Int
    public let title: String?
    public let originalTitle: String?
    public let overview: String?
    public let posterPath: URL?
    public let popularity: Double?
    public let mediaType: String?
    public let voteAverage: Double?
    public let voteCount: Int?
    
    public init(backdropPath: URL?, id: Int, title: String?, originalTitle: String?, overview: String?, posterPath: URL?, popularity: Double?, mediaType: String?, voteAverage: Double?, voteCount: Int?) {
        self.backdropPath = backdropPath
        self.id = id
        self.title = title
        self.originalTitle = originalTitle
        self.overview = overview
        self.posterPath = posterPath
        self.popularity = popularity
        self.mediaType = mediaType
        self.voteAverage = voteAverage
        self.voteCount = voteCount
    }
}
