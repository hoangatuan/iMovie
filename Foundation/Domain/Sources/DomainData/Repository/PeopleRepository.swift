//
//  File.swift
//  
//
//  Created by Tuan Hoang on 19/11/23.
//

import Domain
import Foundation
import Network

public final class PeopleRepository: IPeopleRepository {
    
    private let apiClientService: IAPIClientService
    public init(apiClientService: IAPIClientService) {
        self.apiClientService = apiClientService
    }
    
    public func fetchPersonDetail(personId: Int) async throws -> PersonDetail {
        try await apiClientService.request(
            APIEndpoints.fetchPersonDetail(personId: personId),
            mapper: PersondetaiMapper()
        )
    }
    
    public func fetchPersonImages(personId: Int) async throws -> [MovieImage] {
        try await apiClientService.request(
            APIEndpoints.fetchPersonImages(personId: personId),
            mapper: PersonImageResponseMapper()
        )
    }
    
    public func fetchMovieCredit(personId: Int) async throws -> [Movie] {
        try await apiClientService.request(
            APIEndpoints.fetchPersonMovieCredit(personId: personId),
            mapper: PersonMovieCreditResponseMapper()
        )
    }
    
    public func fetchTVCredit(personId: Int) async throws -> [TVSeries] {
        try await apiClientService.request(
            APIEndpoints.fetchPersonTVCredit(personId: personId),
            mapper: PersonTVCreditResponseMapper()
        )
    }
}
