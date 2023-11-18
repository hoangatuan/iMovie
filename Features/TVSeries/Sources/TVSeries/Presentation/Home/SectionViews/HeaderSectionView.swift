//
//  HeaderSectionView.swift
//  iMovie
//
//  Created by Tuan Hoang on 18/11/23.
//

import SwiftUI
import CommonUI
import Router

struct HeaderSectionView: View {
    @EnvironmentObject private var router: Router
    
    var body: some View {
        Section {
            HStack {
                Text("TV Shows")
                    .font(.bold24)
                    .foregroundColor(.white)
                
                Spacer()
                
                Image("search")
                    .frame(width: 24, height: 24)
                    .foregroundColor(Color.white)
                    .onTapGesture(perform: {
                        router.navigate(to: PublicTVSeriesDestination.search)
                    })
            }
            .padding(.init(top: 56, leading: 16, bottom: 30, trailing: 16))
        }
        .modifier(DefaultListModifier())
    }
}
