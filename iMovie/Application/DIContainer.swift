//
//  Container.swift
//  iMovie
//
//  Created by Tuan Hoang on 17/06/2023.
//

import Foundation
import Network
import Factory
import Logger

extension Container {
    var apiClientService: Factory<IAPIClientService> {
        self { APIClientService(logger: Logger(label: "iMovie")) }
    }
}
