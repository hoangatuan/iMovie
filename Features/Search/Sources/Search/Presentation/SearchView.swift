//
//  SearchView.swift
//  iMovie
//
//  Created by Tuan Hoang on 22/06/2023.
//

import SwiftUI
import Models
import CommonUI

struct SearchView: View {
    
    @StateObject private var viewModel: SearchViewModel
    init(viewModel: SearchViewModel) {
        self._viewModel = .init(wrappedValue: viewModel)
    }
    
    @State private var searchKeyword = ""

    var body: some View {
        ZStack {
            Color(red: 4/255, green: 15/255, blue: 35/255)
                .ignoresSafeArea()
                .frame(maxWidth: .infinity, maxHeight: .infinity)

            VStack {
                TextField("", text: $searchKeyword, prompt: Text("Search for the movies").foregroundColor(.gray))
                    .font(Font.custom("Lato", size: 16))
                    .foregroundColor(.white)

                switch viewModel.state {
                    case .emptyInput:
                        EmptyView()
                    case .loading:
                        EmptyView()
                    case .display(let movies):
                        if movies.isEmpty {
                            buildEmptyResultView()
                        } else {
                            buildListMoviesView(with: movies)
                        }
                    case .error:
                        EmptyView()
                }
                
                Spacer()
            }
            .padding(.init(top: 36, leading: 16, bottom: 16, trailing: 16))
        }
        .onSubmit(of: .text) {
            Task {
                await viewModel.search(keyword: searchKeyword)
            }
        }
    }

    private func buildEmptyResultView() -> some View {
        VStack {
            Image("search_movie")
            HStack {
                Text("No search results found")
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)

                Text("\"\(searchKeyword)\"")
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
            }
        }
    }

    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    private func buildListMoviesView(with movies: [Movie]) -> some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(movies, id: \.id) { movie in
                    MovieShortInfoView(movie: movie)
                }
            }
        }
    }
}
