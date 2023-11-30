//
//  Actor.swift
//
//
//  Created by Hoang Anh Tuan on 20/10/2023.
//

import Foundation
import HelperMacros

public enum Gender: Int, Decodable {
    case male = 0
    case female
    case other
}

@DefaultInit
public struct Person: Equatable {
    public let adult: Bool
    public let gender: Gender
    public let id: Int
    public let department: String
    public let name: String?
    public let originalName: String?
    public let popularity: Double?
    public let profilePath: URL?
    public let knownFor: [KnownFor]
}

@DefaultInit
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
}
