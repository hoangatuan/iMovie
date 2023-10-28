//
//  MovieGallerySectionView.swift
//
//
//  Created by Hoang Anh Tuan on 26/10/2023.
//

import CommonUI
import Models
import SwiftUI

struct MovieGallerySectionView: View {
    private let movieImages: [MovieImage]
    init(movieImages: [MovieImage]) {
        self.movieImages = movieImages
    }

    private let rows = [
        GridItem(.flexible()),
    ]

    var body: some View {
        Section {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: rows, alignment: .top, spacing: 8) {
                    ForEach(movieImages.indices) { index in
                        RemoteImageView(
                            imageURL: movieImages[index].filePath,
                            contentMode: .fill
                        )
                        .frame(width: 102, height: 94)
                        .cornerRadius(4)
                        .clipped()
                    }
                }
            }
        } header: {
            SectionHeaderView(title: "Gallery") {}
        }
        .listRowSeparator(.hidden)
        .listRowInsets(.init(top: 16, leading: 16, bottom: 0, trailing: 0))
        .listRowBackground(Color.clear)
    }
}
