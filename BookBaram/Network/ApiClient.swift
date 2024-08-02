//
//  ApiClient.swift
//  BookBaram
//
//  Created by 이송미 on 6/1/24.
//

import Foundation

enum HttpMethod: String {
    case get, post
}

struct ApiClient {
    public static let shared = ApiClient()
    private let session = URLSession.shared

    var naverApiHeader: [String: String] = [
        "X-Naver-Client-Id": Bundle.main.naverClientId,
        "X-Naver-Client-Secret": Bundle.main.naverSecretKey
    ]

    func request(_ urlString: String,
                 method: HttpMethod,
                 parameters: [String: Any]? = nil,
                 headers: [String: String]? = nil) async throws -> Data? {

        var urlRequest: URLRequest
        if method == .get {
            urlRequest = try createGetUrlRequest(urlString: urlString, parameters: parameters)
        } else {
            // TODO: Post
            urlRequest = URLRequest(url: URL(string: urlString)!)
        }

        urlRequest.setHeaders(headers: headers)

        return try await retry(urlRequest: urlRequest)
    }

    private func createGetUrlRequest(urlString: String, parameters: [String: Any]? = nil) throws -> URLRequest {
        guard var urlComponent = URLComponents(string: urlString) else {
            throw BaramErrorInfo.init(error: .invalidRequest)
        }

        urlComponent.queryItems = parameters?.makeQueryItem(urlComponent.queryItems)

        guard let url = urlComponent.url else {
            throw BaramErrorInfo.init(error: .invalidRequest)
        }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = HttpMethod.get.rawValue

        return urlRequest
    }

    private func retry(urlRequest: URLRequest, retryCount: Int = 3) async throws -> Data? {
        for _ in 0..<retryCount {
            let (data, response) = try await session.data(for: urlRequest)

            if try isNeedRetry(response: response) {
                continue
            }

            return data
        }

        return nil
    }

    private func isNeedRetry(response: URLResponse) throws -> Bool {
        guard let httpResponse = response as? HTTPURLResponse else { throw BaramErrorInfo(error: .invalidResponse) }

        if 400..<500 ~= httpResponse.statusCode {
            throw BaramErrorInfo(error: .invalidResponse)
        }

        if (200..<300) ~= httpResponse.statusCode {
            return false
        }

        return true
    }
}

extension Dictionary where Key == String {
    func makeQueryItem(_ queryItems: [URLQueryItem]?) -> [URLQueryItem] {
        var queryItems: [URLQueryItem] = queryItems ?? []

        for (key, value) in self {
            queryItems.append(URLQueryItem(name: key, value: "\(value)"))
        }

        return queryItems
    }
}

extension URLRequest {
    mutating func setHeaders(headers: [String: String]?) {
        guard let headers else { return }

        for header in headers {
            self.setValue(header.value, forHTTPHeaderField: header.key)
        }
    }
}

extension Bundle {
    // naver api key
    var naverClientId: String {
        guard let info = loadNaverApiInfo() else { return "" }

        guard let key = info["X-Naver-Client-Id"] as? String else {
            return ""
        }

        return key
    }

    var naverSecretKey: String {
        guard let info = loadNaverApiInfo() else { return "" }

        guard let key = info["X-Naver-Client-Secret"] as? String else {
            return ""
        }

        return key
    }

    public func loadNaverApiInfo() -> [String: Any]? {
        guard let file = Bundle.main.url(forResource: "naver-apikey", withExtension: "json") else { return nil }
        guard let data = try? Data(contentsOf: file) else { return nil }

        return try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
    }
}
