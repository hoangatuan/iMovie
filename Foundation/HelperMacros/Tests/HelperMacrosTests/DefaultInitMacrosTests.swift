//
//  DefaultInitMacrosTests.swift
//  
//
//  Created by Tuan Hoang on 30/11/23.
//

import SwiftSyntaxMacros
import SwiftSyntaxMacrosTestSupport
import HelperMacrosMacros
import XCTest

final class DefaultInitMacrosTests: XCTestCase {
    let testMacros: [String: Macro.Type] = [
        "DefaultInit": DefaultInit.self
    ]
    
    func testDefaultInit() {
        assertMacroExpansion(
            """
                @DefaultInit
                struct Person {
                    let name: String
                    let age: Int
                }
            """,
            expandedSource: """
                struct Person {
                    let name: String
                    let age: Int
                    public init(
                        name: String,
                        age: Int
                    ) {
                        self.name = name
                        self.age = age
                    }
                }
            """,
            macros: testMacros
        )
    }
    
    func testDefaultInit_withDefaultParams_useVar() {
        assertMacroExpansion(
            """
                @DefaultInit
                struct Person {
                    var name: String = "Tuan"
                    let age: Int
                }
            """,
            expandedSource: """
                struct Person {
                    var name: String = "Tuan"
                    let age: Int
                    public init(
                        name: String = "Tuan",
                        age: Int
                    ) {
                        self.name = name
                        self.age = age
                    }
                }
            """,
            macros: testMacros
        )
    }
    
    func testDefaultInit_withDefaultParams_useLet() {
        assertMacroExpansion(
            """
                @DefaultInit
                struct Person {
                    let name: String = "Tuan"
                    let age: Int
                }
            """,
            expandedSource: """
                struct Person {
                    let name: String = "Tuan"
                    let age: Int
                    public init(
                        age: Int
                    ) {
                        self.name = name
                        self.age = age
                    }
                }
            """,
            macros: testMacros
        )
    }
    
    func testDefaultInit_multipleDeclarationInSameLine() {
        assertMacroExpansion(
            """
                @DefaultInit
                struct Person {
                    let name, fullName: String
                    let age: Int
                }
            """,
            expandedSource: """
                struct Person {
                    let name, fullName: String
                    let age: Int
                    public init(
                        name: String,
                        fullName: String,
                        age: Int
                    ) {
                        self.name = name
                        self.fullName = fullName
                        self.age = age
                    }
                }
            """,
            macros: testMacros
        )
    }

}
