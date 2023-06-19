//
//  TrendingMovieView.swift
//  iMovie
//
//  Created by Tuan Hoang on 18/06/2023.
//

import SwiftUI
import CommonUI

struct DiscoveryMoviesSectionView: View {
    private let movies: [Movie]
    init(movies: [Movie]) {
        self.movies = movies
    }

    var body: some View {
        ZStack {
            RemoteImageView(imageURL: movies[0].posterPath, contentMode: .fit)
                .opacity(0.6)

            HStack {
                Spacer().frame(width: 16)
                VStack(alignment: .leading) {
                    Spacer()
                    RemoteImageView(imageURL: movies[0].posterPath, cornerRadius: 8)
                        .frame(width: 86, height: 130)

                    Text(movies[0].title)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }

                Spacer()
            }
        }
        .listRowSeparator(.hidden)
        .listRowInsets(.none)
        .listRowBackground(Color.clear)
    }
}
