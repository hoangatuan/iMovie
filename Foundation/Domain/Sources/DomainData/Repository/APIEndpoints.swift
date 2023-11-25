//
//  APIEndpoints.swift
//  iMovie
//
//  Created by Tuan Hoang on 18/06/2023.
//

import Foundation
import Network

enum APIEndpoints {
    static var fetchMovieListGenresEndpoint: APIEndpoint {
        .init(
            path: "/3/genre/movie/list",
            httpMethod: .get
        )
    }

    static var fetchDiscoveryMoviesEndpoint: APIEndpoint {
        .init(
            path: "/3/discover/movie",
            httpMethod: .get
        )
    }

    static var fetchPopularMoviesEndpoint: APIEndpoint {
        .init(
            path: "/3/movie/popular",
            httpMethod: .get
        )
    }

    static var fetchTrendingMoviesEndpoint: APIEndpoint {
        .init(
            path: "/3/trending/movie/day",
            httpMethod: .get
        )
    }

    static var fetchLatestMoviesEndpoint: APIEndpoint {
        .init(
            path: "/3/movie/now_playing",
            httpMethod: .get
        )
    }

    static var fetchTopRatedMoviesEndpoint: APIEndpoint {
        .init(
            path: "/3/movie/top_rated",
            httpMethod: .get
        )
    }

    static func fetchMoviesByGenre(_ genreId: Int) -> APIEndpoint {
        .init(
            path: "/3/discover/movie",
            httpMethod: .get,
            urlQueries: [
                "with_genres": "\(genreId)",
            ]
        )
    }

    // Movie detail
    static func fetchMovieDetail(for movieId: Int) -> APIEndpoint {
        .init(
            path: "/3/movie/\(movieId)",
            httpMethod: .get
        )
    }

    static func fetchMovieImages(for movieId: Int) -> APIEndpoint {
        .init(
            path: "/3/movie/\(movieId)/images",
            httpMethod: .get
        )
    }

    static func fetchCredits(for movieId: Int) -> APIEndpoint {
        .init(
            path: "/3/movie/\(movieId)/credits",
            httpMethod: .get
        )
    }

    static func fetchRecommendationMovies(for movieId: Int) -> APIEndpoint {
        .init(
            path: "/3/movie/\(movieId)/similar", // acutally the API should be /recommendations, but it ususally returns empty results, so I change to use /similar endpoint
            httpMethod: .get
        )
    }

    static func fetchReviews(for movieId: Int) -> APIEndpoint {
        .init(
            path: "/3/movie/\(movieId)/reviews",
            httpMethod: .get
        )
    }

    static func fetchVideos(for movieId: Int) -> APIEndpoint {
        .init(
            path: "/3/movie/\(movieId)/videos",
            httpMethod: .get
        )
    }
    
    static func addMovieRating(movieId: Int, value: Double) -> APIEndpoint {
        return .init(
            path: "/3/movie/\(movieId)/rating",
            httpMethod: .post,
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
            path: "/3/search/movie",
            httpMethod: .get,
            urlQueries: ["query": query, "page": String(page)]
        )
    }

    static func searchTVSeries(query: String, page: Int = 1) -> APIEndpoint {
        return .init(
            path: "/3/search/tv",
            httpMethod: .get,
            urlQueries: ["query": query, "page": String(page)]
        )
    }

    static func searchPersons(query: String, page: Int = 1) -> APIEndpoint {
        return .init(
            path: "/3/search/person",
            httpMethod: .get,
            urlQueries: ["query": query, "page": String(page)]
        )
    }
}

// TVSeries
extension APIEndpoints {
    static var popularTvSeriesEndpoint: APIEndpoint {
        return .init(
            path: "/3/tv/popular",
            httpMethod: .get
        )
    }

    static var latestTvSeriesEndpoint: APIEndpoint {
        return .init(
            path: "/3/tv/on_the_air",
            httpMethod: .get
        )
    }
    
    static var airingTodayEndpoint: APIEndpoint {
        return .init(
            path: "/3/tv/airing_today",
            httpMethod: .get
        )
    }
    
    static var topRatedEndpoint: APIEndpoint {
        return .init(
            path: "/3/tv/top_rated",
            httpMethod: .get
        )
    }
    
    static func addMovieTVSeries(id: Int, value: Double) -> APIEndpoint {
        return .init(
            path: "/3/tv/\(id)/rating",
            httpMethod: .post,
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
            path: "/3/account/20023836/favorite",
            httpMethod: .post,
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
            path: "/3/account/20023836/watchlist",
            httpMethod: .post,
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
            path: "/3/account/20023836/favorite/movies",
            httpMethod: .get
        )
    }
    
    static var fetchFavoriteTVSeriesEndpoint: APIEndpoint {
        .init(
            path: "/3/account/20023836/favorite/tv",
            httpMethod: .get
        )
    }
    
    static var fetchWatchlistMoviesEndpoint: APIEndpoint {
        .init(
            path: "/3/account/20023836/watchlist/movies",
            httpMethod: .get
        )
    }
    
    static var fetchWatchlistTVEndpoint: APIEndpoint {
        .init(
            path: "/3/account/20023836/watchlist/tv",
            httpMethod: .get
        )
    }
}

// MARK: - People
extension APIEndpoints {
    static func fetchPersonDetail(personId: Int) -> APIEndpoint {
        .init(
            path: "/3/person/\(personId)",
            httpMethod: .get
        )
    }
    
    static func fetchPersonImages(personId: Int) -> APIEndpoint {
        .init(
            path: "/3/person/\(personId)/images",
            httpMethod: .get
        )
    }
    
    static func fetchPersonMovieCredit(personId: Int) -> APIEndpoint {
        .init(
            path: "/3/person/\(personId)/movie_credits",
            httpMethod: .get
        )
    }
    
    static func fetchPersonTVCredit(personId: Int) -> APIEndpoint {
        .init(
            path: "/3/person/\(personId)/tv_credits",
            httpMethod: .get
        )
    }
}
