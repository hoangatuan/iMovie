//
//  PersonDetailViewModelTests.swift
//  
//
//  Created by Tuan Hoang on 25/11/23.
//

import XCTest
import Domain
import DomainData
import NetworkMock
import OHHTTPStubs
import OHHTTPStubsSwift
import Combine

@testable import People

fileprivate typealias State = PersonDetailViewModel.State

@MainActor
final class PersonDetailViewModelTests: XCTestCase {
    private var cancellables = Set<AnyCancellable>()
    
    func testFetchSuccess() {
        stubNetworkCall()
        let sut = setupSUT()
        let expectation = expectation(description: "Waiting for fetching apis")
        
        let expectedState: State = .display(data: [
            .detailInfo(personDetailMock, numberOfFilms: 2),
            .images(imagesMock),
            .movies(moviesMock),
            .tvSeries(tvSeriesMock)
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

extension PersonDetailViewModelTests {
    @MainActor func setupSUT() -> PersonDetailViewModel {
        return .init(dependencies: .init(
            personId: 91606,
            peopleRepository: PeopleRepository(apiClientService: createAPIClientServiceMock()))
        )
    }
    
    func stubNetworkCall(isSuccess: Bool = true) {
        let statusCode: Int32 = isSuccess ? 200 : 404
        stub(condition: isPath("/3/person/91606")) { request in
            return HTTPStubsResponse(
                fileURL: Bundle.module.url(forResource: "fetchPersonDetailResponse", withExtension: "json")!,
                statusCode: statusCode,
                headers: nil
            )
        }
        
        stub(condition: isPath("/3/person/91606/images")) { request in
            return HTTPStubsResponse(
                fileURL: Bundle.module.url(forResource: "fetchPersonImageResponse", withExtension: "json")!,
                statusCode: statusCode,
                headers: nil
            )
        }
        
        stub(condition: isPath("/3/person/91606/movie_credits")) { request in
            return HTTPStubsResponse(
                fileURL: Bundle.module.url(forResource: "fetchPersonMoviesResponse", withExtension: "json")!,
                statusCode: statusCode,
                headers: nil
            )
        }
        
        stub(condition: isPath("/3/person/91606/tv_credits")) { request in
            return HTTPStubsResponse(
                fileURL: Bundle.module.url(forResource: "fetchPersonTVResponse", withExtension: "json")!,
                statusCode: statusCode,
                headers: nil
            )
        }
    }
}

extension PersonDetailViewModel.State: Equatable {
    public static func == (lhs: PersonDetailViewModel.State, rhs: PersonDetailViewModel.State) -> Bool {
        if case .loading = lhs, case .loading = rhs { return true }
        if case .error = lhs, case .error = rhs { return true }

        if case let .display(lhsData) = lhs, case let .display(rhsData) = rhs {
            return lhsData == rhsData
        }

        return false
    }
}
