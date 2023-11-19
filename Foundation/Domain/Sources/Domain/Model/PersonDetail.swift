//
//  File.swift
//  
//
//  Created by Tuan Hoang on 19/11/23.
//

import Foundation

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
    
    public init(adult: Bool, biography: String, birthday: String, gender: Gender, id: Int, name: String, profilePath: URL?, department: String, placeOfBirth: String) {
        self.adult = adult
        self.biography = biography
        self.birthday = birthday
        self.gender = gender
        self.id = id
        self.name = name
        self.profilePath = profilePath
        self.department = department
        self.placeOfBirth = placeOfBirth
    }
}
