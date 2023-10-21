//
//  File.swift
//  
//
//  Created by Hoang Anh Tuan on 21/10/2023.
//

import Foundation
import Models

struct SearchActorResponse: Decodable {
    let results: [Models.Actor]
}

struct SearchTVSeriesResponse: Decodable {
    let results: [TVSeries]
}
