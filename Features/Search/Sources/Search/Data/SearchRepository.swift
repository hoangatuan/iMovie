//
//  SearchRepository.swift
//  iMovie
//
//  Created by Tuan Hoang on 24/06/2023.
//

import Foundation
import Models
import Network

final class SearchRepository: ISearchRepository {
    private let apiClientService: IAPIClientService

    init(apiClientService: IAPIClientService) {
        self.apiClientService = apiClientService
    }

    func searchMovies(keyword: String, page: Int) async throws -> [Movie] {
        try await apiClientService.request(
            APIEndpoints.searchMovies(query: keyword, page: page),
            mapper: TrendingMovieResponseMapper()
        )
    }

    func searchPersons(keyword: String, page: Int) async throws -> [Person] {
        return try await apiClientService.request(
            APIEndpoints.searchPersons(query: keyword, page: page),
            mapper: SearchPersonResponseMapper()
        )
    }

    func searchTvSeries(keyword: String, page: Int) async throws -> [TVSeries] {
        return try await apiClientService.request(
            APIEndpoints.searchTVSeries(query: keyword, page: page),
            mapper: SearchTVSeriesResponseMapper()
        )
    }
}
