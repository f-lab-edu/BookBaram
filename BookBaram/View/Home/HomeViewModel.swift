//
//  HomeViewModel.swift
//  BookBaram
//
//  Created by 이송미 on 8/7/24.
//

import Foundation

final class HomeViewModel {
    private let database = Database.shared
    private(set) var reviewContetList: [ReviewContent] = []
    private var delegate: ReloadDelegate?

    @MainActor
    func loadReviewContents() {
        updateReviewContents(contents: database.loadReviewContents())
    }

    func updateReloadDelegate(_ delegate: ReloadDelegate) {
        self.delegate = delegate
    }

    private func updateReviewContents(contents: [ReviewContent]) {
        reviewContetList.removeAll()
        reviewContetList.append(contentsOf: contents)

        delegate?.reloadTable()
    }
}
