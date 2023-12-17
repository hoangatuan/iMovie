import HelperMacros
import Foundation

let (result, code) = #stringify(a + b)

print("The value \(result) was produced by the code \"\(code)\"")

@DefaultInit
public struct AuthorDetail: Equatable {
    public let name: String
    public let username: String
    public let avatarPath: URL?
    public let rating: Int?
}

let author = AuthorDetail(name: "", username: "", avatarPath: nil, rating: nil)
print(author)
