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
        "content-type": "application/json"
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
    
    static func addMovieRating(movieId: Int, value: Double) -> APIEndpoint {
        return .init(
            baseURL: baseURL,
            path: "/3/movie/\(movieId)/rating",
            httpMethod: .post,
            headers: baseHeaders,
            bodyParameter: .dictionary(
                [
                    "value": value
                ]
            )
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
    
    static var airingTodayEndpoint: APIEndpoint {
        return .init(
            baseURL: baseURL,
            path: "/3/tv/airing_today",
            httpMethod: .get,
            headers: baseHeaders
        )
    }
    
    static var topRatedEndpoint: APIEndpoint {
        return .init(
            baseURL: baseURL,
            path: "/3/tv/top_rated",
            httpMethod: .get,
            headers: baseHeaders
        )
    }
    
    static func addMovieTVSeries(id: Int, value: Double) -> APIEndpoint {
        return .init(
            baseURL: baseURL,
            path: "/3/tv/\(id)/rating",
            httpMethod: .post,
            headers: baseHeaders,
            bodyParameter: .dictionary(
                [
                    "value": value
                ]
            )
        )
    }
}

// MARK: - Account
extension APIEndpoints {
    static func addFavorite(mediaType: String, mediaId: Int, favorite: Bool) -> APIEndpoint {
        return .init(
            baseURL: baseURL,
            path: "/3/account/20023836/favorite",
            httpMethod: .post,
            headers: baseHeaders,
            bodyParameter: .dictionary(
                [
                    "media_type": mediaType,
                    "media_id": mediaId,
                    "favorite": favorite
                ]
            )
        )
    }
    
    static func addToWatchlist(mediaType: String, mediaId: Int, watchlist: Bool) -> APIEndpoint {
        return .init(
            baseURL: baseURL,
            path: "/3/account/20023836/watchlist",
            httpMethod: .post,
            headers: baseHeaders,
            bodyParameter: .dictionary(
                [
                    "media_type": mediaType,
                    "media_id": mediaId,
                    "watchlist": watchlist
                ]
            )
        )
    }
    
    static var fetchFavoriteMoviesEndpoint: APIEndpoint {
        .init(
            baseURL: baseURL,
            path: "/3/account/20023836/favorite/movies",
            httpMethod: .get,
            headers: baseHeaders
        )
    }
    
    static var fetchFavoriteTVSeriesEndpoint: APIEndpoint {
        .init(
            baseURL: baseURL,
            path: "/3/account/20023836/favorite/tv",
            httpMethod: .get,
            headers: baseHeaders
        )
    }
    
    static var fetchWatchlistMoviesEndpoint: APIEndpoint {
        .init(
            baseURL: baseURL,
            path: "/3/account/20023836/watchlist/movies",
            httpMethod: .get,
            headers: baseHeaders
        )
    }
    
    static var fetchWatchlistTVEndpoint: APIEndpoint {
        .init(
            baseURL: baseURL,
            path: "/3/account/20023836/watchlist/tv",
            httpMethod: .get,
            headers: baseHeaders
        )
    }
}

// MARK: - People
extension APIEndpoints {
    static func fetchPersonDetail(personId: Int) -> APIEndpoint {
        .init(
            baseURL: baseURL,
            path: "/3/person/\(personId)",
            httpMethod: .get,
            headers: baseHeaders
        )
    }
    
    static func fetchPersonImages(personId: Int) -> APIEndpoint {
        .init(
            baseURL: baseURL,
            path: "/3/person/\(personId)/images",
            httpMethod: .get,
            headers: baseHeaders
        )
    }
    
    static func fetchPersonMovieCredit(personId: Int) -> APIEndpoint {
        .init(
            baseURL: baseURL,
            path: "/3/person/\(personId)/movie_credits",
            httpMethod: .get,
            headers: baseHeaders
        )
    }
    
    static func fetchPersonTVCredit(personId: Int) -> APIEndpoint {
        .init(
            baseURL: baseURL,
            path: "/3/person/\(personId)/tv_credits",
            httpMethod: .get,
            headers: baseHeaders
        )
    }
}
