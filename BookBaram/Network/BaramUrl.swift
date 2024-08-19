//
//  BaramUrl.swift
//  BookBaram
//
//  Created by 이송미 on 6/1/24.
//

import Foundation

enum BaramUrl {
    static var naverApi: String = {
        guard let apiUrl = Bundle.main.object(forInfoDictionaryKey: "NaverApiUrl") as? String else {
            fatalError("Base Url is wrong")
        }
        
        return apiUrl
    }()
}

enum Path {
    static let bookSearch = "/v1/search/book.json"
}
