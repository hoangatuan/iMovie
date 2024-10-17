import Danger

extension DangerDSL: ViolationNotifier {
    func warn(violation: Violation) {
        warn(message: violation.message,
             file: violation.filePath,
             line: violation.line)
    }
}

extension DangerDSL: PullRequestDiffProvidable {
    private var sourceBranch: String {
        if let github = github {
            return "\(github.pullRequest.base.sha)..\(github.pullRequest.head.sha)"
        } else if let gitLab = gitLab {
            return gitLab.mergeRequest.targetBranch
        } else if let bitbucketCloud = bitbucketCloud {
            return bitbucketCloud.pr.destination.branchName
        } else if let bitbucketServer = bitbucketServer {
            return bitbucketServer.pullRequest.fromRef.displayId
        }
        return ""
    }

    func diff(forFile file: String) throws -> FileDiff.Changes {
        try utils.diff(forFile: file, sourceBranch: sourceBranch)
                 .map {
                     Logger.shared.debug("changes for \(file):\($0.changes)")
                     switch $0.changes {
                     case let .created(addedLines):
                         return .created(addedLines: addedLines)
                     case let .renamed(oldPath, hunks):
                         return .renamed(oldPath: oldPath,
                                         hunks: hunks.map { .init(from: $0) })
                     case let .modified(hunks):
                         return .modified(hunks: hunks.map { .init(from: $0) })
                     case let .deleted(deletedLines):
                         return .deleted(deletedLines: deletedLines)
                     }
                 }
                 .get()
    }
}

private extension FileDiff.Hunk {
    init(from dangerHunk: Danger.FileDiff.Hunk) {
        oldLineRange = dangerHunk.oldLineStart ..< dangerHunk.oldLineStart + dangerHunk.oldLineSpan
        newLineRange = dangerHunk.newLineStart ..< dangerHunk.newLineStart + dangerHunk.newLineSpan
    }
}
