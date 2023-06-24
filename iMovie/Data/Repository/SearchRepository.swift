//
//  SearchRepository.swift
//  iMovie
//
//  Created by Tuan Hoang on 24/06/2023.
//

import Foundation
import Network

final class SearchRepository: ISearchRepository {
    private let apiClientService: IAPIClientService
    init(apiClientService: IAPIClientService) {
        self.apiClientService = apiClientService
    }

    func search(keyword: String) async throws -> [Movie] {
        // TODO (Tuan): To add real search API
        try await apiClientService.request(
            APIEndpoints.fetchDiscoveryMovies(),
            mapper: TrendingMovieResponseMapper()
        )
    }
}
