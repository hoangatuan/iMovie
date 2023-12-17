//
//  File.swift
//  
//
//  Created by Tuan Hoang on 18/11/23.
//

import Foundation
import Domain
import Network

public final class AccountRepository: IAccountRepository {

    private let apiClientService: IAPIClientService
    public init(apiClientService: IAPIClientService) {
        self.apiClientService = apiClientService
    }

    public func addToWatchList(mediaType: String, mediaId: Int, watchlist: Bool) async -> Bool {
        do {
            let result = try await apiClientService.request(
                APIEndpoints.addToWatchlist(mediaType: mediaType, mediaId: mediaId, watchlist: watchlist),
                for: Result.self
            )

            return result.success
        } catch {
            return false
        }
    }

    public func addFavorite(mediaType: String, mediaId: Int, favorite: Bool) async -> Bool {
        do {
            let result = try await apiClientService.request(
                APIEndpoints.addFavorite(mediaType: mediaType, mediaId: mediaId, favorite: favorite),
                for: Result.self
            )

            return result.success
        } catch {
            return false
        }
    }

    public func fetchFavoriteMovies() async throws -> [Movie] {
        try await apiClientService.request(
            APIEndpoints.fetchFavoriteMoviesEndpoint,
            mapper: TrendingMovieResponseMapper()
        )
    }

    public func fetchFavoriteTV() async throws -> [TVSeries] {
        try await apiClientService.request(
            APIEndpoints.fetchFavoriteTVSeriesEndpoint,
            mapper: TVSeriesListResponseMapper()
        )
    }

    public func fetchWatchlistMovies() async throws -> [Movie] {
        try await apiClientService.request(
            APIEndpoints.fetchWatchlistMoviesEndpoint,
            mapper: TrendingMovieResponseMapper()
        )
    }

    public func fetchWatchlistTV() async throws -> [TVSeries] {
        try await apiClientService.request(
            APIEndpoints.fetchWatchlistTVEndpoint,
            mapper: TVSeriesListResponseMapper()
        )
    }
}
