//
//  SearchViewReducer.swift
//  iMovie
//
//  Created by Tuan Hoang on 22/06/2023.
//

import Foundation
import ComposableArchitecture

struct SearchReducer: ReducerProtocol {

    struct State: Equatable {
        var matchedMovies: [Movie] = []
    }

    enum Action: Equatable {
        case onAppear
        case inputChanged(String)
    }

    func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
        switch action {
        case .onAppear:
            return .none
        case .inputChanged(let keyword):
            return .none
        }
    }
}
