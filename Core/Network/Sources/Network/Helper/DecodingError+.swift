//
//  File.swift
//  
//
//  Created by Tuan Hoang on 18/06/2023.
//

import Foundation

extension DecodingError {
    var detailErrorDescription: String {
        switch self {
        case .typeMismatch(let type, let context):
            return "Type \(type) mismatch: \(context.debugDescription)"
        case .valueNotFound(let type, let context):
            return "Type \(type) value not found: \(context.debugDescription)"
        case .keyNotFound(let codingKey, let context):
            return "Key \(codingKey) not found: \(context.debugDescription)"
        case .dataCorrupted(let context):
            return "Data corrupted: \(context.debugDescription)"
        @unknown default:
            return "Unknown case"
        }
    }
}
