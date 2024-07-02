//
//  UserBookReview.swift
//  BookBaram
//
//  Created by 이송미 on 7/2/24.
//

import Foundation

struct UserBookReview: Identifiable {
    let id: UUID = UUID()
    var imgUrl: URL?
    var title: String
    var date: Date
    var content: String
}

extension Date {
    func toString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd"

        return dateFormatter.string(from: self)
    }
}
