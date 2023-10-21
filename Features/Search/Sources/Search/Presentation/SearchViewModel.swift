//
//  SearchViewModel.swift
//  iMovie
//
//  Created by Hoang Anh Tuan on 15/10/2023.
//

import Foundation
import Models

enum SearchType: String, CaseIterable {
    case movie = "Movies"
    case tvShows = "TV Shows"
    case actor = "Actor"
}

@MainActor
final class SearchViewModel: ObservableObject {
    
    private let searchRepository: ISearchRepository
    
    init(searchRepository: ISearchRepository) {
        self.searchRepository = searchRepository
    }
    
    enum State {
        case emptyInput, loading, display(SearchType, [Any]), error
    }
    
    @Published
    var state: State = .emptyInput
    
    private var movieCache: [String: [Movie]] = [:]
    private var tvSeriesCache: [String: [TVSeries]] = [:]
    private var actorCache: [String: [Actor]] = [:]
    
    func search(keyword: String, for type: SearchType) async {
        if keyword.isEmpty {
            state = .emptyInput
            return
        }
        
        switch type {
            case .movie:
                if let movies = movieCache[keyword] {
                    state = .display(type, movies)
                    return
                }
            case .tvShows:
                if let tvShows = tvSeriesCache[keyword] {
                    state = .display(type, tvShows)
                    return
                }
            case .actor:
                if let actors = actorCache[keyword] {
                    state = .display(type, actors)
                    return
                }
        }
        
        state = .loading
        switch type {
            case .movie:
                let movies = (try? await searchRepository.searchMovies(keyword: keyword, page: 1)) ?? []
                movieCache[keyword] = movies
                state = .display(type, movies)
            case .tvShows:
                let tvSeries = (try? await searchRepository.searchTvSeries(keyword: keyword, page: 1)) ?? []
                tvSeriesCache[keyword] = tvSeries
                state = .display(type, tvSeries)
            case .actor:
                let actors = (try? await searchRepository.searchPersons(keyword: keyword, page: 1)) ?? []
                actorCache[keyword] = actors
                state = .display(type, actors)
        }
    }
}
