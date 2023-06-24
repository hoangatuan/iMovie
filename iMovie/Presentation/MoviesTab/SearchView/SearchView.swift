//
//  SearchView.swift
//  iMovie
//
//  Created by Tuan Hoang on 22/06/2023.
//

import SwiftUI
import ComposableArchitecture

struct SearchView: View {
    let store: StoreOf<SearchReducer>
    @State var searchKeyword = ""

    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            ZStack {
                Color(red: 4/255, green: 15/255, blue: 35/255)
                    .ignoresSafeArea()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)

                VStack {
                    TextField("", text: $searchKeyword, prompt: Text("Search for the movies").foregroundColor(.gray))
                        .font(Font.custom("Lato", size: 16))
                        .foregroundColor(.white)

                    switch viewStore.displayState {
                    case .emptyInput:
                        EmptyView()
                    case .emptyResult:
                        buildEmptyResultView()
                    case .matchResults(let movies):
                        buildListMoviesView(with: movies)
                    }

                    Spacer()
                }
                .padding(.init(top: 36, leading: 16, bottom: 16, trailing: 16))
            }
            .onSubmit(of: .text) {
                viewStore.send(.inputChanged(searchKeyword))
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

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SearchView(
                store: Store(
                    initialState: SearchReducer.State(displayState: .emptyInput),
                    reducer: {
                        SearchReducer()
                    })
            )
        }
    }
}
