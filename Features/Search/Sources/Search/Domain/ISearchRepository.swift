//
//  ISearchRepository.swift
//  iMovie
//
//  Created by Tuan Hoang on 24/06/2023.
//

import Foundation
import Network
import Models

protocol ISearchRepository {
    func searchMovies(keyword: String, page: Int) async throws -> [Movie]
    func searchTvSeries(keyword: String, page: Int) async throws -> [TVSeries]
    func searchPersons(keyword: String, page: Int) async throws -> [Person]
}
