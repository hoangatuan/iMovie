//
//  SwiftUIView.swift
//  
//
//  Created by Tuan Hoang on 18/11/23.
//

import UIKit
import SwiftUI
import Domain
import CommonUI

struct AiringTodayTVSeriesView: View {

    enum ButtonType: String {
        case favorite = "Favorite"
        case share = "Share"

        var image: UIImage {
            switch self {
            case .favorite:
                return .heart
            case .share:
                return .share
            }
        }

        var primaryColor: Color {
            switch self {
            case .favorite:
                return Color.colorE56E34
            case .share:
                return Color.color04EECD
            }
        }
    }

    private let tvseries: [TVSeries]
    init(tvseries: [TVSeries]) {
        self.tvseries = tvseries
    }

    var body: some View {
        Section {
            VStack(spacing: 8) {
                RemoteImageView(imageURL: tvseries[1].posterPath, contentMode: .fill)
                    .frame(height: 206)
                    .clipped()
                    .cornerRadius(8.0)
                shortInfoView
            }
            .padding(.horizontal, 16)
        }
        .modifier(DefaultListModifier())
    }

    private var shortInfoView: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(tvseries[0].originalName ?? "")
                    .font(.bold20)
                    .foregroundColor(.white)

                Spacer()

                Image(uiImage: .play)
                    .frame(width: 24, height: 24)
            }

            HStack(spacing: 8) {
                createButton(for: .favorite)
                createButton(for: .share)
            }
        }
    }

    private func createButton(for type: ButtonType) -> some View {
        HStack {
            ZStack(alignment: .center) {
                type.primaryColor
                    .frame(width: 24, height: 24)
                    .cornerRadius(4)

                Image(uiImage: type.image)
                    .frame(width: 16, height: 16)
            }

            Text(type.rawValue)
                .font(.regular14)
                .foregroundColor(.white)

            Spacer()
        }
        .padding(EdgeInsets(top: 6, leading: 8, bottom: 6, trailing: 0))
        .frame(width: 108)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(type.primaryColor, lineWidth: 2)
        )
    }
}
