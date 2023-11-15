//
//  DiscoveryMoviesSectionView.swift
//  iMovie
//
//  Created by Tuan Hoang on 18/06/2023.
//

import CommonUI
import Domain
import Factory
import Router
import SwiftUI

struct DiscoveryMoviesSectionView: View {
    @EnvironmentObject private var router: Router

    private let movies: [Movie]
    init(movies: [Movie]) {
        self.movies = movies
    }

    var body: some View {
        ZStack {
            RemoteImageView(imageURL: movies[0].posterPath, contentMode: .fit)
                .opacity(0.4)

            headerView

            movieShortInfoView
        }
        .listRowSeparator(.hidden)
        .listRowInsets(EdgeInsets())
        .listRowBackground(Color.clear)
    }

    private var headerView: some View {
        HStack(spacing: 12) {
            Text("Discover")
                .font(.bold24)
                .foregroundColor(.white)

            Spacer()

            Image("search")
                .frame(width: 24, height: 24)
                .foregroundColor(Color.white)
                .onTapGesture(perform: {
                    router.navigate(to: PublicMoviesDestination.search)
                })
        }
        .padding(.init(top: 56, leading: 16, bottom: 0, trailing: 16))
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }

    private var movieShortInfoView: some View {
        HStack {
            Spacer().frame(width: 16)
            VStack(alignment: .leading) {
                Spacer()
                RemoteImageView(imageURL: movies[0].posterPath, cornerRadius: 8)
                    .frame(width: 86, height: 130)

                Text(movies[0].title)
                    .font(.bold20)
                    .foregroundColor(.white)
            }

            Spacer()
        }
    }
}
