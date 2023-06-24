//
//  APIClientServiceLiveKey.swift
//  iMovie
//
//  Created by Tuan Hoang on 24/06/2023.
//

import Foundation
import ComposableArchitecture
import Network
import Logger

extension APIClientService: DependencyKey {
    public static var liveValue: APIClientService {
        APIClientService(logger: Logger(label: "iMovie"))
    }
}
