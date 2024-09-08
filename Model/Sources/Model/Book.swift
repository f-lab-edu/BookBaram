//
//  Book.swift
//  BookBaram
//
//  Created by 이송미 on 5/27/24.
//

import Foundation
import UIKit

public struct SearchBookResults {
    public let queryKeyword: String
    public let total: Int
    public let currentPage: Int
    public let display: Int
    public let items: [Item]

    public init(queryKeyword: String, searchBookResponse: SearchBookResponse) {
        self.queryKeyword = queryKeyword
        self.total = searchBookResponse.total
        self.currentPage = searchBookResponse.start
        self.display = searchBookResponse.display
        self.items = searchBookResponse.items
    }
}

// MARK: - SearchBookResponse
public struct SearchBookResponse: Decodable {
    public let total: Int
    public let start: Int
    public let display: Int
    public let items: [Item]

    public init(total: Int, start: Int, display: Int, items: [Item]) {
        self.total = total
        self.start = start
        self.display = display
        self.items = items
    }
}

// MARK: - Item
public struct Item: Decodable {
    public let title: String
    public let link: URL
    public let image: URL
    public let author: String
    public let discount: String
    public let publisher: String
    public let pubdate: String
    public let isbn: String
    public let description: String

}
