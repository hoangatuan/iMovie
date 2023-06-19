//
//  Genre.swift
//  iMovie
//
//  Created by Tuan Hoang on 19/06/2023.
//

import Foundation

extension Genre {
    var iconName: String {
        return String(reflecting: self)
    }
}
