//
//  GenreCell.swift
//
//
//  Created by Hoang Anh Tuan on 31/10/2023.
//

import DesignSystem
import Domain
import SwiftUI

struct GenreCell: View {
    let genre: Genre

    var body: some View {
        HStack {
            Image(genre.iconName, bundle: .module)
            Text(genre.name.rawValue)
                .foregroundColor(.white)

            Spacer()

            Spacer()
                .frame(width: 2, height: 28)
                .cornerRadius(4)
                .background(Color.color04EECD)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.horizontal)
        .background(
            LinearGradient(
                gradient: Gradient(colors: [
                    Color.color0E264B,
                    Color.color295091,
                ]),
                startPoint: .leading, endPoint: .trailing
            )
        )
        .cornerRadius(8)
    }
}
