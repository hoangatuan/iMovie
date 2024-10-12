//
//  TopRatedMoviesSectionView.swift
//
//
//  Created by Hoang Anh Tuan on 18/10/2023.
//

import CommonUI
import DesignSystem
import Domain
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
                        let movie = movies[index]
                        TopRatedCell(index: index + 1, item: .init(
                            posterPath: movie.posterPath, title: movie.originalTitle)
                        )
                        .onTapGesture {
                            router.navigate(to: Destination.movieDetail(movie: movie))
                        }
                    }
                }
            }
        } header: {
            SectionHeaderView(title: "Top rating", showArrowButton: false) {}
        }
        .modifier(DefaultListModifier(top: 16, leading: 16))
    }
}

