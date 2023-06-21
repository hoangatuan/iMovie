//
//  GenresSectionView.swift
//  iMovie
//
//  Created by Tuan Hoang on 19/06/2023.
//

import SwiftUI

struct GenresSectionView: View {
    private let genres: [Genre]
    init(genres: [Genre]) {
        self.genres = genres
    }

    private let rows = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        Section {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: rows) {
                    ForEach(genres, id: \.id) { genre in
                        buildGenreCell(genre)
                    }
                }
            }
            .frame(height: 104)
        } header: {
            HStack {
                Text("Genres Movie")
                    .font(.title3)
                    .fontWeight(.medium)
                    .foregroundColor(.white)
                Spacer()
                Button(action: {
                    // TODO: (Tuan) Need to implement
                }, label: {
                    Image("right_arrow")
                })
            }
        }
        .listRowSeparator(.hidden)
        .listRowInsets(.none)
        .listRowBackground(Color.clear)
    }

    private func buildGenreCell(_ genre: Genre) -> some View {
        HStack {
            Image(genre.iconName)
            Text(genre.name.rawValue)
                .foregroundColor(.white)
            Spacer()

            Spacer()
                .frame(width: 2, height: 28)
                .cornerRadius(4)
                .background(Color(red: 4/255, green: 238/255, blue: 205/255))
        }
        .frame(width: 128, height: 48)
        .padding(.horizontal)
        .background(
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(red: 14/255, green: 38/255, blue: 75/255),
                    Color(red: 41/255, green: 80/255, blue: 145/255)
                ]),
                startPoint: .leading, endPoint: .trailing
            )
        )
        .cornerRadius(8)
    }
}

struct GenresSectionView_Previews: PreviewProvider {
    static var previews: some View {
        GenresSectionView(genres: [
            .init(id: 1, name: .action),
            .init(id: 2, name: .family),
            .init(id: 3, name: .adventure),
            .init(id: 4, name: .horror)
        ])
    }
}
