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
    
    func request(_ urlString: String,
                 method: HttpMethod,
                 parameters: [String: Any]? = nil,
                 headers: [String: String]? = nil) async throws -> Data? {
        
        guard var urlComponent = URLComponents(string: urlString) else {            
            throw BaramErrorInfo.init(error: .invalidRequest)
        }
        
        if let parameters {
            var queryItems = urlComponent.queryItems ?? []
            for param in parameters {
                queryItems.append(URLQueryItem(name: param.key, value: "\(param.value)"))
            }
            
            urlComponent.queryItems = queryItems
        }
        
        guard let url = urlComponent.url else {
            throw BaramErrorInfo.init(error: .invalidRequest)
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        
        if let headers {
            for header in headers {
                urlRequest.setValue(header.value, forHTTPHeaderField: header.key)
            }
        }
                        
        var response: (Data, URLResponse)?
        // retry
        for _ in 0..<3 {
            response = try await session.data(for: urlRequest)
            
            guard let httpResponse = response?.1 as? HTTPURLResponse, !((400..<500) ~= httpResponse.statusCode) else {
                throw BaramErrorInfo(error: .invalidResponse)
            }
            
            if (200..<300) ~= httpResponse.statusCode {
                break
            } else if (500..<600) ~= httpResponse.statusCode {
                continue
            }
        }
        
        return response?.0
    }
}
