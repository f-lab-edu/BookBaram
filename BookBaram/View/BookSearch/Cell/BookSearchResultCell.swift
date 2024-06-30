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
        self.contentView.addSubview(bookSearchResultView)

        bookSearchResultView.translatesAutoresizingMaskIntoConstraints = false
        bookSearchResultView.yAxisConstraints(top: topAnchor, bottom: bottomAnchor)
        bookSearchResultView.xAxisConstraints(left: leftAnchor, right: rightAnchor)
        bookSearchResultView.layout()
    }

    func setItem(item: Item) {
        bookSearchResultView.setItem(item: item)
    }
}
