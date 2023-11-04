//
//  ListGenresView.swift
//
//
//  Created by Hoang Anh Tuan on 31/10/2023.
//

import Domain
import Router
import SwiftUI

struct ListGenresView: View {
    @EnvironmentObject private var router: Router

    private let genres: [Genre]
    init(genres: [Genre]) {
        self.genres = genres
    }

    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]

    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            LazyVGrid(columns: columns, content: {
                ForEach(genres, id: \.id) { genre in
                    GenreCell(genre: genre)
                        .frame(height: 48)
                        .onTapGesture {
                            router.navigate(to: Destination.movieByGenre(genre: genre))
                        }
                }
            })
        }
        .padding(EdgeInsets(top: 24, leading: 16, bottom: 0, trailing: 16))
        .screenBackground(with: .color040F23)
        .customBackButton(action: {
            router.navigateBack()
        })
    }
}
