//
//  AppEnvironment.swift
//  iMovie
//
//  Created by Tuan Hoang on 17/06/2023.
//

import Foundation

enum AppEnvironment {
    static let accessToken = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5NzNjYWJmOGVhYzAzMTJhMmVlZDJjMDM1MTg5YmIyNCIsInN1YiI6IjY0OGQyNzkxNTU5ZDIyMDBmZjEwNGZkMiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.ExyYJzCPSAG2EkramJUa_OC3o9VD6GO_qaGPg0vZEh0"
    static let baseURL = URL(string: "https://api.themoviedb.org")!
    static let imageBaseURL = URL(string: "https://image.tmdb.org/t/p/w500")!
}
