//
//  HomeViewModel.swift
//  BookBaram
//
//  Created by 이송미 on 8/7/24.
//

import Foundation
import BookBaramModel
import BookBaramAction

final class HomeViewModel {
    private var db: DBProtocol
    private(set) var reviewContetList: [ReviewContent] = []
    private var delegate: ReloadDelegate?

    init(db: DBProtocol, delegate: ReloadDelegate? = nil) {
        self.db = db
        self.delegate = delegate
    }

    func loadReviewContents() {
        Task { @MainActor in
            updateReviewContents(contents: db.load())
        }
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
