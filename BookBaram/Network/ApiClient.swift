//
//  ApiClient.swift
//  BookBaram
//
//  Created by 이송미 on 6/1/24.
//

import Foundation

enum HTTPMethod: String {
    case Get, Post
}

struct ApiClient {
    public static let shared = ApiClient()
    private let session = URLSession.shared
    
    func request(_ urlString: String,
                 method: HTTPMethod,
                 parameters: [String: Any]? = nil,
                 headers: [String: String]? = nil,
                 completion: @escaping (Result<Data?, Error>) -> Void) {
        
        var urlRequest: URLRequest? = nil
        
        if method == .Get {
            urlRequest = createGetRequest(urlString, parameters: parameters)
        } else if method == .Post {
            urlRequest = createPostRequest(urlString, parameters: parameters)
        }
        
        guard var urlRequest else {
            completion(.failure(BaramErrorInfo(error: .InvalidRequest)))
            return
        }
        
        if let headers {
            for i in headers {
                urlRequest.setValue(i.value, forHTTPHeaderField: i.key)
            }
        }        
        
        session.dataTask(with: urlRequest) { data, response, error in
            if let error {
                // error handle
                completion(.failure(error))
                return
            }
                        
            guard let httpResponse = response as? HTTPURLResponse, (200..<300) ~= httpResponse.statusCode else {
                completion(.failure(BaramErrorInfo(error: .InvalidResponse)))
                return
            }
            
            completion(.success(data))
        }
        .resume()
    }
}

// MARK: - Internal Method
extension ApiClient {
    private func createGetRequest(_ urlString: String, parameters: [String: Any]?) -> URLRequest? {
        guard let parameters, var urlComponent = URLComponents(string: urlString) else { return nil }
        
        var queryItems = urlComponent.queryItems ?? []
        for param in parameters {
            queryItems.append(URLQueryItem(name: param.key, value: "\(param.value)"))
        }
        
        urlComponent.queryItems = queryItems
        
        if let url = urlComponent.url {
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = HTTPMethod.Get.rawValue
            return urlRequest
        }
        
        return nil
    }
    
    private func createPostRequest(_ urlString: String, parameters: [String: Any]?) -> URLRequest? {
        guard let url = URL(string: urlString) else { return nil }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = HTTPMethod.Post.rawValue
        
        if let parameters {
            urlRequest.httpBody = try? JSONSerialization.data(withJSONObject: parameters)
        }
        
        return urlRequest
    }
}
