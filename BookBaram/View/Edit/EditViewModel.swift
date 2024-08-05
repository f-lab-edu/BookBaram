//
//  EditViewModel.swift
//  BookBaram
//
//  Created by 이송미 on 8/5/24.
//

import Foundation
import SwiftData

class EditViewModel {
    private let database = Database.shared
    var selectedBookItem: Item?

    func updateSelectedBookItem(item: Item?) {
        selectedBookItem = item
    }

    func saveReview(title: String?, contents: String) {
        guard let selectedBookItem, let title else { return }
        if contents.isEmpty { return }

        Task { @MainActor in
            let reviewContents = ReviewContents(imgUrl: selectedBookItem.image, title: title, contents: contents)
            database.saveReviewContents(reviewContents: reviewContents)
        }
    }
}
