import XCTest
@testable import DangerSwiftPeriphery

final class PeripheryScanOptionsTests: XCTestCase {
    func testPeripheryScanOptions() {
        var optionStringTable: [(target: PeripheryScanOptions, expected: String)] {
            [
                (.config("/path/to/config"), "--config /path/to/config"),
                (.workspace("test-workspace"), "--workspace test-workspace"),
                (.project("test-project"), "--project test-project"),
                (.schemes(["test-scheme1", "test-scheme2"]), "--schemes test-scheme1 --schemes test-scheme2"),
                (.targets(["test-target1", "test-target2"]), "--targets test-target1 --targets test-target2"),
                (.indexExclude(["index-exclude1", "index-exclude2"]), "--index-exclude index-exclude1 --index-exclude index-exclude2"),
                (.reportExclude(["report-exclude1", "report-exclude2"]), "--report-exclude report-exclude1 --report-exclude report-exclude2"),
                (.reportInclude(["report-include1", "report-include2"]), "--report-include report-include1 --report-include report-include2"),
                (.indexStorePath("/path/to/index-store"), "--index-store-path /path/to/index-store"),
                (.retainPublic, "--retain-public"),
                (.disableRedundantPublicAnalysis, "--disable-redundant-public-analysis"),
                (.retainAssignOnlyProperties, "--retain-assign-only-properties"),
                (.retainAssignOnlyPropertyTypes(["type1", "type2"]),
                    "--retain-assign-only-property-types type1 --retain-assign-only-property-types type2"),
                (.externalEncodableProtocols(["protocol1", "protocol2"]),
                    "--external-encodable-protocols protocol1 --external-encodable-protocols protocol2"),
                (.externalTestCaseClasses(["class1", "class2"]), "--external-test-case-classes class1 --external-test-case-classes class2"),
                (.retainObjcAccessible, "--retain-objc-accessible"),
                (.retainObjcAnnotated, "--retain-objc-annotated"),
                (.retainUnusedProtocolFuncParams, "--retain-unused-protocol-func-params"),
                (.cleanBuild, "--clean-build"),
                (.retainSwiftUIPreviews, "--retain-swift-ui-previews"),
                (.skipBuild, "--skip-build"),
                (.relativeResults, "--relative-results"),
                (.strict, "--strict"),
                (.custom("--test test"), "--test test"),
            ]
        }

        for item in optionStringTable {
            XCTAssertEqual(item.target.optionString, item.expected)
        }
    }
}
