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
}
