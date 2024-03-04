//
//  Color.swift
//
//
//  Created by Hoang Anh Tuan on 18/10/2023.
//

import SwiftUI

public extension Color {
    static let color04EECD: Color = .init(hex: "04EECD")!
    static let color4E89FF: Color = .init(hex: "4E89FF")!
    static let color0E264B: Color = .init(hex: "0E264B")!
    static let color295091: Color = .init(hex: "295091")!
    static let color040F23: Color = .init(hex: "040F23")!
    static let colorE56E34: Color = .init(hex: "E56E34")!
    static let color104564: Color = .init(hex: "104564")!
}

extension Color {
    init?(hex: String) {
        var hexSanitized: String = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

        var rgb: UInt64 = 0

        var red: CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue: CGFloat = 0.0
        var alpha: CGFloat = 1.0

        let length = hexSanitized.count

        guard Scanner(string: hexSanitized).scanHexInt64(&rgb) else { return nil }

        if length == 6 {
            red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
            green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
            blue = CGFloat(rgb & 0x0000FF) / 255.0

        } else if length == 8 {
            red = CGFloat((rgb & 0xFF00_0000) >> 24) / 255.0
            green = CGFloat((rgb & 0x00FF_0000) >> 16) / 255.0
            blue = CGFloat((rgb & 0x0000_FF00) >> 8) / 255.0
            alpha = CGFloat(rgb & 0x0000_00FF) / 255.0

        } else {
            return nil
        }

        self.init(red: red, green: green, blue: blue, opacity: alpha)
    }
}
