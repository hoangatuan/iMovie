import Foundation

struct PeripheryScanCommandBuilder {
    private let peripheryExecutable: String
    private let additionalArguments: [String]
    private let overrideArgumentKeys: [String] = [
        "--format",
//        "--quiet",
        "--disable-update-check"
    ]

    var command: String {
        // override --format, --quiet, --disable-update-check
        var overrideArguments: [String] = additionalArguments
        overrideArguments.removeAll(where: { argument -> Bool in
            overrideArgumentKeys.contains(where: { argument.hasPrefix($0) })
        })
        overrideArguments += [
            "--format checkstyle",
//            "--quiet",
            "--disable-update-check"
        ]

        return peripheryExecutable + " scan " + overrideArguments.joined(separator: " ")
    }

    init(peripheryExecutable: String,
         additionalArguments: [String]) {
        self.peripheryExecutable = peripheryExecutable
        self.additionalArguments = additionalArguments
    }
}
