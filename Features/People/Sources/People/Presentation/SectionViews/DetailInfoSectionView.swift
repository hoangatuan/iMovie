//
//  SwiftUIView.swift
//  
//
//  Created by Tuan Hoang on 19/11/23.
//

import UIKit
import SwiftUI
import CommonUI
import Domain
import Router

fileprivate enum ButtonType: String {
    case favorite = "Favorite"
    case share = "Share"
    
    var image: UIImage {
        switch self {
        case .favorite:
            return .heart
        case .share:
            return .share
        }
    }
    
    var primaryColor: Color {
        switch self {
        case .favorite:
            return Color.colorE56E34
        case .share:
            return Color.color04EECD
        }
    }
}

struct DetailInfoSectionView: View {
    @EnvironmentObject private var router: Router
    
    let detail: PersonDetail
    let numberOfFilms: Int
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(alignment: .center, spacing: 12) {
                RemoteImageView(imageURL: detail.profilePath, contentMode: .fill)
                    .frame(width: 108, height: 108)
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 20) {
                    HStack {
                        VStack(spacing: 4) {
                            Text("\(numberOfFilms)")
                                .font(.bold20)
                                .foregroundColor(.white)
                            
                            Text("Total films")
                                .font(.regular12)
                                .foregroundColor(.gray)
                        }
                        
                        Spacer()
                            .frame(width: 1)
                            .background(Color.gray)
                        
                        VStack(spacing: 4) {
                            Text(detail.birthday)
                                .font(.bold20)
                                .foregroundColor(.white)
                            
                            Text("Date of birth")
                                .font(.regular12)
                                .foregroundColor(.gray)
                        }
                    }
                    
                    HStack(spacing: 8) {
                        createButton(for: .favorite)
                        createButton(for: .share)
                            .onTapGesture {
                                router.presentSheet(destination: SheetDesination.share(person: detail))
                            }
                    }
                }
            }
            
            Text(detail.name)
                .font(.semibold18)
                .foregroundColor(.white)
            
            Text(detail.department)
                .font(.regular14)
                .foregroundColor(.white)
            
            HStack {
                Image("location", bundle: .module)
                    .frame(width: 24, height: 24)
                
                Text(detail.placeOfBirth)
                    .font(.regular14)
                    .foregroundColor(.white)
            }
            
            Spacer()
                .frame(width: 300, height: 2)
                .background(Color.orange)
            
            Text(detail.biography)
                .font(.regular14)
                .foregroundColor(.white)
                .lineLimit(3)
        }
        .modifier(DefaultListModifier(leading: 16))
    }
    
    private func createButton(for type: ButtonType) -> some View {
        HStack {
            ZStack(alignment: .center) {
                type.primaryColor
                    .frame(width: 24, height: 24)
                    .cornerRadius(4)
                
                Image(uiImage: type.image)
                    .frame(width: 16, height: 16)
            }
            
            Text(type.rawValue)
                .font(.regular14)
                .foregroundColor(.white)
            
            Spacer()
        }
        .padding(EdgeInsets(top: 6, leading: 8, bottom: 6, trailing: 0))
        .frame(width: 108)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(type.primaryColor, lineWidth: 2)
        )
    }
}
