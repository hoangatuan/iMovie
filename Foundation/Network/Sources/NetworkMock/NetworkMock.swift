//
//  File.swift
//  
//
//  Created by Tuan Hoang on 25/11/23.
//

import Foundation
import Network
import Logger

public func createAPIClientServiceMock() -> IAPIClientService {
    return APIClientService(
        logger: NoLogger(label: ""),
        configuration: .init(
            baseURL: URL(string: "https://api.themoviedb.org"),
            baseHeaders: [
                "accept": "application/json",
                "content-type": "application/json"
            ]
        )
    )
}
