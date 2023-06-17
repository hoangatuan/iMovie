//
//  iMovieApp.swift
//  iMovie
//
//  Created by Tuan Hoang on 15/06/2023.
//

import SwiftUI

@main
struct iMovieApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
