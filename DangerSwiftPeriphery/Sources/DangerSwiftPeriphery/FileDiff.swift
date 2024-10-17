import Foundation

enum FileDiff {}

extension FileDiff {
    enum Changes {
        case created(addedLines: [String])
        case deleted(deletedLines: [String])
        case modified(hunks: [Hunk])
        case renamed(oldPath: String, hunks: [Hunk])
    }
}

extension FileDiff {
    struct Hunk {
        let oldLineRange: Range<Int>
        let newLineRange: Range<Int>
    }
}
