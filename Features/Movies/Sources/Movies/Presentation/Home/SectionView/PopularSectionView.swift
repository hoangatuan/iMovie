//
//  PopularSectionView.swift
//  iMovie
//
//  Created by Tuan Hoang on 22/06/2023.
//

import CommonUI
import Domain
import Router
import SwiftUI

struct PopularSectionView: View {
    @EnvironmentObject private var router: Router

    private let sectionTitle: String
    private let movies: [Movie]

    init(sectionTitle: String, movies: [Movie]) {
        self.sectionTitle = sectionTitle
        self.movies = movies
    }
    
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
                            router.navigate(to: Destination.movieDetail(movie: movie))
                        }
                    }
                }
            }
        } header: {
            SectionHeaderView(title: sectionTitle, showArrowButton: false) {}
        }
        .modifier(DefaultListModifier(top: 16, leading: 16))
    }
}
