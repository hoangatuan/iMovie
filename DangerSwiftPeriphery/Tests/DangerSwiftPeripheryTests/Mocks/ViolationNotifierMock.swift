import Foundation
@testable import DangerSwiftPeriphery

final class ViolationNotifierMock: ViolationNotifier {
    var warnHandler: ((Violation) -> Void)?
    var failHandler: ((String) -> Void)?
    private(set) var warnCallCount = 0
    private(set) var failCallCount = 0

    func warn(violation: Violation) {
        warnCallCount += 1
        guard let handler = warnHandler else {
            fatalError("warnHandler is nil.")
        }
        handler(violation)
    }

    func fail(_ message: String) {
        failCallCount += 1
        guard let handler = failHandler else {
            fatalError("failHandler is nil.")
        }
        handler(message)
    }
}
