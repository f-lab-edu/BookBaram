//
//  HomeViewModel.swift
//  BookBaram
//
//  Created by 이송미 on 8/7/24.
//

import Foundation

class HomeViewModel {
    private let database = Database.shared
    private(set) var reviewContetList: [ReviewContent] = []
    private var delegate: ReloadDelegate?
    private(set) var selectedDate: Date = .now

    func loadReviewContents(date: Date = Date.now) {
        Task { @MainActor in
            updateReviewContents(contents: database.loadReviewContents(date: date))
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
