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
    
    func searchPersons(keyword: String, page: Int) async throws -> [Models.Actor] {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        return try await apiClientService.request(
            APIEndpoints.searchPersons(query: keyword, page: page),
            for: SearchActorResponse.self,
            decoder: decoder
        )
        .results
    }
    
    func searchTvSeries(keyword: String, page: Int) async throws -> [TVSeries] {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        return try await apiClientService.request(
            APIEndpoints.searchTVSeries(query: keyword, page: page),
            for: SearchTVSeriesResponse.self,
            decoder: decoder
        )
        .results
    }
}
