//
//  GenresSectionView.swift
//  iMovie
//
//  Created by Tuan Hoang on 19/06/2023.
//

import SwiftUI
import Models
import CommonUI
import Router
import DesignSystem

struct GenresSectionView: View {
    
    @EnvironmentObject private var router: Router
    
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
                            .onTapGesture {
                                router.navigate(to: Destination.genreDetail)
                            }
                    }
                }
            }
            .frame(height: 104)
        } header: {
            SectionHeaderView(title: "Genres Movie") {
                
            }
        }
        .listRowSeparator(.hidden)
        .listRowInsets(.init(top: 16, leading: 16, bottom: 0, trailing: 0))
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
                .background(Color.color04EECD)
        }
        .frame(width: 128, height: 48)
        .padding(.horizontal)
        .background(
            LinearGradient(
                gradient: Gradient(colors: [
                    Color.color0E264B,
                    Color.color295091
                ]),
                startPoint: .leading, endPoint: .trailing
            )
        )
        .cornerRadius(8)
    }
}

extension Genre {
    var iconName: String {
        return String(describing: self.name)
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
