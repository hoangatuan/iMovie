import SwiftSyntaxMacros
import SwiftSyntaxMacrosTestSupport
import XCTest

// Macro implementations build for the host, so the corresponding module is not available when cross-compiling. Cross-compiled tests may still make use of the macro itself in end-to-end tests.
#if canImport(HelperMacrosMacros)
import HelperMacrosMacros

let testMacros: [String: Macro.Type] = [
    "stringify": StringifyMacro.self,
    "DefaultInit": DefaultInit.self
]
#endif

final class HelperMacrosTests: XCTestCase {
    func testDefaultInit() throws {
        #if canImport(HelperMacrosMacros)
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
        #else
        throw XCTSkip("macros are only supported when running tests for the host platform")
        #endif
    }
}
