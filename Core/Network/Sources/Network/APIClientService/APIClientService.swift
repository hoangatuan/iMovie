//
//  Created by Tuan Hoang on 15/06/2023.
//

import Foundation
import Logger

public enum APIError: Error {
    case invalidEndpoint
    case badServerResponse
    case networkError(error: Error)
    case parsing(error: Error)
}

public typealias APIResponse = (data: Data, statusCode: Int)

public protocol IAPIClientService {
    func request(_ endpoint: EndPointType) async -> Result<APIResponse, APIError>
    func request<T: Decodable>(_ endpoint: EndPointType, for type: T.Type) async throws -> T
    func request<T, M: Mappable>(_ endpoint: EndPointType, mapper: M) async throws -> T where M.Output == T
}

public final class APIClientService: IAPIClientService {

    private let logger: ILogger

    public init(logger: ILogger) {
        self.logger = logger
    }

    private func request(_ endpoint: EndPointType, completion: @escaping (Result<APIResponse, APIError>) -> Void) {
        guard let request = buildURLRequest(from: endpoint) else {
            completion(.failure(.invalidEndpoint))
            return
        }

        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            self?.logger.log(request: request, data: data, response: response as? HTTPURLResponse, error: error)

            if let error = error {
                completion(.failure(.networkError(error: error)))
                return
            }

            guard let data = data, let httpResponse = response as? HTTPURLResponse,
                  (200..<400).contains(httpResponse.statusCode) else {
                completion(.failure(.badServerResponse))
                return
            }

            completion(.success((data, httpResponse.statusCode)))
        }

        task.resume()
    }

    public func request(_ endpoint: EndPointType) async -> Result<APIResponse, APIError> {
        await withCheckedContinuation({ continuation in
            request(endpoint, completion: { result in
                continuation.resume(returning: result)
            })
        })
    }

    public func request<T>(_ endpoint: EndPointType, for type: T.Type) async throws -> T where T : Decodable {
        let response = await request(endpoint)
        switch response {
        case .success(let result):
            do {
                let modelResponse = try JSONDecoder().decode(T.self, from: result.data)
                return modelResponse
            } catch let error {
                if let decodingError = error as? DecodingError {
                    self.logger.log(level: .error, message: "❌ Decoding error: \(decodingError.detailErrorDescription)")
                }

                throw APIError.parsing(error: error)
            }
        case .failure(let failure):
            throw failure
        }
    }

    public func request<T, M: Mappable>(_ endpoint: EndPointType, mapper: M) async throws -> T where T == M.Output {
        let responseModel: M.Input = try await request(endpoint, for: M.Input.self)
        return try mapper.map(responseModel)
    }

    private func buildURLRequest(from endpoint: EndPointType) -> URLRequest? {
        guard let host = endpoint.baseURL.host else { return nil }

        var components = URLComponents()
        components.scheme = "https"
        components.host = host
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
            request.allHTTPHeaderFields = headers
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
