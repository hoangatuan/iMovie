//
//  GenresSectionView.swift
//  iMovie
//
//  Created by Tuan Hoang on 19/06/2023.
//

import CommonUI
import DesignSystem
import Domain
import Router
import SwiftUI

struct GenresSectionView: View {
    @EnvironmentObject private var router: Router

    private let genres: [Genre]
    init(genres: [Genre]) {
        self.genres = genres
    }

    private let rows = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]

    var body: some View {
        Section {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: rows) {
                    ForEach(genres, id: \.id) { genre in
                        GenreCell(genre: genre)
                            .frame(width: 180, height: 48)
                            .onTapGesture {
                                /*
                                 router.presentSheet(destination: )
                                  */
                            }
                    }
                }
            }
            .frame(height: 104)
        } header: {
            SectionHeaderView(title: "Genres Movie") {
                router.navigate(to: Destination.listGenres(genres: genres))
            }
        }
        .listRowSeparator(.hidden)
        .listRowInsets(.init(top: 16, leading: 16, bottom: 0, trailing: 0))
        .listRowBackground(Color.clear)
    }
}

extension Genre {
    var iconName: String {
        return String(describing: name)
    }
}

struct GenresSectionView_Previews: PreviewProvider {
    static var previews: some View {
        GenresSectionView(genres: [
            .init(id: 1, name: .action),
            .init(id: 2, name: .family),
            .init(id: 3, name: .adventure),
            .init(id: 4, name: .horror),
        ])
    }
}
