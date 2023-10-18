//
//  File.swift
//  
//
//  Created by Hoang Anh Tuan on 18/10/2023.
//

import SwiftUI

public extension Font {
    // Regular - weight = 400
    static let regular14 =  Font.custom("Lato", size: 14).weight(.regular) // 400
    
    // Semibold - weight = 600
    static let semibold13 = Font.custom("Lato", size: 13).weight(.semibold) // 600
    static let semibold14 = Font.custom("Lato", size: 14).weight(.semibold) // 600
    static let semibold16 = Font.custom("Lato", size: 16).weight(.semibold) // 600
    
    // Bold - weight = 700
    static let bold20 = Font.custom("Lato", size: 20).weight(.bold) // 700
    static let bold24 = Font.custom("Lato", size: 24).weight(.bold) // 700
}
