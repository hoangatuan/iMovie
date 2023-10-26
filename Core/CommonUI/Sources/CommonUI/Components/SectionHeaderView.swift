//
//  SectionHeaderView.swift
//  iMovie
//
//  Created by Tuan Hoang on 22/06/2023.
//

import SwiftUI
import DesignSystem

public struct SectionHeaderView: View {
    private let title: String
    private let showArrowButton: Bool
    private let onTap: (() -> Void)?

    public init(title: String, showArrowButton: Bool = true, onTap: (() -> Void)? = nil) {
        self.title = title
        self.showArrowButton = showArrowButton
        self.onTap = onTap
    }

    public var body: some View {
        HStack {
            Text(title)
                .font(.semibold16)
                .foregroundColor(.gray)
            Spacer()
            
            if showArrowButton {
                Button(action: {
                    onTap?()
                }, label: {
                    Image("right_arrow")
                })
            }
        }
    }
}
