//
//  TVSeriesHomeView.swift
//
//
//  Created by Hoang Anh Tuan on 06/11/2023.
//

import CommonUI
import Domain
import DesignSystem
import SwiftUI
import Router
import Network

extension TVSeries: ImageHolder {
    public var imageURL: URL? {
        posterPath
    }
}

struct TVSeriesHomeView: View {
    @StateObject private var viewModel: TVSeriesHomeViewModel

    init(repository: ITVSeriesRepository) {
        _viewModel = .init(wrappedValue: TVSeriesHomeViewModel(movieRepository: repository))
    }

    var body: some View {
        ZStack {
            switch viewModel.state {
            case .loading:
                EmptyView()
            case let .display(sections):
                List {
                    ForEach(sections) { section in
                        switch section {
                        case .header:
                            HeaderSectionView()
                        case let .discover(tvSeries):
                            AiringTodayTVSeriesView(tvseries: tvSeries)
                        case let .news(tvSeries):
                            NowPlayingSectionView(tvSeries: tvSeries)
                        case let .popular(tvSeries):
                            PopularSectionView(tvSeries: tvSeries)
                        case let .topRated(tvSeries):
                            TopRatedSectionView(tvSeries: tvSeries)
                        }
                    }
                }
                .listStyle(PlainListStyle())
            case .error:
                EmptyView()
            }
        }
        .ignoresSafeArea(edges: .top)
        .screenBackground(with: .color040F23)
    }
}
