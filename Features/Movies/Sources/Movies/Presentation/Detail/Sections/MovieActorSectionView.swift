//
//  MovieActorSectionView.swift
//
//
//  Created by Hoang Anh Tuan on 26/10/2023.
//

import CommonUI
import DesignSystem
import Domain
import SwiftUI
import Router

struct MovieActorSectionView: View {
    @EnvironmentObject private var router: Router
    
    private let actors: [Credit]
    init(actors: [Credit]) {
        self.actors = actors
    }

    private let rows = [
        GridItem(.flexible()),
    ]

    var body: some View {
        Section {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: rows, alignment: .top, spacing: 8) {
                    ForEach(actors, id: \.id) { actor in
                        ActorView(actor: actor)
                            .frame(width: 155, height: 80)
                            .onTapGesture {
                                router.navigate(to: PublicMoviesDestination.personDetail(personId: actor.id))
                            }
                    }
                }
            }
        } header: {
            SectionHeaderView(title: "Actor") {}
        }
        .modifier(DefaultListModifier(leading: 16))
    }
}

struct ActorView: View {
    let actor: Credit
    var body: some View {
        HStack(alignment: .center, spacing: 6) {
            RemoteImageView(
                imageURL: actor.profilePath,
                contentMode: .fill,
                cornerRadius: 4
            )
            .frame(width: 64, height: 64)
            .clipShape(Circle())

            VStack(alignment: .leading) {
                Text(actor.name)
                    .font(.semibold14)
                    .foregroundColor(.white)

                Text(actor.department)
                    .font(.regular12)
                    .foregroundColor(.gray)
            }

            Spacer()
        }
        .padding(.all, 8)
        .background(Color.color104564)
        .cornerRadius(8)
    }
}
