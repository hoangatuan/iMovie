//
//  MovieResponseTests.swift
//  
//
//  Created by Hoang Anh Tuan on 21/10/2023.
//

import XCTest

@testable import Search
@testable import Models

final class MovieResponseTests: XCTestCase {
    
    func testMovieResponseMapper_mapCorrectly() {
        let movieResponse = MovieResponse(
            id: 1,
            adult: true,
            backdropPath: "/backdropPath",
            title: "title",
            originalLanguage: "originalLanguage",
            originalTitle: "originalTitle",
            overview: "overview",
            posterPath: "/posterPath",
            mediaType: "mediaType",
            genreIds: [1, 2],
            popularity: 9.0,
            releaseDate: "releaseDate",
            video: true,
            voteAverage: 10.0,
            voteCount: 100
        )
        
        let result = try! TrendingMovieResponseMapper().map(.init(results: [movieResponse]))
        
        XCTAssertEqual(result.count, 1)
        
        let movie = result[0]
        
        XCTAssertEqual(movie.id, 1)
        XCTAssertEqual(movie.isAdult, true)
        XCTAssertEqual(movie.backdropPath, URL(string: "https://image.tmdb.org/t/p/w500/backdropPath"))
        XCTAssertEqual(movie.posterPath, URL(string: "https://image.tmdb.org/t/p/w500/posterPath"))
    }
    
}
