//
//  MovieShortInfoView.swift
//  iMovie
//
//  Created by Tuan Hoang on 22/06/2023.
//

import SwiftUI
import CommonUI

struct MovieShortInfoView: View {
    private let movie: Movie

    init(movie: Movie) {
        self.movie = movie
    }

    var body: some View {
        VStack {
            RemoteImageView(imageURL: movie.posterPath)
                .frame(width: 122, height: 185)
                .cornerRadius(4)
                .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 2)
            
            HStack {
                Text(movie.originalTitle)
                    .font(
                        Font.custom("Lato", size: 16)
                            .weight(.semibold)
                    )
                    .foregroundColor(.white)
                Spacer()
                Text("\(movie.voteAverage, specifier: "%.1f")")
                    .font(
                        Font.custom("Lato", size: 24)
                            .weight(.bold)
                    )
                    .foregroundColor(Color(red: 0.9, green: 0.43, blue: 0.2))
            }
        }
        .frame(width: 122)
    }
}

struct MovieShortInfoView_Previews: PreviewProvider {
    static var previews: some View {
        MovieShortInfoView(
            movie: Movie(
                id: 1,
                isAdult: false,
                backdropPath: nil,
                title: "Black Adam",
                originalLanguage: "en",
                originalTitle: "Black Adam",
                overview: "",
                posterPath: nil,
                mediaType: nil,
                genreIds: [],
                popularity: 0,
                releaseDate: "",
                hasVideo: false,
                voteAverage: 1.2,
                voteCount: 1000
            )
        )
    }
}
