//
//  SwiftUIView.swift
//  
//
//  Created by Hoang Anh Tuan on 26/10/2023.
//

import CommonUI
import DesignSystem
import SwiftUI
import Models

struct MovieActorSectionView: View {
    
    private let actors: [Credit]
    init(actors: [Credit]) {
        self.actors = actors
    }
    
    private let rows = [
        GridItem(.flexible())
    ]
    
    var body: some View {
        Section {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: rows, alignment: .top, spacing: 8) {
                    ForEach(actors, id: \.id) { actor in
                        ActorView(actor: actor)
                            .frame(width: 155, height: 80)
                    }
                }
            }
        } header: {
            SectionHeaderView(title: "Actor") {

            }
        }
        .listRowSeparator(.hidden)
        .listRowInsets(.init(top: 0, leading: 16, bottom: 0, trailing: 0))
        .listRowBackground(Color.clear)
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
