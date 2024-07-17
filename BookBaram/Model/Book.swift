//
//  Book.swift
//  BookBaram
//
//  Created by 이송미 on 5/27/24.
//

import Foundation
import UIKit

struct SearchBookResults {
    let queryKeyword: String
    let total: Int
    let currentPage: Int
    let display: Int
    let items: [Item]

    init(queryKeyword: String, searchBookResponse: SearchBookResponse) {
        self.queryKeyword = queryKeyword
        self.total = searchBookResponse.total
        self.currentPage = searchBookResponse.start
        self.display = searchBookResponse.display
        self.items = searchBookResponse.items
    }
}

// MARK: - SearchBookResponse
struct SearchBookResponse: Decodable {
    let total: Int
    let start: Int
    let display: Int
    let items: [Item]
}

// MARK: - Item
struct Item: Decodable {
    let title: String
    let link: URL
    let image: URL
    let author: String
    let discount: String
    let publisher: String
    let pubdate: String
    let isbn: String
    let description: String

}
