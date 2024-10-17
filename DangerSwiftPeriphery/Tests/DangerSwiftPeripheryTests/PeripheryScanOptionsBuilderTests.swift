import XCTest
@testable import DangerSwiftPeriphery

final class PeripheryScanOptionsBuilderTests: XCTestCase {
    private let trueCondition = true
    private let falseCondition = false

    func testBuildBlock() {
        assert({
            PeripheryScanOptions.config("/path/to/config")
            PeripheryScanOptions.workspace("test-workspace")
            PeripheryScanOptions.schemes(["scheme1", "scheme2"])
            PeripheryScanOptions.skipBuild
        }, expected: [
            "--config /path/to/config",
            "--workspace test-workspace",
            "--schemes scheme1 --schemes scheme2",
            "--skip-build"
        ])
    }

    func testBuildOptionalTrueCondition() {
        assert({
            PeripheryScanOptions.config("/path/to/config")
            PeripheryScanOptions.workspace("test-workspace")
            if trueCondition {
                PeripheryScanOptions.schemes(["scheme1", "scheme2"])
            }
            PeripheryScanOptions.skipBuild
        }, expected: [
            "--config /path/to/config",
            "--workspace test-workspace",
            "--schemes scheme1 --schemes scheme2",
            "--skip-build"
        ])
    }

    func testBuildOptionalFalseCondition() {
        assert({
            PeripheryScanOptions.config("/path/to/config")
            PeripheryScanOptions.workspace("test-workspace")
            if falseCondition {
                PeripheryScanOptions.schemes(["scheme1", "scheme2"])
            }
            PeripheryScanOptions.skipBuild
        }, expected: [
            "--config /path/to/config",
            "--workspace test-workspace",
            "--skip-build"
        ])
    }

    func testBuildEitherFirst() {
        assert({
            PeripheryScanOptions.config("/path/to/config")
            PeripheryScanOptions.workspace("test-workspace")
            if trueCondition {
                PeripheryScanOptions.schemes(["scheme1", "scheme2"])
            } else {
                PeripheryScanOptions.schemes(["scheme3", "scheme4"])
            }
            PeripheryScanOptions.skipBuild
        }, expected: [
            "--config /path/to/config",
            "--workspace test-workspace",
            "--schemes scheme1 --schemes scheme2",
            "--skip-build"
        ])
    }

    func testBuildEitherSecond() {
        assert({
            PeripheryScanOptions.config("/path/to/config")
            PeripheryScanOptions.workspace("test-workspace")
            if falseCondition {
                PeripheryScanOptions.schemes(["scheme1", "scheme2"])
            } else {
                PeripheryScanOptions.schemes(["scheme3", "scheme4"])
            }
            PeripheryScanOptions.skipBuild
        }, expected: [
            "--config /path/to/config",
            "--workspace test-workspace",
            "--schemes scheme3 --schemes scheme4",
            "--skip-build"
        ])
    }
}

private extension PeripheryScanOptionsBuilderTests {
    func assert(@PeripheryScanOptionsBuilder _ arguments: () -> [String], expected: [String]) {
        XCTAssertEqual(arguments(), expected)
    }
}
