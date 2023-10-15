//
//  MovieShortInfoView.swift
//  iMovie
//
//  Created by Tuan Hoang on 22/06/2023.
//

import SwiftUI
import Models

public struct MovieShortInfoView: View {
    private let movie: Movie

    public init(movie: Movie) {
        self.movie = movie
    }

    public var body: some View {
        VStack {
            ZStack {
                RemoteImageView(imageURL: movie.posterPath)
                    .cornerRadius(4)
                    .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 2)

                Text("⭐️\(movie.voteAverage, specifier: "%.1f")")
                    .font(
                        Font.custom("Lato", size: 16)
                            .weight(.bold)
                    )
                    .foregroundColor(.white)
                    .padding(.init(top: 4, leading: 4, bottom: 4, trailing: 4))
                    .background(.black)
                    .cornerRadius(4)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                    .padding(.init(top: 0, leading: 0, bottom: 8, trailing: 8))
            }
            .frame(width: 122, height: 185)
            
            HStack {
                Text(movie.originalTitle)
                    .font(
                        Font.custom("Lato", size: 16)
                            .weight(.semibold)
                    )
                    .foregroundColor(.white)
                Spacer()
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
