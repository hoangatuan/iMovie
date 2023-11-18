//
//  MovieShortInfoView.swift
//  iMovie
//
//  Created by Tuan Hoang on 22/06/2023.
//

import DesignSystem
import Domain
import SwiftUI

//public protocol ItemShortInfo {
//    var id: Int { get }
//    var posterPath: URL? { get }
//    var title: String { get }
//    var voteAverage: Double { get }
//}
//
//extension Movie: ItemShortInfo { }
//
//extension TVSeries: ItemShortInfo {
//    public var title: String {
//        originalName ?? ""
//    }
//}

public struct MovieShortInfoView: View {
    
    private let shortInfo: ShortInfo
    public init(shortInfo: ShortInfo) {
        self.shortInfo = shortInfo
    }

    public var body: some View {
        VStack {
            RemoteImageView(imageURL: shortInfo.posterPath)
                .cornerRadius(4)
                .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 2)
                .frame(width: 128, height: 185)

            HStack(spacing: 0) {
                Text(shortInfo.title)
                    .lineLimit(2)
                    .font(.semibold13)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.white)

                Spacer().frame(width: 8)

                HStack(alignment: .lastTextBaseline, spacing: 0) {
                    Text("\(shortInfo.voteAverage.integerValue).")
                        .font(.bold24)

                    Text("\(shortInfo.voteAverage.firstDecimalValue)")
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
