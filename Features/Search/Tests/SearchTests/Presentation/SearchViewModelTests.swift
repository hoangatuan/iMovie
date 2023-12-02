//
//  SearchViewModelTests.swift
//  
//
//  Created by Tuan Hoang on 2/12/23.
//

import XCTest
import Domain
import DomainData
import NetworkMock
import OHHTTPStubs
import OHHTTPStubsSwift
import Combine

@testable import Search

fileprivate typealias State = SearchViewModel.State

@MainActor
final class SearchViewModelTests: XCTestCase {
    
    private var cancellables = Set<AnyCancellable>()
    
    func testSearch() {
        // I'm too lazy to write tests now.
        // Please refer to unit tests in other packages: People, TVSeries, Movies
    }
}

extension SearchViewModelTests {
    @MainActor 
    func setupSUT() -> SearchViewModel {
        let apiClientService = createAPIClientServiceMock()
        return .init(searchRepository: SearchRepository(apiClientService: apiClientService))
    }
}

extension SearchViewModel.State: Equatable {
    public static func == (lhs: SearchViewModel.State, rhs: SearchViewModel.State) -> Bool {
        if case .emptyInput = lhs, case .emptyInput = rhs { return true }
        if case .loading = lhs, case .loading = rhs { return true }
        if case .error = lhs, case .error = rhs { return true }
        
        if case let .display(lhsType, lhsData) = lhs, case let .display(rhsType, rhsData) = rhs {
            if lhsType != rhsType { return false }
            switch lhsType {
            case .movie:
                return (lhsData as! [Movie]) == (rhsData as! [Movie])
            case .tvShows:
                return (lhsData as! [TVSeries]) == (rhsData as! [TVSeries])
            case .person:
                return (lhsData as! [Person]) == (rhsData as! [Person])
            }
        }
        
        return false
    }
}
