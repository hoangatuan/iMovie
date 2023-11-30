//
//  main.swift
//  iMovie
//
//  Created by Tuan Hoang on 30/11/23.
//

import Foundation
import UIKit
import SwiftUI

/// Speed up testing time.
/// Ref: https://samwize.com/2023/01/18/disconnect-your-app-from-unit-testing/#google_vignette

struct EmptyApp: App {
    var body: some Scene {
        WindowGroup {
            
        }
    }
}

if NSClassFromString("XCTestCase") != nil { // Unit Testing
    EmptyApp.main()
} else { // App
    MovieApp.main()
}
