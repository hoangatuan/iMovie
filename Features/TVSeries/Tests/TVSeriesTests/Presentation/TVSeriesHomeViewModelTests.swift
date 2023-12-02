//
//  TVSeriesHomeViewModelTests.swift
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

@testable import TVSeries

fileprivate typealias State = TVSeriesHomeViewModel.State

@MainActor
final class TVSeriesHomeViewModelTests: XCTestCase {
    private var cancellables = Set<AnyCancellable>()
    
    func testFetchSuccess() {
        stubNetworkCall()
        let sut = setupSUT()
        let expectation = expectation(description: "Waiting for fetching apis")
        
        let expectedState: State = .display(data: [
            .header,
            .discover(airingTodayTVMock),
            .news(newsTVMock),
            .popular(popularTVMock),
            .topRated(topRatedTVMock)
        ])
        
        sut.$state.dropFirst().sink { state in
            XCTAssertEqual(state, expectedState)
            expectation.fulfill()
        }
        .store(in: &cancellables)
        
        wait(for: [expectation])
    }
    
    func testFetchFail_StateIsError() {
        stubNetworkCall(isSuccess: false)
        let sut = setupSUT()
        let expectation = expectation(description: "Waiting for fetching apis")
        
        sut.$state.dropFirst().sink { state in
            XCTAssertEqual(state, State.error)
            expectation.fulfill()
        }
        .store(in: &cancellables)
        
        wait(for: [expectation])
    }
}
 
extension TVSeriesHomeViewModelTests {
    @MainActor func setupSUT() -> TVSeriesHomeViewModel {
        return .init(
            movieRepository: TVSeriesRepository(apiClientService: createAPIClientServiceMock())
        )
    }
    
    func stubNetworkCall(isSuccess: Bool = true) {
        let statusCode: Int32 = isSuccess ? 200 : 404
        stub(condition: isPath("/3/tv/airing_today")) { request in
            return HTTPStubsResponse(
                fileURL: Bundle.module.url(forResource: "fetchAiringTodayTVResponse", withExtension: "json")!,
                statusCode: statusCode,
                headers: nil
            )
        }
        
        stub(condition: isPath("/3/tv/on_the_air")) { request in
            return HTTPStubsResponse(
                fileURL: Bundle.module.url(forResource: "fetchNewsTVResponse", withExtension: "json")!,
                statusCode: statusCode,
                headers: nil
            )
        }
        
        stub(condition: isPath("/3/tv/popular")) { request in
            return HTTPStubsResponse(
                fileURL: Bundle.module.url(forResource: "fetchPopularTVResponse", withExtension: "json")!,
                statusCode: statusCode,
                headers: nil
            )
        }
        
        stub(condition: isPath("/3/tv/top_rated")) { request in
            return HTTPStubsResponse(
                fileURL: Bundle.module.url(forResource: "fetchTopRatedTVResponse", withExtension: "json")!,
                statusCode: statusCode,
                headers: nil
            )
        }
    }
}

extension TVSeriesHomeViewModel.State: Equatable {
    public static func == (lhs: TVSeriesHomeViewModel.State, rhs: TVSeriesHomeViewModel.State) -> Bool {
        if case .loading = lhs, case .loading = rhs { return true }
        if case .error = lhs, case .error = rhs { return true }

        if case let .display(lhsData) = lhs, case let .display(rhsData) = rhs {
            return lhsData == rhsData
        }

        return false
    }
}

