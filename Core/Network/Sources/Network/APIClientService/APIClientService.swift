//
//  Created by Tuan Hoang on 15/06/2023.
//

import Foundation
import Logger

public enum APIError: Error {
    case invalidEndpoint
    case badServerResponse
    case parsing(error: Error)
}

public typealias APIResponse = (data: Data, statusCode: Int)

public protocol IAPIClientService {
    func request(_ endpoint: EndPointType) async throws -> APIResponse
    func request<T: Decodable>(_ endpoint: EndPointType) async throws -> T
    func request<T, M: Mappable>(_ endpoint: EndPointType, mapper: M) async throws -> T where M.Output == T
}

public final class APIClientService: IAPIClientService {

    private let logger: ILogger

    public init(logger: ILogger) {
        self.logger = logger
    }

    public func request(_ endpoint: EndPointType) async throws -> APIResponse {
        guard let request = buildURLRequest(from: endpoint) else {
            throw APIError.invalidEndpoint
        }

        let (data, response) = try await URLSession.shared.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse,
              (200..<400).contains(httpResponse.statusCode) else {
            throw APIError.badServerResponse
        }

        return (data: data, statusCode: httpResponse.statusCode)
    }

    public func request<T>(_ endpoint: EndPointType) async throws -> T where T : Decodable {
        let response = try await request(endpoint)
        do {
            let modelResponse = try JSONDecoder().decode(T.self, from: response.data)
            return modelResponse
        } catch let error {
            throw APIError.parsing(error: error)
        }
    }

    public func request<T, M: Mappable>(_ endpoint: EndPointType, mapper: M) async throws -> T where T == M.Output {
        let responseModel: M.Input = try await request(endpoint)
        return mapper.map(responseModel)
    }

    private func buildURLRequest(from endpoint: EndPointType) -> URLRequest? {
        var components = URLComponents()
        components.host = endpoint.baseURL.absoluteString
        components.path = "/\(endpoint.path)"

        if let urlQueries = endpoint.urlQueries {
            var queryItems: [URLQueryItem] = []
            for item in urlQueries {
                queryItems.append(URLQueryItem(name: item.key, value: item.value))
            }

            components.queryItems = queryItems
        }

        guard let url = components.url else { return nil }

        var request = URLRequest(url: url)
        request.httpMethod = endpoint.httpMethod.rawValue

        if let headers = endpoint.headers {
            for header in headers {
                request.addValue(header.key, forHTTPHeaderField: header.value)
            }
        }

        switch endpoint.bodyParameter {
        case let .data(data):
            request.httpBody = data
        case let .dictionary(dict, options):
            let jsonData = try? JSONSerialization.data(withJSONObject: dict, options: options)
            request.httpBody = jsonData
        case let .encodable(object, encoder):
            let data = try? encoder.encode(object)
            request.httpBody = data
        default:
            break
        }
        
        return request
    }

}
