//
//  SearchRepository.swift
//  iMovie
//
//  Created by Tuan Hoang on 24/06/2023.
//

import Foundation
import Network
import Models

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
    
    func searchPersons(keyword: String, page: Int) async throws -> [Actor] {
        return try await apiClientService.request(
            APIEndpoints.searchPersons(query: keyword, page: page),
            mapper: SearchActorResponseMapper()
        )
    }
    
    func searchTvSeries(keyword: String, page: Int) async throws -> [TVSeries] {
        return try await apiClientService.request(
            APIEndpoints.searchTVSeries(query: keyword, page: page),
            mapper: SearchTVSeriesResponseMapper()
        )
    }
}
