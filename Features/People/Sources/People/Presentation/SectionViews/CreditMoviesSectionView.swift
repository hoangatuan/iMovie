//
//  SwiftUIView.swift
//  
//
//  Created by Tuan Hoang on 19/11/23.
//

import SwiftUI
import Domain
import CommonUI
import Router

struct CreditMoviesSectionView: View {
    @EnvironmentObject private var router: Router

    let movies: [Movie]

    private let rows = [
        GridItem(.flexible()),
    ]

    var body: some View {
        Section {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: rows, alignment: .top, spacing: 8) {
                    ForEach(movies, id: \.id) { movie in
                        MovieShortInfoView(shortInfo: .init(
                            posterPath: movie.posterPath, title: movie.originalTitle, voteAverage: movie.voteAverage)
                        )
                        .onTapGesture {
                            router.navigate(to: PublicPeopleDestination.movieDetail(movie: movie))
                        }
                    }
                }
            }
        } header: {
            SectionHeaderView(title: "Movies", showArrowButton: false) {}
        }
        .modifier(DefaultListModifier(top: 16, leading: 16))
    }
}
