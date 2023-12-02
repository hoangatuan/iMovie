//
//  File.swift
//  
//
//  Created by Tuan Hoang on 2/12/23.
//

import Foundation
import Domain

let movieMock = Movie(
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

let genresMock: [GenreDetail] = [
    .init(id: 18, name: "Drama")
]

let movieImagesMock: [MovieImage] = [
    .init(
        aspectRatio: 1.778,
        height: 1080,
        width: 1920,
        filePath: URL(string: "https://image.tmdb.org/t/p/w500/aLGd3Af9srD318V73GwHnqL1J6v.jpg")
    )
]

let actorsMock: [Credit] = [
    .init(
        gender: .other,
        id: 91606,
        department: "Acting",
        name: "Tom Hiddleston",
        originalName: "Tom Hiddleston",
        profilePath: URL(string: "https://image.tmdb.org/t/p/w500/mclHxMm8aPlCPKptP67257F5GPo.jpg"),
        castId: 3,
        popularity: 27.028,
        character: "Edward",
        job: nil
    )
]

let reviewsMock: [Review] = [
    .init(
        author: "CinemaSerf",
        authorDetail: .init(
            name: "CinemaSerf",
            username: "Geronimo1967",
            avatarPath: URL(string: "https://image.tmdb.org/t/p/w500/1kks3YnVkpyQxzw36CObFPvhL5f.jpg"),
            rating: 6
        ),
        content: "Good.",
        createdAt: getDate(from: "2023-06-18T07:22:10.837Z"),
        id: "648eb0a2c2ff3d00ffbbbc69",
        updatedAt: getDate(from: "2023-06-18T07:22:10.942Z")
    )
]

func getDate(from str: String) -> Date {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
    return dateFormatter.date(from: str)!
}

let recommendMoviesMock: [Movie] = [
    .init(
        id: 217277,
        isAdult: false,
        backdropPath: URL(string: "https://image.tmdb.org/t/p/w500/iGWhPFKqKoVPYOuRvlnbtyXByOU.jpg"),
        title: "Underage",
        originalLanguage: "pt",
        originalTitle: "De menor",
        overview: "The story of Helena",
        posterPath: URL(string: "https://image.tmdb.org/t/p/w500/bBKnbD0f5v4vJl9SDsPDZepcg46.jpg"),
        mediaType: nil,
        genreIds: [10751, 18],
        popularity: 1.422,
        releaseDate: "2013-03-15",
        hasVideo: false,
        voteAverage: 6,
        voteCount: 7
    )
]
