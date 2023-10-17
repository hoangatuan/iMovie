//
//  MoviesHomeViewModel.swift
//  iMovie
//
//  Created by Hoang Anh Tuan on 15/10/2023.
//

import Foundation
import Models

@MainActor
final class MoviesHomeViewModel: ObservableObject {
    
    private let movieRepository: IMovieRepository
    
    init(movieRepository: IMovieRepository) {
        self.movieRepository = movieRepository
    }
    
    enum SectionType: Equatable, Identifiable {
        case discoverMovies([Movie])
        case genres([Genre])
        case popularMovies([Movie])

        var id: UUID {
            return UUID()
        }
        
        var isEmpty: Bool {
            switch self {
                case .discoverMovies(let array), .popularMovies(let array):
                    return array.isEmpty
                case .genres(let array):
                    return array.isEmpty
            }
        }
    }
    
    enum State {
        case loading, display(data: [SectionType]), error(error: Error)
    }
    
    @Published
    var state: State = .loading
    
    func fetch() async {
        
        async let discoveryMovies = movieRepository.fetchDiscoveryMovies()
        async let genres = movieRepository.fetchListGenres()
        async let popularMovies = movieRepository.fetchPopularMovies()
        
        var sections: [SectionType] = [
            .discoverMovies((try? await discoveryMovies) ?? []),
            .genres((try? await genres) ?? []),
            .popularMovies((try? await popularMovies) ?? [])
        ]
        
        sections = sections.filter { !$0.isEmpty }
        // TODO: Handle error
        state = .display(data: sections)
    }
    
}
