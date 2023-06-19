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

    var body: some View {
        Section {
            VStack {
                Grid {
                    GridRow {
                        Text("Action")
                        Text("Family")
                    }
                    GridRow {
                        Text("Adventure")
                        Text("Horror")
                    }
                }
            }
        } header: {
            HStack {
                Text("Genres Movie")
                    .font(.title3)
                    .fontWeight(.medium)
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
