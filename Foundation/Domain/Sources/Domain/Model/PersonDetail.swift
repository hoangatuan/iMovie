//
//  File.swift
//  
//
//  Created by Tuan Hoang on 19/11/23.
//

import Foundation
import HelperMacros

@DefaultInit
public struct PersonDetail: Equatable {
    public let adult: Bool
    public let biography: String
    public let birthday: String
    public let gender: Gender
    public let id: Int
    public let name: String
    public let profilePath: URL?
    public let department: String
    public let placeOfBirth: String
}
