//
//  SwiftUIView.swift
//  
//
//  Created by Hoang Anh Tuan on 23/10/2023.
//

import CommonUI
import Models
import SwiftUI

struct MovieDetailView: View {
    
    private let movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
    }
    
    var body: some View {
        VStack {
            ZStack {
                RemoteImageView(imageURL: movie.posterPath, contentMode: .fit)
                movieShortInfoView
            }
            
//            Text(movie.overview)
//                .font(.regular14)
//                .background(Color.gray)
//                .padding(.horizontal, 16)
        }
    }
    
    private var movieShortInfoView: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .bottom) {
                Text(movie.title)
                    .font(.bold20)
                    .foregroundColor(.white)
                
                Spacer()
                
                HStack(alignment: .lastTextBaseline, spacing: 0) {
                    Text("\(movie.voteAverage.integerValue).")
                        .font(.bold24)
                        
                    Text("\(movie.voteAverage.firstDecimalValue)")
                        .font(.semibold14)
                }
                .foregroundColor(.white)
                .padding(.all, 4)
                .background(Color.colorE56E34)
                .cornerRadius(8)
            }
            
            HStack(spacing: 8) {
                Image("play")
                    .frame(width: 24, height: 24)
                
                Text("PLAY TRAILER")
                    .font(.bold14)
                    .foregroundColor(.black)
            }
            .padding(.all, 4)
            .background(Color.color04EECD)
            .cornerRadius(8)
        }
        .padding(.horizontal, 16)
    }
}

extension Double {
    var integerValue: Int {
        let components = String(self).split(separator: ".")
        return Int(components[0]) ?? 0
    }
    
    var firstDecimalValue: Int {
        let components = String(self).split(separator: ".")
        let decimalPart = String(components[1])
        let firstDecimal = decimalPart.first.map { String($0) } ?? ""
        return Int(firstDecimal) ?? 0
    }
}

/*
#Preview {
    MovieDetailView()
}
*/
