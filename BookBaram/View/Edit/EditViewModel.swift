//
//  EditViewModel.swift
//  BookBaram
//
//  Created by 이송미 on 8/5/24.
//

import Foundation
import SwiftData

@MainActor
class EditViewModel {
    private let database = Database.shared
    
    var selectedBookItem: Item?
    var errorDelegate: ErrorDelegate?

    func updateSelectedBookItem(item: Item?) {
        selectedBookItem = item
    }
    
    func setErrorDelegate(_ delegate: ErrorDelegate) {
        errorDelegate = delegate
    }

    func saveReview(title: String?, contents: String) {
        guard let selectedBookItem, let title else { return }
        if contents.isEmpty { return }

        Task { @MainActor in
            let reviewContents = ReviewContent(imgUrl: selectedBookItem.image, title: title, contents: contents)
            saveReviewContents(reviewContents: reviewContents)
        }
    }

    private func saveReviewContents(reviewContents: ReviewContent) {
        do {
            try database.saveReviewContents(reviewContents: reviewContents)
        } catch {
            errorDelegate?.handleError(error: error)
        }
    }
}
