//
//  UserActionSectionView.swift
//
//
//  Created by Tuan Hoang on 18/11/23.
//

import SwiftUI
import CommonUI

enum ActionType {
    case toggleFavorite
    case share
    case toggleWatchlist
}

struct UserActionSectionView: View {
    var isFavorite: Bool
    var isWatchlist: Bool
    var onSelect: (ActionType) -> Void
    
    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: 0) {
                Button(action: {
                    onSelect(.toggleFavorite)
                }, label: {
                    VStack(alignment: .center) {
                        if isFavorite {
                            Image("heart")
                                .tint(Color.colorE56E34)
                        } else {
                            Image("heart-unselected")
                        }
                        
                        Text("Favorite")
                            .font(.regular13)
                            .foregroundColor(.white)
                    }
                })
                .frame(width: geometry.size.width * 0.25, height: geometry.size.height, alignment: .center)
                .border(width: 1, edges: [.top], color: .gray)
                
                Button(action: {
                    onSelect(.share)
                }, label: {
                    VStack(alignment: .center) {
                        Image("share")
                            .tint(.white)
                        
                        Text("Share")
                            .font(.regular13)
                            .foregroundColor(.white)
                    }
                })
                .frame(width: geometry.size.width * 0.25, height: geometry.size.height, alignment: .center)
                .border(width: 1, edges: [.top], color: .gray)
                
                Button(action: {
                    onSelect(.toggleWatchlist)
                }, label: {
                    HStack(spacing: 6) {
                        if isWatchlist {
                            Image("checkmark")
                                .tint(.black)
                        } else {
                            Image("add")
                        }
                        
                        Text("Watched list")
                            .font(.semibold16)
                            .foregroundColor(.black)
                    }
                })
                .frame(width: geometry.size.width * 0.5, height: geometry.size.height, alignment: .center)
                .background(Color.color04EECD)
            }
        }
        .ignoresSafeArea(edges: .bottom)
    }
}
