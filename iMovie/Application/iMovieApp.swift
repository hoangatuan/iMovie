//
//  iMovieApp.swift
//  iMovie
//
//  Created by Tuan Hoang on 15/06/2023.
//

import Factory
import SwiftUI

@main
struct MovieApp: App {
    // swiftlint:disable:next weak_delegate
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            AppTabView(container: Container.shared)
        }
    }
}
