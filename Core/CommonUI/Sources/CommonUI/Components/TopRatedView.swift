//
//  SwiftUIView.swift
//  
//
//  Created by Tuan Hoang on 18/11/23.
//

import SwiftUI

public struct ShortInfo {
    let posterPath: URL?
    let title: String
    let voteAverage: Double
    
    public init(posterPath: URL?, title: String, voteAverage: Double = 0.0) {
        self.posterPath = posterPath
        self.title = title
        self.voteAverage = voteAverage
    }
}

public struct TopRatedCell: View {
    private let index: Int
    private let item: ShortInfo

    public init(index: Int, item: ShortInfo) {
        self.item = item
        self.index = index
    }

    public var body: some View {
        ZStack(alignment: .top) {
            Color.color104564
                .ignoresSafeArea()
                .frame(width: 128)
                .cornerRadius(4)
                .padding(.top, 17)

            VStack(alignment: .center, spacing: 8) {
                Spacer().frame(height: 44)

                RemoteImageView(
                    imageURL: item.posterPath,
                    contentMode: .fill
                )
                .frame(width: 60, height: 60)
                .clipped()
                .clipShape(RoundedRectangle(cornerRadius: 4))

                Text(item.title)
                    .multilineTextAlignment(.center)
                    .lineLimit(3)
                    .font(.semibold13)
                    .foregroundColor(.white)

                Spacer()

                Spacer()
                    .frame(width: 128, height: 3)
                    .background(Color.color04EECD)
            }

            VStack {
                Text("\(index)")
                    .font(.bold24)
                    .padding(EdgeInsets(top: 4, leading: 10, bottom: 4, trailing: 10))
                    .background(Color.colorE56E34)
                    .clipShape(Circle())
                    .padding(EdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4))
                    .background(Color.color040F23)
                    .clipShape(Circle())

                Spacer()
            }
        }
        .frame(width: 128, height: 180)
        .cornerRadius(4)
    }
}

#Preview {
    TopRatedCell(index: 1, item: .init(
        posterPath: nil,
        title: "Dilan 1990"
    ))
}
