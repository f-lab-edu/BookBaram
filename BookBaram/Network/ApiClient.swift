//
//  ApiClient.swift
//  BookBaram
//
//  Created by 이송미 on 6/1/24.
//

import Foundation

struct ApiClient {
    public static let shared = ApiClient()
    private let session = URLSession.shared
    
    func request(_ urlString: String,
                 parameters: [String: Any]? = nil,
                 headers: [String: String]? = nil,
                 completion: @escaping (Result<Data, Error>) -> Void) {
        
        guard var urlComponent = URLComponents(string: urlString) else {
            completion(.failure(BaramErrorInfo(error: .InvalidRequest)))
            return
        }
        
        if let parameters {
            var queryItems = urlComponent.queryItems ?? []
            for param in parameters {
                queryItems.append(URLQueryItem(name: param.key, value: "\(param.value)"))
            }
            
            urlComponent.queryItems = queryItems
        }
        
        guard let url = urlComponent.url else {
            completion(.failure(BaramErrorInfo(error: .InvalidRequest)))
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "get"
        
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
                        
            guard let data, let httpResponse = response as? HTTPURLResponse, (200..<300) ~= httpResponse.statusCode else {
                completion(.failure(BaramErrorInfo(error: .InvalidResponse)))
                return
            }
            
            completion(.success(data))
        }
        .resume()
    }
}
