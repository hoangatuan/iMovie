//
//  MovieImage.swift
//
//
//  Created by Hoang Anh Tuan on 24/10/2023.
//

import Foundation
import HelperMacros

@DefaultInit
public struct MovieImage: Equatable {
    public let aspectRatio: Double
    public let height: Int
    public let width: Int
    public let filePath: URL?
}
