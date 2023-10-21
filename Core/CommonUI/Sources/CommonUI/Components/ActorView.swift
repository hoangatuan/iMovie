//
//  File.swift
//  
//
//  Created by Hoang Anh Tuan on 21/10/2023.
//

import SwiftUI
import Models
import DesignSystem

public struct ActorView: View {
    private let actor: Actor

    public init(actor: Actor) {
        self.actor = actor
    }
    
    public var body: some View {
        VStack {
            RemoteImageView(imageURL: actor.profilePath, contentMode: .fill)
                .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 2)
                .frame(width: 106, height: 106)
                .clipped()
                .cornerRadius(8)
            
            Text(actor.originalName ?? "")
                .font(.semibold14)
                .foregroundColor(.white)
        }
    }
}
