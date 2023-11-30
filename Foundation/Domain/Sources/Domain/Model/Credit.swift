//
//  Credit.swift
//
//
//  Created by Hoang Anh Tuan on 23/10/2023.
//

import Foundation
import HelperMacros

@DefaultInit
public struct Credit: Equatable {
    public let gender: Gender
    public let id: Int
    public let department: String
    public let name: String
    public let originalName: String
    public let profilePath: URL?
    public let castId: Int
    public let popularity: Double
    public let character: String?
    public let job: String?
}
