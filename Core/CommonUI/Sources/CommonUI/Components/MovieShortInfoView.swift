//
//  MovieShortInfoView.swift
//  iMovie
//
//  Created by Tuan Hoang on 22/06/2023.
//

import SwiftUI
import Models
import DesignSystem

public struct MovieShortInfoView: View {
    private let movie: Movie

    public init(movie: Movie) {
        self.movie = movie
    }

    public var body: some View {
        VStack {
            RemoteImageView(imageURL: movie.posterPath)
                .cornerRadius(4)
                .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 2)
                .frame(width: 122, height: 185)
            
            HStack(spacing: 0) {
                Text(movie.originalTitle)
                    .lineLimit(2)
                    .font(.semibold13)
                    .foregroundColor(.white)
                Spacer().frame(width: 8)
                
                HStack(alignment: .lastTextBaseline, spacing: 0) {
                    Text("\(movie.voteAverage.integerValue).")
                        .font(.bold24)
                        
                    Text("\(movie.voteAverage.firstDecimalValue)")
                        .font(.semibold14)
                }
                .foregroundColor(Color.colorE56E34)
            }
        }
        .frame(width: 128)
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

struct MovieShortInfoView_Previews: PreviewProvider {
    static var previews: some View {
        MovieShortInfoView(
            movie: Movie(
                id: 1,
                isAdult: false,
                backdropPath: nil,
                title: "Black Adam",
                originalLanguage: "en",
                originalTitle: "Black Adam",
                overview: "",
                posterPath: nil,
                mediaType: nil,
                genreIds: [],
                popularity: 0,
                releaseDate: "",
                hasVideo: false,
                voteAverage: 1.2,
                voteCount: 1000
            )
        )
    }
}
