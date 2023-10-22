//
//  SearchViewModelTests.swift
//  
//
//  Created by Hoang Anh Tuan on 21/10/2023.
//

import XCTest
import Network
import Logger
import OHHTTPStubs
import OHHTTPStubsSwift

@testable import Search
@testable import Models

final class SearchViewModelTests: XCTestCase {
    
    private var timesCallSearchMovieAPI = 0
    private var timesCallSearchTvSeriesAPI = 0
    private var timesCallSearchActorsAPI = 0
    
    @MainActor func testSearchMovies() async {
        /*
        let viewModel = SearchViewModel(
            searchRepository: SearchRepository(apiClientService: createAPIClientService())
        )
        
        stub(condition: isHost("api.themoviedb.org")) { request in
            self.timesCallSearchMovieAPI += 1
            return HTTPStubsResponse(
                fileAtPath: "",
                statusCode: 200,
                headers: nil
            )
        }
        
        XCTAssertEqual(timesCallSearchMovieAPI, 0)
        
        let movieResponse = Movie(
            id: 47369,
            isAdult: false,
            backdropPath: URL(string: "https://image.tmdb.org/t/p/w500/mQZ0jXbTfY4RAfPPp3iuH6vtKcX.jpg"),
            title: "Avenger",
            originalLanguage: "en",
            originalTitle: "Avenger",
            overview: "After his own daughter was killed in Panama in 1994",
            posterPath: URL(string: "https://image.tmdb.org/t/p/w500/cEI5aazuAVJ3PcWeNM8gxYiNjmq.jpg"),
            mediaType: nil,
            genreIds: [10770, 28, 53],
            popularity: 3.284,
            releaseDate: "2006-04-09",
            hasVideo: false,
            voteAverage: 5.923,
            voteCount: 26
        )
        
        await viewModel.search(keyword: "avenger", for: .movie)
        XCTAssertEqual(viewModel.state, .display(.movie, [movieResponse]))
        XCTAssertEqual(timesCallSearchMovieAPI, 1)
        
        await viewModel.search(keyword: "avenger", for: .movie)
        XCTAssertEqual(timesCallSearchMovieAPI, 0)
         */
    }
    
}

extension SearchViewModel.State: Equatable {
    public static func == (lhs: Search.SearchViewModel.State, rhs: Search.SearchViewModel.State) -> Bool {
        if case .emptyInput = lhs, case .emptyInput = rhs { return true }
        if case .loading = lhs, case .loading = rhs { return true }
        if case .error = lhs, case .error = rhs { return true }
         
        if case let .display(searchType1, data1) = lhs, case let .display(searchType2, data2) = rhs {
            if searchType1 != searchType2 { return false }
            switch searchType1 {
                case .movie:
                    return (data1 as! [Movie]) == (data2 as! [Movie])
                case .tvShows:
                    return (data1 as! [TVSeries]) == (data2 as! [TVSeries])
                case .actor:
                    return (data1 as! [Actor]) == (data2 as! [Actor])
            }
        }
        
        return false
    }
}

func createAPIClientService() -> IAPIClientService {
    APIClientService(logger: NoLogger(label: "test"))
}
