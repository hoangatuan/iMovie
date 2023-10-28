//
//  SwiftUIView.swift
//  
//
//  Created by Hoang Anh Tuan on 23/10/2023.
//

import CommonUI
import Models
import SwiftUI
import Router

struct MovieDetailView: View {
    
    @EnvironmentObject private var router: Router
    @StateObject private var viewModel: MovieDetailViewModel
    
    init(viewModel: MovieDetailViewModel) {
        self._viewModel = .init(wrappedValue: viewModel)
    }
    
    var body: some View {
        ZStack {
            Color.color040F23
                .ignoresSafeArea()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            switch viewModel.state {
                case .loading:
                    EmptyView()
                    // TODO: UI for loading state using default shimmer
                case let .display(sections):
                    List {
                        ForEach(sections) { section in
                            switch section {
                                case .shortInfo(let genres):
                                    MovieDetailShortInfoSectionView(movie: viewModel.movie, genres: genres)
                                case .gallery(let images):
                                    MovieGallerySectionView(movieImages: images)
                                case .overview(let content):
                                    Text(content)
                                        .font(.regular14)
                                        .foregroundColor(.gray)
                                        .listRowInsets(EdgeInsets(top: 24, leading: 16, bottom: 0, trailing: 16))
                                        .listRowBackground(Color.clear)
                                case .actors(let actors):
                                    MovieActorSectionView(actors: actors)
                                case .reviews(let reviews):
                                    ReviewSectionView(reviews: reviews)
                                case .recommendMovies(let movies):
                                    PopularSectionView(sectionTitle: "You may also like...", movies: movies)
                            }
                        }
                    }
                    .listStyle(PlainListStyle())
                case let .error(error):
                    EmptyView()
            }
        }
        .ignoresSafeArea(edges: .top)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    router.navigateBack()
                } label: {
                    Image("back")
                        .tint(.white)
                }
            }
        }
    }
}

extension Double {
    var integerValue: Int {
        let components = String(self).split(separator: ".")
        return Int(components[0]) ?? 0
    }
    
    var firstDecimalValue: Int {
        let components = String(self).split(separator: ".")
        let decimalPart = String(components[1])
        let firstDecimal = decimalPart.first.map { String($0) } ?? ""
        return Int(firstDecimal) ?? 0
    }
}

/*
#Preview {
    MovieDetailView()
}
*/
