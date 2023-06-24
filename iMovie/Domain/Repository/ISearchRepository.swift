//
//  ISearchRepository.swift
//  iMovie
//
//  Created by Tuan Hoang on 24/06/2023.
//

import Foundation
import Network

protocol ISearchRepository {
    func search(keyword: String) async throws -> [Movie]
}
