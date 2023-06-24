//
//  SearchViewReducer.swift
//  iMovie
//
//  Created by Tuan Hoang on 22/06/2023.
//

import Foundation
import ComposableArchitecture

struct SearchReducer: ReducerProtocol {

    @Dependency(\.searchRepository) var searchRepository

    struct State: Equatable {
        var displayState: DisplayState = .emptyInput

        enum DisplayState: Equatable {
            case emptyInput
            case emptyResult
            case matchResults([Movie])
        }
    }

    enum Action: Equatable {
        case onAppear
        case inputChanged(String)
        case onComplete([Movie])
    }

    func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
        switch action {
        case .onAppear:
            return .none
        case .inputChanged(let keyword):
            if keyword.isEmpty {
                state.displayState = .emptyInput
                return .none
            }

            return .run { send in
                let movies = try await searchRepository.search(keyword: keyword)
                await send(.onComplete(movies))
            }
        case .onComplete(let movies):
            state.displayState = movies.isEmpty ? .emptyInput : .matchResults(movies)
            return .none
        }
    }
}
