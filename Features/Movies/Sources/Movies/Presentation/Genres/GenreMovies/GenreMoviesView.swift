//
//  GenreMoviesView.swift
//
//
//  Created by Hoang Anh Tuan on 31/10/2023.
//

import CommonUI
import Domain
import Router
import SwiftUI

struct GenreMoviesView: View {
    @EnvironmentObject private var router: Router

    @StateObject
    var viewModel: GenreMoviesViewModel
    
    init(dependencies: GenreMoviesViewModel.Dependencies) {
        _viewModel = .init(wrappedValue: GenreMoviesViewModel(dependencies: dependencies))
    }

    @State
    private var filterSelection: FilterState = .all

    @State
    private var isShowFilter: Bool = false

    var body: some View {
        ZStack {
            VStack {
                switch viewModel.state {
                case .loading:
                    EmptyView()
                case let .display(movies):
                    List {
                        buildGenreView(movie: movies[0])
                            .padding(.bottom, 12)
                        buildFilterView(movieCount: movies.count)
                        MoviesListView(movies: movies)
                    }
                    .listStyle(PlainListStyle())
                case .error:
                    EmptyView()
                }
            }

            if isShowFilter {
                FilterView(selection: $filterSelection, isShow: $isShowFilter)
                    .opacity(0.9)
                    .frame(width: 295)
            }
        }
        .ignoresSafeArea(edges: .top)
        .screenBackground(with: .color040F23)
        .toolbar(.hidden, for: .tabBar)
        .onChange(of: filterSelection, perform: { value in
            viewModel.applyFilter(value)
        })
        .customBackButton(action: {
            router.navigateBack()
        })
        .task {
            await viewModel.fetch()
        }
    }

    func buildGenreView(movie: Movie) -> some View {
        ZStack(alignment: .bottomLeading) {
            RemoteImageView(imageURL: movie.posterPath, contentMode: .fill)
                .opacity(0.8)
                .frame(height: 208)
                .clipped()

            Text(viewModel.genre.name.rawValue)
                .font(.semibold24)
                .foregroundStyle(Color.white)
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 24, trailing: 0))
        }
        .frame(maxWidth: .infinity)
        .modifier(DefaultListModifier())
    }

    func buildFilterView(movieCount: Int) -> some View {
        VStack(spacing: 0) {
            HStack {
                Text("\(movieCount) Movies")
                    .font(.bold14)
                    .foregroundColor(.white)

                Spacer()
                Button {
                    isShowFilter = true
                } label: {
                    HStack(spacing: 6) {
                        Image("filter")
                        Text("Filter")
                            .font(.regular14)
                            .foregroundColor(.white)
                    }
                }
            }

            Spacer().frame(height: 16)

            Spacer()
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 1)
                .cornerRadius(4)
                .background(Color.color04EECD)
        }
        .frame(maxWidth: .infinity)
        .modifier(DefaultListModifier(leading: 16, bottom: 12, trailing: 16))
    }
}
