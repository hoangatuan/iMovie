//
//  TVSeriesHomeViewModel.swift
//
//
//  Created by Hoang Anh Tuan on 06/11/2023.
//

import Domain
import DomainData
import Foundation

@MainActor
final class TVSeriesHomeViewModel: ObservableObject {
    private let repository: ITVSeriesRepository

    init(movieRepository: ITVSeriesRepository) {
        repository = movieRepository
        
        Task {
            await fetch()
        }
    }
    
    enum SectionType: Equatable, Identifiable {
        case header
        case discover([TVSeries])
        case news([TVSeries])
        case popular([TVSeries])
        case topRated([TVSeries])
        
        var id: UUID {
            return UUID()
        }
        
        var isEmpty: Bool {
            switch self {
            case let .discover(array), let .news(array), let .popular(array), let .topRated(array):
                return array.isEmpty
            case .header:
                return false
            }
        }
    }
    
    enum State {
        case loading, display(data: [SectionType]), error
    }
    
    @Published
    var state: State = .loading
    
    func fetch() async {
        async let airingToday = repository.airingTodayTVSeries()
        async let news = repository.latestTvSeries()
        async let popular = repository.popularTvSeries()
        async let topRated = repository.topRatedTVSeries()
        
        guard let airingToday = try? await airingToday,
              let news = try? await news,
              let popular = try? await popular,
              let topRated = try? await topRated else {
            state = .error
            return
        }
        
        var sections: [SectionType] = [
            .header,
            .discover(airingToday),
            .news(news),
            .popular(popular),
            .topRated(topRated)
        ]
        
        sections = sections.filter { !$0.isEmpty }
        state = .display(data: sections)
    }
}
