//
//  Review.swift
//  BookBaram
//
//  Created by 이송미 on 8/5/24.
//

import Foundation
import SwiftData

@Model
final public class ReviewContent {
    @Attribute(.unique) public var id: UUID
    public var imgUrl: URL
    public var title: String
    public var contents: String
    public var date: Date

    public init(imgUrl: URL, title: String, contents: String) {
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
