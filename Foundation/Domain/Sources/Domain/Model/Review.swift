//
//  Review.swift
//
//
//  Created by Hoang Anh Tuan on 24/10/2023.
//

import Foundation
import HelperMacros

@DefaultInit
public struct AuthorDetail: Equatable {
    public let name: String
    public let username: String
    public let avatarPath: URL?
    public let rating: Int?
}

@DefaultInit
public struct Review: Equatable {
    public let author: String
    public let authorDetail: AuthorDetail
    public let content: String
    public let createdAt: Date
    public let id: String
    public let updatedAt: Date?
}
