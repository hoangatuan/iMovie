//
//  SwiftUIView.swift
//  
//
//  Created by Tuan Hoang on 18/06/2023.
//

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
        AsyncImage(url: imageURL) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .aspectRatio(contentMode: contentMode)
                    .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
            } else {
                ProgressView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .font(.largeTitle)
            }
        }
    }
}
