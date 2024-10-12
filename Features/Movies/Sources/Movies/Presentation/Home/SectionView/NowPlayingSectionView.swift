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
            HorizontalCircleListView(objects: movies) { movie in
                guard let movie = movie as? Movie else { return }
                router.navigate(to: Destination.movieDetail(movie: movie))
            }
        } header: {
            SectionHeaderView(title: "Now playing", showArrowButton: false) {}
        }
        .modifier(DefaultListModifier(top: 16, leading: 16))
    }
}

extension Movie: ImageHolder {
    public var imageURL: URL? {
        return posterPath
    }
}
