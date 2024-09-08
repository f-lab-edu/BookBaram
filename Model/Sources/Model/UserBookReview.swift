//
//  UserBookReview.swift
//  BookBaram
//
//  Created by 이송미 on 7/2/24.
//

import Foundation

public struct UserBookReview: Identifiable {
    public let id: UUID = UUID()
    public var imgUrl: URL?
    public var title: String
    public var date: Date
    public var content: String

    public init(imgUrl: URL? = nil, title: String, date: Date, content: String) {
        self.imgUrl = imgUrl
        self.title = title
        self.date = date
        self.content = content
    }
}
