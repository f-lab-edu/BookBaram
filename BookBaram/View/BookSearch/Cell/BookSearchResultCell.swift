//
//  BookSearchResultCell.swift
//  BookBaram
//
//  Created by 이송미 on 5/27/24.
//

import UIKit
import BookBaramModel

class BookSearchResultCell: UITableViewCell {
    private let bookSearchResultView = BookSearchResultView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setLayout() {
        self.contentView.addSubview(bookSearchResultView)

        bookSearchResultView.makeConstraints { view in
            view.sizeConstraint(widthDimension: contentView.widthAnchor, heightDimension: contentView.heightAnchor)
        }

        bookSearchResultView.layout()
    }

    func setItem(item: Item) {
        bookSearchResultView.setItem(item: item)
    }

    override func prepareForReuse() {
        bookSearchResultView.resetItem()
    }
}
