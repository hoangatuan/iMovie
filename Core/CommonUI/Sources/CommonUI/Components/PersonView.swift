//
//  PersonView.swift
//
//
//  Created by Hoang Anh Tuan on 21/10/2023.
//

import DesignSystem
import Domain
import SwiftUI

public struct PersonView: View {
    private let person: Person

    public init(person: Person) {
        self.person = person
    }

    public var body: some View {
        VStack {
            RemoteImageView(imageURL: person.profilePath, contentMode: .fill)
                .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 2)
                .frame(width: 106, height: 106)
                .clipped()
                .cornerRadius(8)

            Text(person.originalName ?? "")
                .font(.semibold14)
                .foregroundColor(.white)

            Text(person.department)
                .font(.regular14)
                .foregroundColor(.gray)
        }
    }
}
