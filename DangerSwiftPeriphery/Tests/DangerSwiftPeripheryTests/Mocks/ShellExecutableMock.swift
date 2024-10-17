import Foundation
@testable import DangerSwiftPeriphery

final class ShellExecutableMock: ShellExecutable {
    var executeHandler: ((String, [String]) -> Result<String, CommandError>)?

    func execute(_ command: String, arguments: [String]) -> Result<String, CommandError> {
        guard let handler = executeHandler else {
            fatalError("executeHandler is nil.")
        }
        return handler(command, arguments)
    }
}
