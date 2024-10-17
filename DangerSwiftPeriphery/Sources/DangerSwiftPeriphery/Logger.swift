import Foundation

final class Logger {
    static var shared = Logger()
    var verbose = false

    private var debugFromEnv: Bool {
        guard let debugEnv = ProcessInfo.processInfo.environment["DANGER_SWIFT_PERIPHERY_DEBUG"] else { return false }
        return ["1", "true", "yes"].contains(debugEnv.lowercased())
    }
    private let packageRootPath = #file.replacingOccurrences(of: "Sources/DangerSwiftPeriphery/Logger.swift", with: "")

    func debug(file: String = #file, function: String = #function, line: Int = #line, _ message: String) {
        guard verbose || debugFromEnv else { return }
        print("[\(Date())] \(file.replacingOccurrences(of: packageRootPath, with: "")):\(function)#\(line): \(message)")
    }
}
