//
//  TVSeriesHomeView.swift
//
//
//  Created by Hoang Anh Tuan on 06/11/2023.
//

import CommonUI
import Domain
import DesignSystem
import SwiftUI

struct TVSeriesHomeView: View {
    @StateObject private var viewModel: TVSeriesHomeViewModel

    init(viewModel: TVSeriesHomeViewModel) {
        _viewModel = .init(wrappedValue: viewModel)
    }

    var body: some View {
        ZStack {
            switch viewModel.state {
            case .loading:
                EmptyView()
            case .display(let airingToday, let news, let popular):
                VStack(alignment: .leading) {
                    Text("TV Series")
                        .font(.bold24)
                        .foregroundColor(.white)
                    
                    AiringTodayTVSeriesView(tvseries: airingToday)
                    
                    Spacer()
                }
                .padding(.horizontal, 16)
            case .error:
                EmptyView()
            }
        }
        .screenBackground(with: .color040F23)
    }
    
    
}

struct AiringTodayTVSeriesView: View {
    
    enum ButtonType: String {
        case favorite = "Favorite"
        case share = "Share"
        
        var imageName: String {
            switch self {
            case .favorite:
                return "heart"
            case .share:
                return "share"
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
    
    private let tvseries: [TVSeries]
    init(tvseries: [TVSeries]) {
        self.tvseries = tvseries
    }
    
    var body: some View {
        VStack(spacing: 8) {
            RemoteImageView(imageURL: tvseries[0].posterPath, contentMode: .fill)
                .frame(height: 206)
                .clipped()
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                )
            
            shortInfoView
        }
    }
    
    private var shortInfoView: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(tvseries[0].originalName ?? "")
                    .font(.bold20)
                    .foregroundColor(.white)
                
                Spacer()
                
                Image("play")
                    .frame(width: 24, height: 24)
            }
            
            HStack(spacing: 8) {
                createButton(for: .favorite)
                createButton(for: .share)
            }
        }
    }
    
    private func createButton(for type: ButtonType) -> some View {
        HStack {
            ZStack(alignment: .center) {
                type.primaryColor
                    .frame(width: 24, height: 24)
                    .cornerRadius(4)
                
                Image(type.imageName)
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

struct DiscoveryTVSeriesView: View {
    private let newsTvSeries: [TVSeries]
    private let popularTvSerires: [TVSeries]
    
    init(newsTvSeries: [TVSeries], popularTvSerires: [TVSeries]) {
        self.newsTvSeries = newsTvSeries
        self.popularTvSerires = popularTvSerires
    }
    
    var body: some View {
        VStack {
            
        }
    }
}
