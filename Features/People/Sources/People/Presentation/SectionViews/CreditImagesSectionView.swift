//
//  CreditSectionView.swift
//
//
//  Created by Tuan Hoang on 19/11/23.
//

import SwiftUI
import Domain
import CommonUI

struct CreditImagesSectionView: View {
    let images: [MovieImage]

    private let rows = [
        GridItem(.flexible()),
    ]

    var body: some View {
        Section {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: rows, alignment: .top, spacing: 8) {
                    ForEach(images.indices) { index in
                        RemoteImageView(
                            imageURL: images[index].filePath,
                            contentMode: .fill
                        )
                        .frame(width: 102, height: 94)
                        .cornerRadius(4)
                        .clipped()
                    }
                }
            }
        } header: {
            SectionHeaderView(title: "Gallery", showArrowButton: false) {}
        }
        .modifier(DefaultListModifier(leading: 16))
    }
}

#Preview {
    CreditImagesSectionView(images: [
        .init(
            aspectRatio: 0.667,
            height: 900,
            width: 600,
            filePath: URL(string: "https://image.tmdb.org/t/p/w500/82rxrGxOqQW2NjKsIiNbDYHFfmb.jpg")
        ),
        .init(
            aspectRatio: 0.667,
            height: 2400,
            width: 1600,
            filePath: URL(string: "https://image.tmdb.org/t/p/w500/baeHNv3qrVsnApuKbZXiJOhqMnw.jpg")
        )
    ])
}
