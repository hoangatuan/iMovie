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
    
    enum State {
        case loading, display(airingToday: [TVSeries], news: [TVSeries], popular: [TVSeries]), error
    }
    
    @Published
    var state: State = .loading
    
    func fetch() async {
        async let airingToday = repository.airingTodayTVSeries()
        async let news = repository.latestTvSeries()
        async let popular = repository.popularTvSeries()
        
        state = .display(
            airingToday: (try? await airingToday) ?? [],
            news: (try? await news) ?? [],
            popular: (try? await popular) ?? []
        )
        
        // TODO: Handle error
    }
}
