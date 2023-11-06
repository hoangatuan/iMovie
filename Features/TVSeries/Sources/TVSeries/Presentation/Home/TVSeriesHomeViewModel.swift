//
//  TVSeriesHomeViewModel.swift
//
//
//  Created by Hoang Anh Tuan on 06/11/2023.
//

import Domain
import DomainData
import Foundation

@MainActor
final class TVSeriesHomeViewModel: ObservableObject {
    private let repository: ITVSeriesRepository

    init(movieRepository: ITVSeriesRepository) {
        repository = movieRepository
    }
}
