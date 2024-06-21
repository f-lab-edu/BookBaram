//
//  Book.swift
//  BookBaram
//
//  Created by 이송미 on 5/27/24.
//

import Foundation
import UIKit

// MARK: - SearchBookResponse
struct SearchBookResponse: Codable {
    let total: Int
    let start: Int
    let display: Int
    let items: [Item]
}

// MARK: - Item
struct Item: Codable {
    let title: String
    let link: URL
    let image: URL
    let author: String
    let discount: String
    let publisher: String
    let pubdate: Date
    let isbn: Int
    let description: String

}
