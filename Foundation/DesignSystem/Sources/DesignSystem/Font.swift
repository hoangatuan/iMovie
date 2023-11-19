//
//  Font.swift
//
//
//  Created by Hoang Anh Tuan on 18/10/2023.
//

import SwiftUI

public extension Font {
    // Regular - weight = 400
    static let regular12 = Font.custom("Lato", size: 12).weight(.regular)
    static let regular13 = Font.custom("Lato", size: 13).weight(.regular)
    static let regular14 = Font.custom("Lato", size: 14).weight(.regular)
    static let regular16 = Font.custom("Lato", size: 16).weight(.regular)

    // Semibold - weight = 600
    static let semibold13 = Font.custom("Lato", size: 13).weight(.semibold)
    static let semibold14 = Font.custom("Lato", size: 14).weight(.semibold)
    static let semibold16 = Font.custom("Lato", size: 16).weight(.semibold)
    static let semibold18 = Font.custom("Lato", size: 18).weight(.semibold)
    static let semibold24 = Font.custom("Lato", size: 24).weight(.semibold)

    // Bold - weight = 700
    static let bold14 = Font.custom("Lato", size: 14).weight(.bold)
    static let bold20 = Font.custom("Lato", size: 20).weight(.bold)
    static let bold24 = Font.custom("Lato", size: 24).weight(.bold)
}
