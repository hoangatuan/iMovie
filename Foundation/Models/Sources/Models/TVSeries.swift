//
//  File.swift
//  
//
//  Created by Hoang Anh Tuan on 21/10/2023.
//

import Foundation

public struct TVSeries: Equatable, Decodable {
    
    public let adult: Bool
    public let backdropPath: String?
    public let id: Int
    public let originalName: String?
    public let overview: String?
    public let popularity: Double?
    public let posterPath: String?
    public let name: String?
    public let voteAverage: Double
    public let voteCount: Double
    
}
