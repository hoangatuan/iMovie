//
//  TVSeries.swift
//
//
//  Created by Hoang Anh Tuan on 21/10/2023.
//

import Foundation
import HelperMacros

@DefaultInit
public struct TVSeries: Equatable, Hashable, Decodable {
    public let adult: Bool
    public let backdropPath: URL?
    public let id: Int
    public let originalName: String?
    public let overview: String?
    public let popularity: Double?
    public let posterPath: URL?
    public let name: String?
    public let voteAverage: Double
    public let voteCount: Double
}
