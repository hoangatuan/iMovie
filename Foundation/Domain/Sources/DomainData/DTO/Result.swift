//
//  File.swift
//  
//
//  Created by Tuan Hoang on 18/11/23.
//

import Foundation

struct Result: Decodable {
    let success: Bool
    let statusCode: Int
    let statusMessage: String
    
    enum CodingKeys: String, CodingKey {
        case success
        case statusCode = "status_code"
        case statusMessage = "status_message"
    }
}
