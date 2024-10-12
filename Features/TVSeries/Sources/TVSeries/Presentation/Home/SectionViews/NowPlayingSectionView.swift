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

struct NowPlayingSectionView: View {
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
            HorizontalCircleListView(objects: tvSeries) { tvSeries in
                guard let tvSeries = tvSeries as? TVSeries else { return }
                router.navigate(to: Destination.tvSeriesDetail(tvSeries))
            }
        } header: {
            SectionHeaderView(title: "Now playing", showArrowButton: false) {}
        }
        .modifier(DefaultListModifier(top: 16, leading: 16))
    }
}
