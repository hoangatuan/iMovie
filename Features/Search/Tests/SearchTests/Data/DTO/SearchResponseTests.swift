//
//  File.swift
//  
//
//  Created by Hoang Anh Tuan on 21/10/2023.
//

import XCTest

@testable import Search
@testable import Models

final class SearchResponseTests: XCTestCase {
    
    func testSearchActorResponse() {
        let actorResponse = ActorResponse(
            adult: true,
            gender: .male,
            id: 1,
            name: "Eric",
            popularity: 2.0,
            originalName: "Tuan",
            profilePath: "/profilePath",
            knownFor: [
                .init(
                    backdropPath: "/backdropPath",
                    id: 2,
                    title: "memory leak check",
                    originalTitle: "Automating Memory Leak Detection with CI Integration for iOS",
                    overview: "Check for leak",
                    posterPath: "/posterPath",
                    popularity: 7.0,
                    mediaType: "media type",
                    voteAverage: 9.6,
                    voteCount: 96
                )
            ]
        )
        
        let result = try! SearchActorResponseMapper().map(.init(results: [actorResponse]))
        XCTAssertEqual(result.count, 1)
        
        let actor = result[0]
        
        XCTAssertEqual(actor.id, 1)
        XCTAssertEqual(actor.name, "Eric")
        XCTAssertEqual(actor.profilePath, URL(string: "https://image.tmdb.org/t/p/w500/profilePath"))
        XCTAssertEqual(actor.originalName, "Tuan")
        
        XCTAssertEqual(actor.knownFor.count, 1)
        
        XCTAssertEqual(actor.knownFor[0].backdropPath, URL(string: "https://image.tmdb.org/t/p/w500/backdropPath"))
        
        XCTAssertEqual(actor.knownFor[0].posterPath, URL(string: "https://image.tmdb.org/t/p/w500/posterPath"))
        
    }
}
