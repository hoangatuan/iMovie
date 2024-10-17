import Foundation
import SwiftShell

protocol ShellExecutable {
    func execute(_ command: String) -> Result<String, CommandError>
    func execute(_ command: String, arguments: [String]) -> Result<String, CommandError>
}

extension ShellExecutable {
    func execute(_ command: String) -> Result<String, CommandError> {
        execute(command, arguments: [])
    }
}

enum CommandError: Error {
    case unknown(error: Error)
    case standard(exitCode: Int32, description: String)
}

extension Shell: ShellExecutable {
    func execute(_ command: String, arguments: [String] = []) -> Result<String, CommandError> {
        let script = "\(command) \(arguments.joined(separator: " "))"
        Logger.shared.debug("command started: \(script)")
        do {
            let output = try callAsFunction(command, arguments: arguments)
            Logger.shared.debug("command output: " + output)
            return .success(output)
        } catch let error as ShellError {
            return .failure(.standard(exitCode: error.exitStatus, description: error.description))
        } catch {
            return .failure(.unknown(error: error))
        }
    }
}
