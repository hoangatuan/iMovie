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

struct PopularSectionView: View {
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
                    ForEach(tvSeries, id: \.id) { tvSerie in
                        MovieShortInfoView(shortInfo: .init(
                            posterPath: tvSerie.posterPath, title: tvSerie.originalName ?? "", voteAverage: tvSerie.voteAverage)
                        )
                        .onTapGesture {
                            router.navigate(to: Destination.tvSeriesDetail(tvSerie))
                        }
                    }
                }
            }
        } header: {
            SectionHeaderView(title: "Popular") {}
        }
        .modifier(DefaultListModifier(top: 16, leading: 16))
    }
}
