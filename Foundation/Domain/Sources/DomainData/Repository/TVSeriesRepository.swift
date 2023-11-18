//
//  TVSeriesRepository.swift
//
//
//  Created by Hoang Anh Tuan on 06/11/2023.
//

import Domain
import Foundation
import Network

public final class TVSeriesRepository: ITVSeriesRepository {
    private let apiClientService: IAPIClientService
    public init(apiClientService: IAPIClientService) {
        self.apiClientService = apiClientService
    }

    public func latestTvSeries() async throws -> [TVSeries] {
        try await apiClientService.request(
            APIEndpoints.latestTvSeriesEndpoint,
            mapper: TVSeriesListResponseMapper()
        )
    }

    public func popularTvSeries() async throws -> [TVSeries] {
        try await apiClientService.request(
            APIEndpoints.popularTvSeriesEndpoint,
            mapper: TVSeriesListResponseMapper()
        )
    }
    
    public func airingTodayTVSeries() async throws -> [TVSeries] {
        try await apiClientService.request(
            APIEndpoints.airingTodayEndpoint,
            mapper: TVSeriesListResponseMapper()
        )
    }
    
    public func topRatedTVSeries() async throws -> [TVSeries] {
        try await apiClientService.request(
            APIEndpoints.topRatedEndpoint,
            mapper: TVSeriesListResponseMapper()
        )
    }
    
    public func addRating(for tvSeriesId: Int, value: Double) async throws -> Bool {
        do {
            let result = try await apiClientService.request(
                APIEndpoints.addMovieTVSeries(id: tvSeriesId, value: value),
                for: Result.self
            )
            
            return result.success
        } catch {
            return false
        }
    }
}
