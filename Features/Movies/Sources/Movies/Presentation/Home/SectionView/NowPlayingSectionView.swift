//
//  NowPlayingSectionView.swift
//
//
//  Created by Hoang Anh Tuan on 20/10/2023.
//

import CommonUI
import Domain
import Router
import SwiftUI

struct NowPlayingSectionView: View {
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
                LazyHGrid(rows: rows, alignment: .top, spacing: 12) {
                    ForEach(movies, id: \.id) { movie in
                        RemoteImageView(imageURL: movie.posterPath, contentMode: .fill)
                            .frame(width: 56, height: 56)
                            .cornerRadius(28)
                            .overlay(
                                RoundedRectangle(cornerRadius: 28)
                                    .inset(by: 1)
                                    .stroke(Color.color04EECD, lineWidth: 2)
                            )
                            .onTapGesture {
                                router.navigate(to: Destination.movieDetail(movie: movie))
                            }
                    }
                }
            }
        } header: {
            SectionHeaderView(title: "Now playing") {}
        }
        .listRowSeparator(.hidden)
        .listRowInsets(.init(top: 16, leading: 16, bottom: 0, trailing: 0))
        .listRowBackground(Color.clear)
    }
}
