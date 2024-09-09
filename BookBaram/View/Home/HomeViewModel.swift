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
    private var repository: Repository
    private(set) var reviewContetList: [ReviewContent] = []
    private var delegate: ReloadDelegate?

    init(repository: Repository, delegate: ReloadDelegate? = nil) {
        self.repository = repository
        self.delegate = delegate
    }

    func loadReviewContents() {
        Task { @MainActor in
            updateReviewContents(contents: repository.load())
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
