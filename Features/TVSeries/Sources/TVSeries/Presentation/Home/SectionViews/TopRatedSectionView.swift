//
//  SwiftUIView.swift
//  
//
//  Created by Tuan Hoang on 18/11/23.
//

import SwiftUI
import Domain
import CommonUI
import Router

struct TopRatedSectionView: View {
    @EnvironmentObject private var router: Router

    private let tvSeries: [TVSeries]
    init(tvSeries: [TVSeries]) {
        self.tvSeries = tvSeries
    }

    private let rows = [
        GridItem(.flexible()),
    ]

    var body: some View {
        Section {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: rows, alignment: .top, spacing: 8) {
                    ForEach(tvSeries.indices) { index in
                        let item = tvSeries[index]
                        TopRatedCell(index: index + 1, item: .init(
                            posterPath: item.posterPath, title: item.originalName ?? "")
                        )
                        .onTapGesture {
                            router.navigate(to: Destination.tvSeriesDetail(item))
                        }
                    }
                }
            }
        } header: {
            SectionHeaderView(title: "Top rating", showArrowButton: false) {}
        }
        .modifier(DefaultListModifier(top: 16, leading: 16))
    }
}
