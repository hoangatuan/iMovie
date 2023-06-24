//
//  SearchReducerTests.swift
//  iMovieTests
//
//  Created by Tuan Hoang on 24/06/2023.
//

import XCTest
import ComposableArchitecture
@testable import iMovie

@MainActor
final class SearchReducerTests: XCTestCase {

    func testReducer() async {
        let store = TestStore(
            initialState: SearchReducer.State(),
            reducer: {
                SearchReducer()
            }, withDependencies: {
                $0.movieRepository = MovieRepository.testValue
                $0.searchRepository = SearchRepository.testValue
            })

        XCTAssert(store.state.displayState == .emptyInput)

        await store.send(.inputChanged("3"))

        let movies = [Movie(id: 1)]
        await store.receive(.onComplete(movies)) {
            $0.displayState = .matchResults(movies)
        }
    }

}
