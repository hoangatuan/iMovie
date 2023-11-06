//
//  APIEndpoints.swift
//  iMovie
//
//  Created by Tuan Hoang on 18/06/2023.
//

import Foundation
import Network

enum APIEndpoints {
    // TODO: This is just a temporary solution. Need to inject these infos from the App level when create APIClientService
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

    static func fetchMoviesByGenre(_ genreId: Int) -> APIEndpoint {
        .init(
            baseURL: baseURL,
            path: "/3/discover/movie",
            httpMethod: .get,
            urlQueries: [
                "with_genres": "\(genreId)",
            ],
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

// Search
extension APIEndpoints {
    static func searchMovies(query: String, page: Int = 1) -> APIEndpoint {
        return .init(
            baseURL: baseURL,
            path: "/3/search/movie",
            httpMethod: .get,
            urlQueries: ["query": query, "page": String(page)],
            headers: baseHeaders
        )
    }

    static func searchTVSeries(query: String, page: Int = 1) -> APIEndpoint {
        return .init(
            baseURL: baseURL,
            path: "/3/search/tv",
            httpMethod: .get,
            urlQueries: ["query": query, "page": String(page)],
            headers: baseHeaders
        )
    }

    static func searchPersons(query: String, page: Int = 1) -> APIEndpoint {
        return .init(
            baseURL: baseURL,
            path: "/3/search/person",
            httpMethod: .get,
            urlQueries: ["query": query, "page": String(page)],
            headers: baseHeaders
        )
    }
}

// TVSeries
extension APIEndpoints {
    static var popularTvSeriesEndpoint: APIEndpoint {
        return .init(
            baseURL: baseURL,
            path: "/3/tv/popular",
            httpMethod: .get,
            headers: baseHeaders
        )
    }

    static var latestTvSeriesEndpoint: APIEndpoint {
        return .init(
            baseURL: baseURL,
            path: "/3/tv/on_the_air",
            httpMethod: .get,
            headers: baseHeaders
        )
    }
}
