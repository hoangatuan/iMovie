//
//  File.swift
//  
//
//  Created by Hoang Anh Tuan on 25/10/2023.
//

import CommonUI
import Models
import SwiftUI

struct MovieDetailShortInfoSectionView: View {
    
    private let movie: Movie
    private let genres: String
    
    init(movie: Movie, genres: [GenreDetail]) {
        self.movie = movie
        self.genres = genres.reduce("", { $0 + $1.name })
    }
    
    var body: some View {
        ZStack {
            RemoteImageView(imageURL: movie.posterPath, contentMode: .fit)
            
            movieShortInfoView
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        }
    }
    
    private var movieShortInfoView: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .center) {
                VStack {
                    Text(movie.title)
                        .font(.bold20)
                        .foregroundColor(.white)
                    
                    Text(genres)
                        .font(.regular14)
                        .foregroundColor(.gray)
                }
                
                Spacer()
                
                HStack(alignment: .firstTextBaseline, spacing: 0) {
                    Text("\(movie.voteAverage.integerValue).")
                        .font(.bold24)
                        
                    Text("\(movie.voteAverage.firstDecimalValue)")
                        .font(.semibold14)
                }
                .foregroundColor(.white)
                .padding(.all, 8)
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
            .padding(EdgeInsets(top: 6, leading: 8, bottom: 6, trailing: 8))
            .background(Color.color04EECD)
            .cornerRadius(8)
        }
        .padding(.horizontal, 16)
    }
}

