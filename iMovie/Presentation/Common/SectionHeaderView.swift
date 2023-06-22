//
//  SectionHeaderView.swift
//  iMovie
//
//  Created by Tuan Hoang on 22/06/2023.
//

import SwiftUI

struct SectionHeaderView: View {
    private let title: String
    private let onTap: () -> Void

    init(title: String, onTap: @escaping () -> Void) {
        self.title = title
        self.onTap = onTap
    }

    var body: some View {
        HStack {
            Text(title)
                .font(.title3)
                .fontWeight(.medium)
                .foregroundColor(.white)
            Spacer()
            Button(action: {
                onTap()
            }, label: {
                Image("right_arrow")
            })
        }
    }
}
