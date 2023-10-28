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

struct ReviewSectionView: View {
    
    let reviews: [Review]
    
    private let rows = [
        GridItem(.flexible())
    ]
    
    var body: some View {
        Section {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: rows, alignment: .top, spacing: 8) {
                    ForEach(reviews, id: \.id) { review in
                        ReviewView(review: review)
                            .frame(width: 256, height: 112)
                    }
                }
            }
        } header: {
            SectionHeaderView(title: "Reviews", showArrowButton: false)
        }
        .listRowSeparator(.hidden)
        .listRowInsets(.init(top: 16, leading: 16, bottom: 0, trailing: 0))
        .listRowBackground(Color.clear)
    }
}

struct ReviewView: View {
    
    let review: Review
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .center) {
                RemoteImageView(imageURL: review.authorDetail.avatarPath, contentMode: .fill)
                    .frame(width: 32, height: 32)
                    .clipShape(Circle())
                
                Text(review.authorDetail.username)
                    .font(.semibold14)
                    .foregroundColor(.white)
                
                Spacer()
            }
            
            Text(review.content)
                .font(.regular14)
                .lineLimit(3)
                .foregroundColor(.gray)
            
            Spacer()
        }
        .padding(.all, 12)
        .background(Color.color104564)
        .cornerRadius(8.0)
    }
}
