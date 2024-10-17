import Foundation

protocol ViolationNotifier {
    func warn(violation: Violation)
    func fail(_ message: String)
}
