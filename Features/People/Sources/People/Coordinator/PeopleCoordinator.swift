//
//  SwiftUIView.swift
//  
//
//  Created by Tuan Hoang on 19/11/23.
//

import SwiftUI
import Domain
import DomainData
import Network
import Router

public enum PublicPeopleDestination: Hashable {
    case movieDetail(movie: Movie)
    case tvDetail(tvSeries: TVSeries)
}

enum SheetDesination: Identifiable {
    var id: String {
        switch self {
        case .share:
            return "share"
        }
    }
    
    case share(person: PersonDetail)
}

public struct PersonDetailCoordinator: View {
    
    @EnvironmentObject private var router: Router
    private let dependencies: Dependencies

    public init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    public var body: some View {
        PersonDetailView(viewModel: .init(
            personId: dependencies.personId,
            repository: PeopleRepository(apiClientService: dependencies.apiClient)
        ))
        .toolbar(.hidden, for: .tabBar)
        .sheet(item: $router.presentedSheet) { destination in
            if let destination = destination.destination as? SheetDesination {
                switch destination {
                case .share(person: let person):
                    Text("Share person")
                }
            }
        }
    }
}

public extension PersonDetailCoordinator {
    struct Dependencies {
        let personId: Int
        let apiClient: IAPIClientService
        
        public init(personId: Int, apiClient: IAPIClientService) {
            self.personId = personId
            self.apiClient = apiClient
        }
    }
}
