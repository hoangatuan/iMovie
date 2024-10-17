import Foundation

protocol PullRequestDiffProvidable {
    func diff(forFile: String) throws -> FileDiff.Changes
}
