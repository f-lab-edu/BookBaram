//
//  EditViewModel.swift
//  BookBaram
//
//  Created by 이송미 on 8/5/24.
//

import Foundation
import SwiftData
import BookBaramModel
import BookBaramAction

@MainActor
final class EditViewModel {
    var selectedBookItem: Item?
    var repository: Repository

    init(repository: Repository) {
        self.repository = repository
    }

    func updateSelectedBookItem(item: Item?) {
        selectedBookItem = item
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
        let result = repository.save(content: reviewContents)
        switch result {
        case .failure(let errorInfo):
            print("save errorInfo: \(errorInfo)")
            // TODO: UIAlert
        default:
            break
        }
    }
}
