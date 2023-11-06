//
//  ITVSeriesRepository.swift
//
//
//  Created by Hoang Anh Tuan on 06/11/2023.
//

import Foundation

public protocol ITVSeriesRepository {
    func latestTvSeries() async throws -> [TVSeries]
    func popularTvSeries() async throws -> [TVSeries]
}
