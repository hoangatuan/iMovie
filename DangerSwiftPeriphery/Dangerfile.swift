import Danger
import DangerSwiftPeriphery
import Foundation

debugPrint("Helloooooo")

let danger = Danger()
debugPrint("Count: \(danger.git.modifiedFiles.count)")

//SwiftLint.lint()

if let indexStorePath = ProcessInfo.processInfo.environment["INDEX_STORE_PATH"] {
    debugPrint("Start periphery at \(indexStorePath)")
    
    DangerPeriphery.scan(
        peripheryExecutable: "./periphery",
        arguments: [
            PeripheryScanOptions.workspace("../iMovie.xcworkspace"),
            PeripheryScanOptions.schemes(["iMovie"]),
            PeripheryScanOptions.targets(["iMovie"]),
            PeripheryScanOptions.indexStorePath(indexStorePath),
            PeripheryScanOptions.skipBuild
        ],
        shouldComment: true,
        verbose: true
    )
} else {
    debugPrint("Can't find index store path. Skip periphery")
}
