//
//  TrendingMovieView.swift
//  iMovie
//
//  Created by Tuan Hoang on 18/06/2023.
//

import SwiftUI
import CommonUI

struct TrendingMovieView: View {
    private let movie: Movie
    init(movie: Movie) {
        self.movie = movie
    }

    var body: some View {
        ZStack {
            RemoteImageView(imageURL: movie.posterPath, contentMode: .fit)
                .opacity(0.6)

            HStack {
                Spacer().frame(width: 16)
                VStack(alignment: .leading) {
                    Spacer()
                    RemoteImageView(imageURL: movie.posterPath, cornerRadius: 8)
                        .frame(width: 86, height: 130)

                    Text(movie.title)
                        .font(.title3)
                        .foregroundColor(.red)
                }

                Spacer()
            }
        }
    }
}
