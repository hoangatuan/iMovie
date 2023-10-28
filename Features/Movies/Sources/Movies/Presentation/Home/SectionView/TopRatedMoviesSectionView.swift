//
//  TopRatedMoviesSectionView.swift
//
//
//  Created by Hoang Anh Tuan on 18/10/2023.
//

import CommonUI
import DesignSystem
import Models
import Router
import SwiftUI

struct TopRatedMoviesSectionView: View {
    @EnvironmentObject private var router: Router

    private let movies: [Movie]
    init(movies: [Movie]) {
        self.movies = movies
    }

    private let rows = [
        GridItem(.flexible()),
    ]

    var body: some View {
        Section {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: rows, alignment: .top, spacing: 8) {
                    ForEach(movies.indices) { index in
                        TopRatedCell(index: index + 1, movie: movies[index])
                            .onTapGesture {
                                router.navigate(to: Destination.movieDetail(movie: movies[index]))
                            }
                    }
                }
            }
        } header: {
            SectionHeaderView(title: "Top rating") {}
        }
        .listRowSeparator(.hidden)
        .listRowInsets(.init(top: 16, leading: 16, bottom: 0, trailing: 0))
        .listRowBackground(Color.clear)
    }
}

struct TopRatedCell: View {
    private let index: Int
    private let movie: Movie

    init(index: Int, movie: Movie) {
        self.movie = movie
        self.index = index
    }

    var body: some View {
        ZStack(alignment: .top) {
            Color.color104564
                .ignoresSafeArea()
                .frame(width: 128)
                .cornerRadius(4)
                .padding(.top, 17)

            VStack(alignment: .center, spacing: 8) {
                Spacer().frame(height: 44)

                RemoteImageView(
                    imageURL: movie.posterPath,
                    contentMode: .fill
                )
                .frame(width: 60, height: 60)
                .clipped()
                .clipShape(RoundedRectangle(cornerRadius: 4))

                Text(movie.originalTitle)
                    .multilineTextAlignment(.center)
                    .lineLimit(3)
                    .font(.semibold13)
                    .foregroundColor(.white)

                Spacer()

                Spacer()
                    .frame(width: 128, height: 3)
                    .background(Color.color04EECD)
            }

            VStack {
                Text("\(index)")
                    .font(.bold24)
                    .padding(EdgeInsets(top: 4, leading: 10, bottom: 4, trailing: 10))
                    .background(Color.colorE56E34)
                    .clipShape(Circle())
                    .padding(EdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4))
                    .background(Color.color040F23)
                    .clipShape(Circle())

                Spacer()
            }
        }
        .frame(width: 128, height: 180)
        .cornerRadius(4)
    }
}

#Preview {
    TopRatedCell(index: 1, movie: .init(
        id: 1,
        isAdult: false,
        backdropPath: nil,
        title: "Dilan 1990",
        originalLanguage: "",
        originalTitle: "Dilan 1990",
        overview: "",
        posterPath: nil,
        mediaType: nil,
        genreIds: [],
        popularity: 0.0,
        releaseDate: "",
        hasVideo: false,
        voteAverage: 0.0,
        voteCount: 0
    ))
}
