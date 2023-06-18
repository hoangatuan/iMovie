//
//  File.swift
//  
//
//  Created by Tuan Hoang on 16/06/2023.
//

import Foundation

public protocol Mappable {
    associatedtype Input: Decodable
    associatedtype Output

    func map(_ input: Input) throws -> Output
}
