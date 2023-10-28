//
//  SearchRepository.swift
//  iMovie
//
//  Created by Tuan Hoang on 24/06/2023.
//

import Domain
import Foundation
import Network

public final class SearchRepository: ISearchRepository {
    private let apiClientService: IAPIClientService

    public init(apiClientService: IAPIClientService) {
        self.apiClientService = apiClientService
    }

    public func searchMovies(keyword: String, page: Int) async throws -> [Movie] {
        try await apiClientService.request(
            APIEndpoints.searchMovies(query: keyword, page: page),
            mapper: TrendingMovieResponseMapper()
        )
    }

    public func searchPersons(keyword: String, page: Int) async throws -> [Person] {
        return try await apiClientService.request(
            APIEndpoints.searchPersons(query: keyword, page: page),
            mapper: SearchPersonResponseMapper()
        )
    }

    public func searchTvSeries(keyword: String, page: Int) async throws -> [TVSeries] {
        return try await apiClientService.request(
            APIEndpoints.searchTVSeries(query: keyword, page: page),
            mapper: SearchTVSeriesResponseMapper()
        )
    }
}
