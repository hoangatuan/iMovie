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
    private static let accessToken = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5NzNjYWJmOGVhYzAzMTJhMmVlZDJjMDM1MTg5YmIyNCIsInN1YiI6IjY0OGQyNzkxNTU5ZDIyMDBmZjEwNGZkMiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.ExyYJzCPSAG2EkramJUa_OC3o9VD6GO_qaGPg0vZEh0"
    private static let baseURL = URL(string: "https://api.themoviedb.org")!
    
    private static let baseHeaders = [
        "accept": "application/json",
        "Authorization": "Bearer \(accessToken)"
    ]

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
