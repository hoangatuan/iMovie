//
//  iMovieApp.swift
//  iMovie
//
//  Created by Tuan Hoang on 15/06/2023.
//

import SwiftUI
import Logger
import Network

/// This is just a temporary workaround. For the real app, should manage token in a secure way
fileprivate let accessToken = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5NzNjYWJmOGVhYzAzMTJhMmVlZDJjMDM1MTg5YmIyNCIsInN1YiI6IjY0OGQyNzkxNTU5ZDIyMDBmZjEwNGZkMiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.ExyYJzCPSAG2EkramJUa_OC3o9VD6GO_qaGPg0vZEh0"
let unused_var = "Ununsed variable"

struct MovieApp: App {
    // swiftlint:disable:next weak_delegate
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    let configuration: Configuration
    
    init() {
        let logger = Logger(label: "iMovie")
        let apiClientService = APIClientService(
            logger: logger,
            configuration: .init(
                baseURL: URL(string: "https://api.themoviedb.org"),
                baseHeaders: [
                    "accept": "application/json",
                    "Authorization": "Bearer \(accessToken)",
                    "content-type": "application/json"
                ]
            )
        )
        configuration = .init(
            logger: logger,
            apiClientService: apiClientService
        )
    }

    var body: some Scene {
        WindowGroup {
            AppTabView()
                .environmentObject(configuration)
        }
    }
}

class Configuration: ObservableObject {
    let logger: ILogger
    let apiClientService: IAPIClientService
    
    init(logger: ILogger, apiClientService: IAPIClientService) {
        self.logger = logger
        self.apiClientService = apiClientService
    }
}
