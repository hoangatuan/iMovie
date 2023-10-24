//
//  File.swift
//  
//
//  Created by Hoang Anh Tuan on 23/10/2023.
//

import Foundation
import Models

@MainActor
final class MovieDetailViewModel: ObservableObject {
    
    private let movieRepository: IMovieDetailRepository
    
    init(movieRepository: IMovieDetailRepository) {
        self.movieRepository = movieRepository
        
        Task {
            await fetch()
        }
    }
    
    enum SectionType: Equatable, Identifiable {
        case shortInfo([GenreDetail])
        case gallery([MovieImage])
        case overview(String)
        case actors([Credit])
        case reviews([Review])
        case recommendMovies([Movie])

        var id: UUID {
            return UUID()
        }
        
//        var isEmpty: Bool {
//            switch self {
//                case .discover(let array), .popular(let array), .latest(let array), .topRated(let array), .trending(let array):
//                    return array.isEmpty
//                case .genres(let array):
//                    return array.isEmpty
//            }
//        }
    }
    
    enum State {
        case loading, display(data: [SectionType]), error(error: Error)
    }
    
    @Published
    var state: State = .loading
    
    func fetch() async {
        
    }
}
