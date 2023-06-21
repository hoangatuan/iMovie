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
                .opacity(0.4)

            buildHeaderView()

            buildMovieShortInfoView()
        }
        .listRowSeparator(.hidden)
        .listRowInsets(EdgeInsets())
        .listRowBackground(Color.clear)
    }

    private func buildHeaderView() -> some View {
        HStack(spacing: 12) {
            Text("Discover")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)

            Spacer()
            Button(action: {

            }, label: {
                Image("search")
                    .frame(width: 24, height: 24)
            })

            Button(action: {

            }, label: {
                Image("setting")
                    .frame(width: 24, height: 24)
            })
        }
        .padding(.init(top: 56, leading: 16, bottom: 0, trailing: 16))
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }

    private func buildMovieShortInfoView() -> some View {
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
}
