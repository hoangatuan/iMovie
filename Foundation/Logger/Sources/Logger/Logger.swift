
import Foundation
import Logging

public protocol ILogger {
    func log(
        level: LogLevel,
        message: @autoclosure () -> String
    )
}

public struct Logger: ILogger {
    private let logger: Logging.Logger

    public init(label: String) {
        self.logger = Logging.Logger(label: label)
    }

    public func log(level: LogLevel, message: @autoclosure () -> String) {
        logger.log(
            level: level.toLoggingLevel(),
            .init(stringLiteral: message())
        )
    }
}

public enum LogLevel {
    case trace
    case debug
    case info
    case notice
    case warning
    case error
    case critical

    func toLoggingLevel() -> Logging.Logger.Level {
        switch self {
        case .trace:
            return .trace
        case .debug:
            return .debug
        case .info:
            return .info
        case .notice:
            return .notice
        case .warning:
            return .warning
        case .error:
            return .error
        case .critical:
            return .critical
        }
    }
}
