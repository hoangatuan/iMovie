import Foundation
#if canImport(FoundationXML)
import FoundationXML
#endif

protocol CheckstyleOutputParsable {
    func parse(xml: String) throws -> [Violation]
}

struct CheckstyleOutputParser: CheckstyleOutputParsable {
    private let projectRootPath: String

    init(projectRootPath: String) {
        self.projectRootPath = projectRootPath
    }

    func parse(xml: String) throws -> [Violation] {
        let xmlDocument = try XMLDocument(xmlString: xml, options: [])
        guard let rootElement = xmlDocument.rootElement(),
              rootElement.name == "checkstyle" else {
            throw Error.invalidCheckstyleXML
        }
        let fileElements = (try? rootElement.nodes(forXPath: "file") as? [XMLElement]) ?? []
        return fileElements.reduce([], { warnings, fileElement -> [Violation] in
            guard let location = fileElement.attribute(forName: "name")?.stringValue else { return warnings }
            let filePath = location.deletingPrefix(projectRootPath).deletingPrefix("/")
            let errorElements = (try? fileElement.nodes(forXPath: "error") as? [XMLElement]) ?? []
            return warnings + errorElements.compactMap({ errorElement -> Violation? in
                guard let lineString = errorElement.attribute(forName: "line")?.stringValue,
                      let line = Int(lineString),
                      let message = errorElement.attribute(forName: "message")?.stringValue else { return nil }
                return Violation(filePath: filePath, line: line, message: message)
            })
        })
    }
}

extension CheckstyleOutputParser {
    enum Error: Swift.Error {
        case invalidCheckstyleXML
    }
}

private extension String {
    func deletingPrefix(_ prefix: String) -> String {
        guard hasPrefix(prefix) else { return self }
        return String(dropFirst(prefix.count))
    }
}
