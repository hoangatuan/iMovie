//
//  File.swift
//  
//
//  Created by Tuan Hoang on 19/11/23.
//

import Domain
import DomainData
import Foundation

@MainActor
final class PersonDetailViewModel: ObservableObject {
    
    struct Dependencies {
        let personId: Int
        let peopleRepository: IPeopleRepository
    }
    
    private let personId: Int
    private let repository: IPeopleRepository
    
    init(dependencies: Dependencies) {
        self.personId = dependencies.personId
        self.repository = dependencies.peopleRepository
        Task {
            await fetch()
        }
    }
    
    enum SectionType: Equatable, Identifiable {
        case detailInfo(PersonDetail, numberOfFilms: Int)
        case images([MovieImage])
        case movies([Movie])
        case tvSeries([TVSeries])
        
        var id: UUID {
            return UUID()
        }
    }
    
    enum State {
        case loading, display(data: [SectionType]), error
    }
    
    @Published
    var state: State = .loading
    
    private func fetch() async {
        async let personDetail = repository.fetchPersonDetail(personId: personId)
        async let images = repository.fetchPersonImages(personId: personId)
        async let creditMovies = repository.fetchMovieCredit(personId: personId)
        async let creditTV = repository.fetchTVCredit(personId: personId)
        
        guard let detail = try? await personDetail,
              let images = try? await images,
              let movies = try? await creditMovies,
              let tvSeries = try? await creditTV else {
            state = .error
            return
        }
        
        let result: [SectionType] = [
            .detailInfo(detail, numberOfFilms: movies.count + tvSeries.count),
            .images(images),
            .movies(movies),
            .tvSeries(tvSeries)
        ]
        
        state = .display(data: result)
    }
}
