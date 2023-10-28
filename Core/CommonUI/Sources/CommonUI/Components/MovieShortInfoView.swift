//
//  MovieShortInfoView.swift
//  iMovie
//
//  Created by Tuan Hoang on 22/06/2023.
//

import DesignSystem
import Domain
import SwiftUI

public struct MovieShortInfoView: View {
    private let posterPath: URL?
    private let title: String
    private let voteAvarage: Double

    public init(movie: Movie) {
        posterPath = movie.posterPath
        title = movie.originalTitle
        voteAvarage = movie.voteAverage
    }

    public init(tvSerires: TVSeries) {
        posterPath = tvSerires.posterPath
        title = tvSerires.originalName ?? ""
        voteAvarage = tvSerires.voteAverage
    }

    public var body: some View {
        VStack {
            RemoteImageView(imageURL: posterPath)
                .cornerRadius(4)
                .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 2)
                .frame(width: 128, height: 185)

            HStack(spacing: 0) {
                Text(title)
                    .lineLimit(2)
                    .font(.semibold13)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.white)

                Spacer().frame(width: 8)

                HStack(alignment: .lastTextBaseline, spacing: 0) {
                    Text("\(voteAvarage.integerValue).")
                        .font(.bold24)

                    Text("\(voteAvarage.firstDecimalValue)")
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
