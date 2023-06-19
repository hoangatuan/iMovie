//
//  APIEndpoints.swift
//  iMovie
//
//  Created by Tuan Hoang on 18/06/2023.
//

import Foundation
import Network

enum APIEndpoints {

    // TODO (Tuan): This is just a temporary solution. Need update it
    private static let baseHeaders = [
        "accept": "application/json",
        "Authorization": "Bearer \(AppEnvironment.accessToken)"
    ]

    static func fetchMovieListGenres() -> APIEndpoint {
        return .init(
            baseURL: AppEnvironment.baseURL,
            path: "/3/genre/movie/list",
            httpMethod: .get,
            headers: baseHeaders
        )
    }

    static func fetchDiscoveryMovies() -> APIEndpoint {
        .init(
            baseURL: AppEnvironment.baseURL,
            path: "/3/discover/movie",
            httpMethod: .get,
            headers: baseHeaders
        )
    }

    static func fetchTrendingMovies() -> APIEndpoint {
        return .init(
            baseURL: AppEnvironment.baseURL,
            path: "/3/trending/movie/day",
            httpMethod: .get,
            headers: baseHeaders
        )
    }

    
}
