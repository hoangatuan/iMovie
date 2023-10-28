//
//  File.swift
//  
//
//  Created by Hoang Anh Tuan on 24/10/2023.
//

import Foundation

public struct AuthorDetail: Equatable {
    public let name: String
    public let username: String
    public let avatarPath: URL?
    public let rating: Int?
    
    public init(name: String, username: String, avatarPath: URL?, rating: Int?) {
        self.name = name
        self.username = username
        self.avatarPath = avatarPath
        self.rating = rating
    }
}

public struct Review: Equatable {
    public let author: String
    public let authorDetail: AuthorDetail
    public let content: String
    public let createdAt: Date
    public let id: String
    public let updatedAt: Date?
    
    public init(author: String, authorDetail: AuthorDetail, content: String, createdAt: Date, id: String, updatedAt: Date?) {
        self.author = author
        self.authorDetail = authorDetail
        self.content = content
        self.createdAt = createdAt
        self.id = id
        self.updatedAt = updatedAt
    }
}
