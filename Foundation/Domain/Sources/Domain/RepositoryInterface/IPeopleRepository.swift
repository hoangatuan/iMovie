//
//  File.swift
//  
//
//  Created by Tuan Hoang on 19/11/23.
//

import Foundation

public protocol IPeopleRepository {
    func fetchPersonDetail(personId: Int) async throws -> PersonDetail
    func fetchPersonImages(personId: Int) async throws -> [MovieImage]
    func fetchMovieCredit(personId: Int) async throws -> [Movie]
    func fetchTVCredit(personId: Int) async throws -> [TVSeries]
}
