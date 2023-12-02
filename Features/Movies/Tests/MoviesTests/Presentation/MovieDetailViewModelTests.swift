//
//  MovieDetailViewModelTests.swift
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

@testable import Movies

fileprivate typealias State = MovieDetailViewModel.State

@MainActor
final class MovieDetailViewModelTests: XCTestCase {
    private var cancellables = Set<AnyCancellable>()
    
    func testFetchSuccess() {
        stubNetworkCall()
        let sut = setupSUT()
        
        let expectation = expectation(description: "Waiting for fetching apis")
        
        let expectedState: State = .display(data: [
            .shortInfo(genresMock),
            .gallery(movieImagesMock),
            .overview(movieMock.overview),
            .actors(actorsMock),
            .reviews(reviewsMock),
            .recommendMovies(recommendMoviesMock)
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

extension MovieDetailViewModelTests {
    @MainActor func setupSUT() -> MovieDetailViewModel {
        let apiClientService = createAPIClientServiceMock()
        return .init(dependencies: .init(
            movie: movieMock,
            movieDetailRepository: MovieDetailRepository(apiClientService: apiClientService),
            accountRepository: AccountRepository(apiClientService: apiClientService))
        )
    }
    
    func stubNetworkCall(isSuccess: Bool = true) {
        let statusCode: Int32 = isSuccess ? 200 : 404
        let movieId = 64655
        stub(condition: isPath("/3/movie/\(movieId)")) { request in
            return HTTPStubsResponse(
                fileURL: Bundle.module.url(forResource: "fetchMovieDetailResponse", withExtension: "json")!,
                statusCode: statusCode,
                headers: nil
            )
        }
        
        stub(condition: isPath("/3/movie/\(movieId)/images")) { request in
            return HTTPStubsResponse(
                fileURL: Bundle.module.url(forResource: "fetchMovieImagesResponse", withExtension: "json")!,
                statusCode: statusCode,
                headers: nil
            )
        }
        
        stub(condition: isPath("/3/movie/\(movieId)/credits")) { request in
            return HTTPStubsResponse(
                fileURL: Bundle.module.url(forResource: "fetchMovieCreditsResponse", withExtension: "json")!,
                statusCode: statusCode,
                headers: nil
            )
        }
        
        stub(condition: isPath("/3/movie/\(movieId)/reviews")) { request in
            return HTTPStubsResponse(
                fileURL: Bundle.module.url(forResource: "fetchMovieReviewsResponse", withExtension: "json")!,
                statusCode: statusCode,
                headers: nil
            )
        }
        
        stub(condition: isPath("/3/movie/\(movieId)/similar")) { request in
            return HTTPStubsResponse(
                fileURL: Bundle.module.url(forResource: "fetchSimilarResponse", withExtension: "json")!,
                statusCode: statusCode,
                headers: nil
            )
        }
        
        stub(condition: isPath("/3/account/20023836/favorite/movies")) { request in
            return HTTPStubsResponse(
                fileURL: Bundle.module.url(forResource: "fetchFavoriteMoviesResponse", withExtension: "json")!,
                statusCode: statusCode,
                headers: nil
            )
        }
        
        stub(condition: isPath("/3/account/20023836/watchlist/movies")) { request in
            return HTTPStubsResponse(
                fileURL: Bundle.module.url(forResource: "fetchWatchlistMoviesResponse", withExtension: "json")!,
                statusCode: statusCode,
                headers: nil
            )
        }
    }
}

extension MovieDetailViewModel.State: Equatable {
    public static func == (lhs: MovieDetailViewModel.State, rhs: MovieDetailViewModel.State) -> Bool {
        if case .loading = lhs, case .loading = rhs { return true }
        if case .error = lhs, case .error = rhs { return true }
        
        if case let .display(lhsData) = lhs, case let .display(rhsData) = rhs {
            return lhsData == rhsData
        }
        
        return false
    }
}
