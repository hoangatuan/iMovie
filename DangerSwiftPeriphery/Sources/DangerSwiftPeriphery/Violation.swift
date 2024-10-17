import Foundation

/// Struct representing the violation detected by `periphery scan`.
public struct Violation {
    public let filePath: String
    public let line: Int
    public let message: String
}
