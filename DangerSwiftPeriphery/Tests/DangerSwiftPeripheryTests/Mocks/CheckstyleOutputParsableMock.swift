import Foundation
@testable import DangerSwiftPeriphery

final class CheckstyleOutputParsableMock: CheckstyleOutputParsable {
    var parseHandler: ((String) throws -> [Violation])?

    func parse(xml: String) throws -> [Violation] {
        guard let handler = parseHandler else {
            fatalError("parseHandler is nil.")
        }
        return try handler(xml)
    }
}
