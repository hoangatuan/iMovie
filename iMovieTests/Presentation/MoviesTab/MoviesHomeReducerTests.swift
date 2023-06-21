//
//  MoviesHomeReducerTests.swift
//  iMovieTests
//
//  Created by Tuan Hoang on 21/06/2023.
//

import XCTest
import ComposableArchitecture
@testable import iMovie

@MainActor
final class MoviesHomeReducerTests: XCTestCase {

    func testOnAppear() async {
        let store = TestStore(initialState: MoviesHomeReducer.State()) {
            MoviesHomeReducer(movieRepository: MovieRepositoryMock())
        }

        await store.send(.onAppear) {
            $0.isLoading = true
        }

        let discoveryMovies: [Movie] = [.init(id: 1)]
        let genres: [Genre] = [.init(id: 1, name: .action)]
        let popularMovies: [Movie] = [.init(id: 3)]

        await store.receive(.finishFetch(discoveryMovies: discoveryMovies, genres: genres, popularMovies: popularMovies)) {
            $0.isLoading = false
            $0.sections = [.discoverMovies(discoveryMovies), .genres(genres), .popularMovies(popularMovies)]
        }
    }
    
}
