import XCTest
import SwiftShell
@testable import DangerSwiftPeriphery

final class PeripheryExecutionTests: XCTestCase {
    private var shellExecutor: Shell!

    override func setUpWithError() throws {
        try super.setUpWithError()

        shellExecutor = .init()
    }

    func testExecutePeriphery() throws {
        let result = shellExecutor.execute("swift run periphery", arguments: ["version"])
        switch result {
        case .success:
            break
        case let .failure(error):
            XCTFail(error.localizedDescription)
        }
    }
}
