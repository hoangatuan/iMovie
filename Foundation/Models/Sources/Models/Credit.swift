//
//  File.swift
//  
//
//  Created by Hoang Anh Tuan on 23/10/2023.
//

import Foundation

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
    
    public init(gender: Gender, id: Int, department: String, name: String, originalName: String, profilePath: URL?, castId: Int, popularity: Double, character: String?, job: String?) {
        self.gender = gender
        self.id = id
        self.department = department
        self.name = name
        self.originalName = originalName
        self.profilePath = profilePath
        self.castId = castId
        self.popularity = popularity
        self.character = character
        self.job = job
    }
}
