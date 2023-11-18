//
//  File.swift
//  
//
//  Created by Tuan Hoang on 18/11/23.
//

import Foundation

public protocol IAccountRepository {
    func addToWatchList(mediaType: String, mediaId: Int, watchlist: Bool) async -> Bool
    func addFavorite(mediaType: String, mediaId: Int, favorite: Bool) async -> Bool
    func fetchFavoriteMovies() async throws -> [Movie]
    func fetchFavoriteTV() async throws -> [TVSeries]
    func fetchWatchlistMovies() async throws -> [Movie]
    func fetchWatchlistTV() async throws -> [TVSeries]
}
