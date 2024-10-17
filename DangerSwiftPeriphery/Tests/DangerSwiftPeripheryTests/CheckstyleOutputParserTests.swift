import XCTest
@testable import DangerSwiftPeriphery

final class CheckstyleOutputParserTests: XCTestCase {
    private var outputParser: CheckstyleOutputParser!

    override func setUpWithError() throws {
        outputParser = CheckstyleOutputParser(projectRootPath: "/path/to")
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testValidXML() throws {
        let xmlString = """
        <?xml version="1.0" encoding="utf-8"?>
        <checkstyle version="4.3">
            <file name="/path/to/file1">
                <error line="1" column="15" severity="warning" message="test message 1"/>
                <error line="2" column="29" severity="warning" message="test message 2"/>
            </file>
            <file name="/path/to/file2">
                <error line="1" column="15" severity="warning" message="test message 3"/>
            </file>
        </checkstyle>
        """

        do {
            let violations = try outputParser.parse(xml: xmlString)

            XCTAssertEqual(violations.count, 3)
            XCTAssertEqual(violations[0].filePath, "file1")
            XCTAssertEqual(violations[0].line, 1)
            XCTAssertEqual(violations[0].message, "test message 1")
            XCTAssertEqual(violations[1].filePath, "file1")
            XCTAssertEqual(violations[1].line, 2)
            XCTAssertEqual(violations[1].message, "test message 2")
            XCTAssertEqual(violations[2].filePath, "file2")
            XCTAssertEqual(violations[2].line, 1)
            XCTAssertEqual(violations[2].message, "test message 3")
        } catch {
            XCTFail("Unexpected error: \(error)")
        }
    }

    func testInvalidCheckstyleXML() throws {
        let xmlString = """
        <?xml version="1.0" encoding="utf-8"?>
        <test version="4.3">
            <file name="/path/to/file1">
                <error line="1" column="15" severity="warning" message="test message 1"/>
                <error line="2" column="29" severity="warning" message="test message 2"/>
            </file>
        </test>
        """

        do {
            _ = try outputParser.parse(xml: xmlString)

            XCTFail("parse must fail")
        } catch let error as CheckstyleOutputParser.Error {
            switch error {
            case .invalidCheckstyleXML:
                // noop
                return
            }
        } catch {
            XCTFail("Unexpected error: \(error)")
        }
    }
}
