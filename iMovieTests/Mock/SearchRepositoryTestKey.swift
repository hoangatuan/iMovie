//
//  SearchRepositoryTestKey.swift
//  iMovieTests
//
//  Created by Tuan Hoang on 24/06/2023.
//

import Foundation
import ComposableArchitecture
@testable import iMovie

extension SearchRepository: TestDependencyKey {
    static var testValue: ISearchRepository {
        SearchRepositoryMock()
    }
}

final class SearchRepositoryMock: ISearchRepository {

    func search(keyword: String) async throws -> [Movie] {
        return [.init(id: 1)]
    }
}
