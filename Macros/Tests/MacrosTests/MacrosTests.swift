import SwiftSyntaxMacros
import SwiftSyntaxMacrosTestSupport
import XCTest
import MacrosMacros

let testMacros: [String: Macro.Type] = [
    "stringify": StringifyMacro.self,
    "URL": URLMacro.self // #URL should use URLMacro
]

final class MacrosTests: XCTestCase {
    func testMacro() {
        assertMacroExpansion(
            """
            #stringify(a + b)
            """,
            expandedSource: """
            (a + b, "a + b")
            """,
            macros: testMacros
        )
    }

    func testMacroWithStringLiteral() {
        assertMacroExpansion(
            #"""
            #stringify("Hello, \(name)")
            """#,
            expandedSource: #"""
            ("Hello, \(name)", #""Hello, \(name)""#)
            """#,
            macros: testMacros
        )
    }
    func testValidURL() {
        assertMacroExpansion(
        #"""
        #URL("https://www.avanderlee.com")
        """#,
        expandedSource: #"""
        URL(string: "https://www.avanderlee.com")!
        """#,
        macros: testMacros
        )
    }
}
