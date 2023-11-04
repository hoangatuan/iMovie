//
//  SearchView.swift
//  iMovie
//
//  Created by Tuan Hoang on 22/06/2023.
//

import CommonUI
import DesignSystem
import Domain
import Router
import SwiftUI

struct SearchView: View {
    @EnvironmentObject private var router: Router
    @StateObject private var viewModel: SearchViewModel
    init(viewModel: SearchViewModel) {
        _viewModel = .init(wrappedValue: viewModel)
    }

    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]

    @State private var searchKeyword = ""
    @State private var selectedSearchType: SearchType = .movie

    var body: some View {
        ZStack {
            Color.color040F23
                .ignoresSafeArea()
                .frame(maxWidth: .infinity, maxHeight: .infinity)

            VStack {
                searchBar

                if !searchKeyword.isEmpty {
                    tabsView
                }

                switch viewModel.state {
                case .emptyInput:
                    EmptyView()
                // TODO: After this project migrate to iOS 17+, use SwiftData to implement `Recent Search Keyword`. For now, can just use `UserDefault`
                case .loading:
                    EmptyView()
                // TODO: Shimmer View
                case let .display(searchType, datas):
                    if datas.isEmpty {
                        emptyResultView
                    } else {
                        buildResultView(searchType: searchType, with: datas)
                    }
                case .error:
                    EmptyView()
                }

                Spacer()
            }
        }
        .toolbar(.hidden, for: .tabBar)
        .customBackButton {
            router.navigateBack()
        }
        .onSubmit(of: .text) {
            Task {
                await viewModel.search(keyword: searchKeyword, for: selectedSearchType)
            }
        }
        .onChange(of: selectedSearchType, perform: { value in
            Task {
                await viewModel.search(keyword: searchKeyword, for: value)
            }
        })
    }

    private var searchBar: some View {
        VStack {
            HStack {
                Image("search")
                    .foregroundColor(Color.color4E89FF)
                    .frame(width: 24, height: 24)

                TextField(
                    "", text: $searchKeyword,
                    prompt: Text("Search for the movies").foregroundColor(.gray)
                )
                .font(.regular16)
                .foregroundColor(.white)

                if !searchKeyword.isEmpty {
                    Button {
                        searchKeyword = ""
                    } label: {
                        Image("clear")
                    }
                }
            }

            HStack {
                Spacer()
                    .frame(width: 24, height: 24)

                Spacer()
                    .frame(height: 1)
                    .background(Color.color4E89FF)
            }
        }
        .padding(.init(top: 0, leading: 16, bottom: 32, trailing: 16))
    }

    private var tabsView: some View {
        HStack {
            ForEach(SearchType.allCases, id: \.rawValue) { type in
                VStack {
                    Text(type.rawValue)
                        .font(selectedSearchType == type ? .semibold14 : .regular14)
                        .foregroundColor(selectedSearchType == type ? .white : .gray)
                        .onTapGesture {
                            selectedSearchType = type
                        }
                        .padding()

                    if selectedSearchType == type {
                        Spacer()
                            .frame(height: 1)
                            .background(Color.color4E89FF)
                    }
                }
                .frame(height: 36)
                .border(.gray)
            }
        }
        .frame(maxWidth: .infinity)
    }

    private var emptyResultView: some View {
        VStack {
            Spacer()
                .frame(height: 124)

            Image("search_movie")
            HStack {
                Text("No search results found")
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .font(.regular16)

                Text("\"\(searchKeyword)\"")
                    .multilineTextAlignment(.center)
                    .foregroundColor(.color04EECD)
                    .font(.semibold16)
            }
        }
    }

    private func buildResultView(searchType: SearchType, with datas: [Any]) -> some View {
        VStack {
            switch searchType {
            case .movie:
                if let movies = datas as? [Movie] {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: columns, spacing: 8) {
                            ForEach(movies, id: \.id) { movie in
                                MovieShortInfoView(movie: movie)
                            }
                        }
                    }
                }
            case .tvShows:
                if let tvSeries = datas as? [TVSeries] {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: columns, spacing: 8) {
                            ForEach(tvSeries, id: \.id) { tvSerires in
                                MovieShortInfoView(tvSerires: tvSerires)
                            }
                        }
                    }
                }
            case .person:
                if let persons = datas as? [Person] {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: columns, spacing: 8) {
                            ForEach(persons, id: \.id) { person in
                                PersonView(person: person)
                            }
                        }
                    }
                }
            }
        }
        .padding(.init(top: 0, leading: 16, bottom: 16, trailing: 16))
    }
}
