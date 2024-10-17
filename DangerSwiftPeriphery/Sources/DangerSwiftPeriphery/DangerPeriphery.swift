import Danger

public enum DangerPeriphery {
    /// Run `periphery scan` to detect unused code in the diff.
    ///
    /// - Parameters:
    ///   - peripheryExecutable:
    ///     Path to periphery executable.
    ///     By default, the Periphery shipped with DangerSwiftPeriphery is used.
    ///     Specify this parameter if you want to use a pre-installed Periphery.
    ///     Example: `/usr/local/bin/periphery`
    ///   - arguments:
    ///     periphery options.
    ///   - shouldComment:
    ///     Flag if you want to comment using Danger or not.
    ///     Set to false if you want to use the return value to create your own comments, for example.
    ///   - verbose:
    ///     Set to true if logging is to be output.
    /// - Returns:
    ///   If scan succeeds, it returns a list of violations detected by Periphery.
    ///   If scan fails, it throws an error.
    @discardableResult
    public static func scan(peripheryExecutable: String = "swift run periphery",
                            @PeripheryScanOptionsBuilder arguments: () -> [String],
                            shouldComment: Bool = true,
                            verbose: Bool = false) -> Result<[Violation], Error> {
        scan(peripheryExecutable: peripheryExecutable,
             arguments: arguments(),
             shouldComment: shouldComment,
             verbose: verbose)
    }

    /// Run `periphery scan` to detect unused code in the diff.
    ///
    /// - Parameters:
    ///   - peripheryExecutable:
    ///     Path to periphery executable.
    ///     By default, the Periphery shipped with DangerSwiftPeriphery is used.
    ///     Specify this parameter if you want to use a pre-installed Periphery.
    ///     Example: `/usr/local/bin/periphery`
    ///   - arguments:
    ///     periphery options.
    ///   - shouldComment:
    ///     Flag if you want to comment using Danger or not.
    ///     Set to false if you want to use the return value to create your own comments, for example.
    ///   - verbose:
    ///     Set to true if logging is to be output.
    /// - Returns:
    ///   If scan succeeds, it returns a list of violations detected by Periphery.
    ///   If scan fails, it throws an error.
    @discardableResult
    public static func scan(peripheryExecutable: String = "swift run periphery",
                            arguments: [PeripheryScanOptions],
                            shouldComment: Bool = true,
                            verbose: Bool = false) -> Result<[Violation], Error> {
        scan(peripheryExecutable: peripheryExecutable,
             arguments: arguments.map { $0.optionString },
             shouldComment: shouldComment,
             verbose: verbose)
    }

    /// Run `periphery scan` to detect unused code in the diff.
    ///
    /// - Parameters:
    ///   - peripheryExecutable:
    ///     Path to periphery executable.
    ///     By default, the Periphery shipped with DangerSwiftPeriphery is used.
    ///     Specify this parameter if you want to use a pre-installed Periphery.
    ///     Example: `/usr/local/bin/periphery`
    ///   - arguments:
    ///     periphery options.
    ///   - shouldComment:
    ///     Flag if you want to comment using Danger or not.
    ///     Set to false if you want to use the return value to create your own comments, for example.
    ///   - verbose:
    ///     Set to true if logging is to be output.
    /// - Returns:
    ///   If scan succeeds, it returns a list of violations detected by Periphery.
    ///   If scan fails, it throws an error.
    @discardableResult
    public static func scan(peripheryExecutable: String = "swift run periphery",
                            arguments: [String] = [],
                            shouldComment: Bool = true,
                            verbose: Bool = false) -> Result<[Violation], Error> {
        Logger.shared.verbose = verbose

        // make dependencies
        let commandBuilder = PeripheryScanCommandBuilder(peripheryExecutable: peripheryExecutable,
                                                         additionalArguments: arguments)
        let scanExecutor = PeripheryScanExecutor(commandBuilder: commandBuilder)
        let danger = Danger()
        let currentPathProvider = CurrentPathProvider()
        let outputParser = CheckstyleOutputParser(projectRootPath: currentPathProvider.currentPath)

        // execute scan
        let result = self.scan(scanExecutor: scanExecutor,
                               outputParser: outputParser,
                               diffProvider: danger)

        // handle scan result
        handleScanResult(result, danger: danger, shouldComment: shouldComment)
        return result
    }

    static func scan<PSE: PeripheryScanExecutable,
                     OP: CheckstyleOutputParsable,
                     DP: PullRequestDiffProvidable>(
                        scanExecutor: PSE,
                        outputParser: OP,
                        diffProvider: DP) -> Result<[Violation], Error> {
        Result {
            let output = try scanExecutor.execute()
            let allViolations = try outputParser.parse(xml: output)
            let violationsForComment = allViolations.filter({ isViolationIncludedInInsertions($0, diffProvider: diffProvider) })
            return violationsForComment
        }
    }

    static func isViolationIncludedInInsertions(_ violation: Violation, diffProvider: PullRequestDiffProvidable) -> Bool {
        do {
            let changes = try diffProvider.diff(forFile: violation.filePath)
            // comment only `Created files` and `Files that have been modified and are contained within hunk`
            switch changes {
            case .created:
                return true
            case .deleted:
                return false
            case let .modified(hunks):
                return hunks.contains(where: { $0.newLineRange.contains(violation.line) })
            case .renamed:
                return false
            }
        } catch {
            Logger.shared.debug(error.localizedDescription)
            return false
        }
    }

    static func handleScanResult<Notifier: ViolationNotifier>(_ scanResult: Result<[Violation], Error>,
                                                              danger: Notifier,
                                                              shouldComment: Bool) {
        guard shouldComment else { return }
        switch scanResult {
        case .success(let violations):
            for violation in violations {
                danger.warn(violation: violation)
            }
        case .failure(let error):
            danger.fail(error.localizedDescription)
        }
    }
}
