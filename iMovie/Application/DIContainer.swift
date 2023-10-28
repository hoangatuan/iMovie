//
//  DIContainer.swift
//  iMovie
//
//  Created by Tuan Hoang on 17/06/2023.
//

import Factory
import Foundation
import Logger
import Network

extension Container {
    var apiClientService: Factory<IAPIClientService> {
        self { APIClientService(logger: self.logger()) }
            .scope(.singleton)
    }

    var logger: Factory<ILogger> {
        self { Logger(label: "iMovie") }
            .scope(.singleton)
    }
}
