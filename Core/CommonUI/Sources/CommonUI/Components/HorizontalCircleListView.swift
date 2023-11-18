//
//  HorizontalCircleListView.swift
//
//
//  Created by Tuan Hoang on 17/11/23.
//

import SwiftUI

public protocol ImageHolder {
    var id: Int { get }
    var imageURL: URL? { get }
}

public struct HorizontalCircleListView: View {
    
    private let objects: [ImageHolder]
    private let onSelect: (ImageHolder) -> Void

    public init(objects: [ImageHolder], onSelect: @escaping (ImageHolder) -> Void) {
        self.objects = objects
        self.onSelect = onSelect
    }
    
    private let rows = [
        GridItem(.flexible()),
    ]
    
    public var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: rows, alignment: .top, spacing: 12) {
                ForEach(objects, id: \.id) { object in
                    RemoteImageView(imageURL: object.imageURL, contentMode: .fill)
                        .frame(width: 56, height: 56)
                        .cornerRadius(28)
                        .overlay(
                            RoundedRectangle(cornerRadius: 28)
                                .inset(by: 1)
                                .stroke(Color.color04EECD, lineWidth: 2)
                        )
                        .onTapGesture {
                            onSelect(object)
                        }
                }
            }
        }
    }
}
