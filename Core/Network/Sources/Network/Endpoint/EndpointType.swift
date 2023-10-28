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

public struct APIEndpoint: EndPointType {
    public let baseURL: URL
    public let path: String
    public let httpMethod: HTTPMethod
    public let urlQueries: [String: String]?
    public let headers: [String: String]?
    public let bodyParameter: BodyParameter?

    public init(
        baseURL: URL,
        path: String,
        httpMethod: HTTPMethod,
        urlQueries: [String: String]? = nil,
        headers: [String: String]? = nil,
        bodyParameter: BodyParameter? = nil
    ) {
        self.baseURL = baseURL
        self.path = path
        self.httpMethod = httpMethod
        self.urlQueries = urlQueries
        self.headers = headers
        self.bodyParameter = bodyParameter
    }
}
