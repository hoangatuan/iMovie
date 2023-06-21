//
//  Movie+.swift
//  iMovieTests
//
//  Created by Tuan Hoang on 21/06/2023.
//

import Foundation
@testable import iMovie

extension Movie {
    init(id: Int) {
        self = Self.init(
            id: id,
            isAdult: false,
            backdropPath: nil,
            title: "",
            originalLanguage: "",
            originalTitle: "",
            overview: "",
            posterPath: nil,
            mediaType: nil,
            genreIds: [],
            popularity: 0.0,
            releaseDate: "",
            hasVideo: false,
            voteAverage: 0.0,
            voteCount: 0
        )
    }
}
