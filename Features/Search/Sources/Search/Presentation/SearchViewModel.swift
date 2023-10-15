//
//  SearchViewModel.swift
//  iMovie
//
//  Created by Hoang Anh Tuan on 15/10/2023.
//

import Foundation
import Models

@MainActor
final class SearchViewModel: ObservableObject {
    
    private let searchRepository: ISearchRepository
    
    init(searchRepository: ISearchRepository) {
        self.searchRepository = searchRepository
    }
    
    enum State {
        case emptyInput, loading, display([Movie]), error
    }
    
    var state: State = .emptyInput
    
    func search(keyword: String) async {
        if keyword.isEmpty {
            state = .emptyInput
            return
        }
        
        state = .loading
        do {
            let movies = try await searchRepository.search(keyword: keyword)
            state = .display(movies)
        } catch {
            state = .error
        }
    }

}
