//
//  Review.swift
//  BookBaram
//
//  Created by 이송미 on 8/5/24.
//

import Foundation
import SwiftData

@Model
class ReviewContent {
    @Attribute(.unique) var id: UUID
    var imgUrl: URL
    var title: String
    var contents: String
    var date: Date

    init(imgUrl: URL, title: String, contents: String) {
        self.id = UUID()
        self.imgUrl = imgUrl
        self.title = title
        self.contents = contents
        self.date = Date.now
    }
}
