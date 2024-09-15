//
//  Review.swift
//  BookBaram
//
//  Created by 이송미 on 8/5/24.
//

import Foundation
import SwiftData

@Model
final class ReviewContent {
    @Attribute(.unique) var id: UUID
    var imgUrl: URL
    var title: String
    var contents: String
    var date: Date

    init(imgUrl: URL, title: String, contents: String) {
        self.id = UUID()
        self.imgUrl = imgUrl
        self.date = Date.now
        self.title = title
        self.contents = contents

        validateTitle(title)
        validateContent(contents)
    }

    private func validateTitle(_ msg: String) {
        if msg.isEmpty {
            title = "Untitled Review"
            return
        }

        title = String(msg.prefix(100))
    }

    private func validateContent(_ msg: String) {
        if msg.isEmpty {
            contents = "Content is not provided"
            return
        }

        contents = msg
    }
}

extension ReviewContent {
    func toUserBookReview() -> UserBookReview {
        UserBookReview(imgUrl: self.imgUrl, title: self.title, date: self.date, contents: self.contents)
    }
}
