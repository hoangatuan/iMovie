//
//  TVSeriesHomeView.swift
//
//
//  Created by Hoang Anh Tuan on 06/11/2023.
//

import DesignSystem
import SwiftUI

struct TVSeriesHomeView: View {
    @StateObject private var viewModel: TVSeriesHomeViewModel

    init(viewModel: TVSeriesHomeViewModel) {
        _viewModel = .init(wrappedValue: viewModel)
    }

    var body: some View {
        Text("TV Series")
    }
}
