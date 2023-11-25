//
//  File.swift
//  
//
//  Created by Tuan Hoang on 25/11/23.
//

import Foundation
import Domain

let personDetailMock = PersonDetail(
    adult: false,
    biography: "Thomas William Hiddleston (born 9 February 1981) is an English actor.",
    birthday: "1981-02-09",
    gender: .other,
    id: 91606,
    name: "Tom Hiddleston",
    profilePath: URL(string: "https://image.tmdb.org/t/p/w500/mclHxMm8aPlCPKptP67257F5GPo.jpg"),
    department: "Acting",
    placeOfBirth: "Westminster, London, England, UK"
)

let imagesMock: [MovieImage] = [
    .init(aspectRatio: 0.667, height: 2828, width: 1885, filePath: URL(string: "https://image.tmdb.org/t/p/w500/mclHxMm8aPlCPKptP67257F5GPo.jpg")),
    .init(aspectRatio: 0.667, height: 450, width: 300, filePath: URL(string: "https://image.tmdb.org/t/p/w500/wzfUMqasiYhzwpBvZqkCQ055Ri3.jpg"))
]

let moviesMock: [Movie] = [
    .init(
        id: 64655,
        isAdult: false,
        backdropPath: URL(string: "https://image.tmdb.org/t/p/w500/aLGd3Af9srD318V73GwHnqL1J6v.jpg"),
        title: "Archipelago",
        originalLanguage: "en",
        originalTitle: "Archipelago",
        overview: "Deep fractures within a family dynamic begin to surface during a getaway to the Isles of Scilly.",
        posterPath: URL(string: "https://image.tmdb.org/t/p/w500/gTFePCw4BDx1ikvgdaX0fDf9ewF.jpg"),
        mediaType: nil,
        genreIds: [18],
        popularity: 4.263,
        releaseDate: "2011-03-04",
        hasVideo: false,
        voteAverage: 5.462,
        voteCount: 39
    )
]

let tvSeriesMock: [TVSeries] = [
    .init(
        adult: false,
        backdropPath: URL(string: "https://image.tmdb.org/t/p/w500/iw1nqLAcPbsrcYYEgrkNKezWQDj.jpg"),
        id: 7263,
        originalName: "Wallander",
        overview: "This drama follows Inspector Kurt Wallander – a middle-aged everyman – as he struggles against a rising tide of violence in the apparently sleepy backwaters in and around Ystad in Skane, southern Sweden. Based on the international best-selling books by Henning Mankell.",
        popularity: 39.361,
        posterPath: URL(string: "https://image.tmdb.org/t/p/w500/xK5jgSqoOfKwNG0WwrFObmIq0YJ.jpg"),
        name: "Wallander",
        voteAverage: 7.327,
        voteCount: 113
    )
]
