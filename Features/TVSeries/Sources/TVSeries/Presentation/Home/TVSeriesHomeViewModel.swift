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
        
        var sections: [SectionType] = [
            .header,
            .discover((try? await airingToday) ?? []),
            .news((try? await news) ?? []),
            .popular((try? await popular) ?? []),
            .topRated((try? await topRated) ?? [])
        ]
        
        sections = sections.filter { !$0.isEmpty }
        // TODO: Handle error
        state = .display(data: sections)
    }
}
