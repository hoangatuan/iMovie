//
//  MovieImage.swift
//
//
//  Created by Hoang Anh Tuan on 24/10/2023.
//

import Foundation

public struct MovieImage: Equatable {
    public let aspectRatio: Double
    public let height: Int
    public let width: Int
    public let filePath: URL?

    public init(aspectRatio: Double, height: Int, width: Int, filePath: URL?) {
        self.aspectRatio = aspectRatio
        self.height = height
        self.width = width
        self.filePath = filePath
    }
}
