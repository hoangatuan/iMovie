//
//  SwiftUIView.swift
//  
//
//  Created by Tuan Hoang on 19/11/23.
//

import SwiftUI
import Domain
import CommonUI
import Router

struct CreditTVSeriesSectionView: View {
    @EnvironmentObject private var router: Router

    let tvSeries: [TVSeries]

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
                            router.navigate(to: PublicPeopleDestination.tvDetail(tvSeries: tvSerie))
                        }
                    }
                }
            }
        } header: {
            SectionHeaderView(title: "TV Series") {}
        }
        .modifier(DefaultListModifier(leading: 16))
    }
}
