//
//  BookSearchResultCell.swift
//  BookBaram
//
//  Created by 이송미 on 5/27/24.
//

import UIKit

class BookSearchResultCell: UITableViewCell {
    let bookSearchResultView = BookSearchResultView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setLayout() {
        self.addSubview(bookSearchResultView)

        bookSearchResultView.translatesAutoresizingMaskIntoConstraints = false
        bookSearchResultView.sizeConstraint(widthDimension: widthAnchor, heightDimension: heightAnchor)
        bookSearchResultView.layout()

    }

    func setItem(item: Item) {
        Task {
            try? await bookSearchResultView.setItem(item: item)
        }
    }
}
