//
//  EditViewModel.swift
//  BookBaram
//
//  Created by 이송미 on 8/5/24.
//

import Foundation

class EditViewModel {
    var selectedBookItem: Item?

    func updateSelectedBookItem(item: Item?) {
        selectedBookItem = item
    }

    func saveReview(title: String?, contents: String) {
        guard let selectedBookItem, let title else { return }
        if contents.isEmpty { return }

        let reviewContents = ReviewContents(imgUrl: selectedBookItem.image, title: title, contents: contents)
        // save to database
    }
}
