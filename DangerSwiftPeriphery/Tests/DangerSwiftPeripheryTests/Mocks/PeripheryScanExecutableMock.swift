import Foundation
@testable import DangerSwiftPeriphery

final class PeripheryScanExecutableMock: PeripheryScanExecutable {
    var executeHandler: (() throws -> String)?

    func execute() throws -> String {
        guard let executeHandler = executeHandler else {
            fatalError("executeHandler is nil.")
        }
        return try executeHandler()
    }
}
