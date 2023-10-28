//
//  RemoteImageView.swift
//
//
//  Created by Tuan Hoang on 18/06/2023.
//

import NukeUI
import Shimmer
import SwiftUI

public struct RemoteImageView: View {
    private let imageURL: URL?
    private let contentMode: ContentMode
    private let cornerRadius: CGFloat

    public init(imageURL: URL?, contentMode: ContentMode = .fit, cornerRadius: CGFloat = 0) {
        self.imageURL = imageURL
        self.contentMode = contentMode
        self.cornerRadius = cornerRadius
    }

    public var body: some View {
        LazyImage(url: imageURL) { state in
            if let image = state.image {
                image
                    .resizable()
                    .aspectRatio(contentMode: contentMode)
                    .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
            } else {
                Color.gray.shimmering()
            }
        }
    }
}
