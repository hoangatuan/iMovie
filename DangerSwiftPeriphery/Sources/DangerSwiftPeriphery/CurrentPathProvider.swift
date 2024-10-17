import Foundation

struct CurrentPathProvider {
    private let fileManager: FileManager

    var currentPath: String {
        fileManager.currentDirectoryPath
    }

    init(fileManager: FileManager = FileManager.default) {
        self.fileManager = fileManager
    }
}
