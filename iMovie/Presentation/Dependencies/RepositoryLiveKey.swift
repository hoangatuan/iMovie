//
//  MovieRepositoryLiveKey.swift
//  iMovie
//
//  Created by Tuan Hoang on 24/06/2023.
//

import Foundation
import ComposableArchitecture
import Network

extension MovieRepository: DependencyKey {
    static var liveValue: IMovieRepository {
        MovieRepository(
            apiClientService: APIClientService.liveValue
        )
    }
}

extension SearchRepository: DependencyKey {
    static var liveValue: ISearchRepository {
        SearchRepository(
            apiClientService: APIClientService.liveValue
        )
    }
}

extension DependencyValues {
    var movieRepository: IMovieRepository {
        get { self[MovieRepository.self] }
        set { self[MovieRepository.self] = newValue }
    }

    var searchRepository: ISearchRepository {
        get { self[SearchRepository.self] }
        set { self[SearchRepository.self] = newValue }
    }
}
