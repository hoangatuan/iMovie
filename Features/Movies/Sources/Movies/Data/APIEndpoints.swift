//
//  APIEndpoints.swift
//  iMovie
//
//  Created by Tuan Hoang on 18/06/2023.
//

import Foundation
import Network

enum APIEndpoints {
    // TODO: (Tuan): This is just a temporary solution. Need update it
    // swiftlint:disable:next line_length
    private static let accessToken = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5NzNjYWJmOGVhYzAzMTJhMmVlZDJjMDM1MTg5YmIyNCIsInN1YiI6IjY0OGQyNzkxNTU5ZDIyMDBmZjEwNGZkMiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.ExyYJzCPSAG2EkramJUa_OC3o9VD6GO_qaGPg0vZEh0"
    private static let baseURL = URL(string: "https://api.themoviedb.org")!

    private static let baseHeaders = [
        "accept": "application/json",
        "Authorization": "Bearer \(accessToken)",
    ]

    static var fetchMovieListGenresEndpoint: APIEndpoint {
        .init(
            baseURL: baseURL,
            path: "/3/genre/movie/list",
            httpMethod: .get,
            headers: baseHeaders
        )
    }

    static var fetchDiscoveryMoviesEndpoint: APIEndpoint {
        .init(
            baseURL: baseURL,
            path: "/3/discover/movie",
            httpMethod: .get,
            headers: baseHeaders
        )
    }

    static var fetchPopularMoviesEndpoint: APIEndpoint {
        .init(
            baseURL: baseURL,
            path: "/3/movie/popular",
            httpMethod: .get,
            headers: baseHeaders
        )
    }

    static var fetchTrendingMoviesEndpoint: APIEndpoint {
        .init(
            baseURL: baseURL,
            path: "/3/trending/movie/day",
            httpMethod: .get,
            headers: baseHeaders
        )
    }

    static var fetchLatestMoviesEndpoint: APIEndpoint {
        .init(
            baseURL: baseURL,
            path: "/3/movie/now_playing",
            httpMethod: .get,
            headers: baseHeaders
        )
    }

    static var fetchTopRatedMoviesEndpoint: APIEndpoint {
        .init(
            baseURL: baseURL,
            path: "/3/movie/top_rated",
            httpMethod: .get,
            headers: baseHeaders
        )
    }

    // Movie detail
    static func fetchMovieDetail(for movieId: Int) -> APIEndpoint {
        .init(
            baseURL: baseURL,
            path: "/3/movie/\(movieId)",
            httpMethod: .get,
            headers: baseHeaders
        )
    }

    static func fetchMovieImages(for movieId: Int) -> APIEndpoint {
        .init(
            baseURL: baseURL,
            path: "/3/movie/\(movieId)/images",
            httpMethod: .get,
            headers: baseHeaders
        )
    }

    static func fetchCredits(for movieId: Int) -> APIEndpoint {
        .init(
            baseURL: baseURL,
            path: "/3/movie/\(movieId)/credits",
            httpMethod: .get,
            headers: baseHeaders
        )
    }

    static func fetchRecommendationMovies(for movieId: Int) -> APIEndpoint {
        .init(
            baseURL: baseURL,
            path: "/3/movie/\(movieId)/similar", // acutally the API should be /recommendations, but it ususally returns empty results, so I change to use /similar endpoint
            httpMethod: .get,
            headers: baseHeaders
        )
    }

    static func fetchReviews(for movieId: Int) -> APIEndpoint {
        .init(
            baseURL: baseURL,
            path: "/3/movie/\(movieId)/reviews",
            httpMethod: .get,
            headers: baseHeaders
        )
    }

    static func fetchVideos(for movieId: Int) -> APIEndpoint {
        .init(
            baseURL: baseURL,
            path: "/3/movie/\(movieId)/videos",
            httpMethod: .get,
            headers: baseHeaders
        )
    }
}
