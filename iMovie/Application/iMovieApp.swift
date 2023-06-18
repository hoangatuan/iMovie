//
//  iMovieApp.swift
//  iMovie
//
//  Created by Tuan Hoang on 15/06/2023.
//

import SwiftUI
import Factory

@main
struct iMovieApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            AppTabView(container: Container.shared)
        }
    }
}
