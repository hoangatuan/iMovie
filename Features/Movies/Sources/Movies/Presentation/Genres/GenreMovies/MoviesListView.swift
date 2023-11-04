//
//  MoviesListView.swift
//
//
//  Created by Hoang Anh Tuan on 04/11/2023.
//

import CommonUI
import Domain
import Router
import SwiftUI

// TODO: Create common view `MoviesListView`, allow to custom verticle/horizontal, and move to CommonUI package.

struct MoviesListView: View {
    @EnvironmentObject private var router: Router

    private let movies: [Movie]

    init(movies: [Movie]) {
        self.movies = movies
    }

    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]

    var body: some View {
        Section {
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: columns, alignment: .leading, spacing: 8) {
                    ForEach(movies, id: \.id) { movie in
                        MovieShortInfoView(movie: movie)
                            .onTapGesture {
                                router.navigate(to: Destination.movieDetail(movie: movie))
                            }
                    }
                }
            }
        }
        .modifier(DefaultListModifier(leading: 16, trailing: 16))
    }
}
