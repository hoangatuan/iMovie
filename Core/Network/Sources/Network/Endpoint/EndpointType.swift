//
//  Created by Tuan Hoang on 15/06/2023.
//

import Foundation

public enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}

public enum BodyParameter {
    case data(Data)
    case dictionary([String: Any], options: JSONSerialization.WritingOptions = [])
    case encodable(Encodable, encoder: JSONEncoder = .init())
}

public protocol EndPointType {

    var baseURL: URL { get }

    var path: String { get }

    var httpMethod: HTTPMethod { get }

    var urlQueries: [String: String]? { get }

    var headers: [String: String]? { get }

    var bodyParameter: BodyParameter? { get }
}
