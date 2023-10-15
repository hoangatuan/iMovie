//
//  PopularSectionView.swift
//  iMovie
//
//  Created by Tuan Hoang on 22/06/2023.
//

import SwiftUI
import CommonUI
import Models

struct PopularSectionView: View {

    private let movies: [Movie]
    init(movies: [Movie]) {
        self.movies = movies
    }

    private let rows = [
        GridItem(.flexible())
    ]

    var body: some View {
        Section {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: rows, alignment: .top, spacing: 16) {
                    ForEach(movies, id: \.id) { movie in
                        MovieShortInfoView(movie: movie)
                    }
                }
            }
        } header: {
            SectionHeaderView(title: "Popular Movies") {

            }
        }
        .listRowSeparator(.hidden)
        .listRowInsets(.init(top: 16, leading: 16, bottom: 0, trailing: 0))
        .listRowBackground(Color.clear)
    }
}
