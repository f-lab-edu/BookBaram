//
//  BookSearchResultView.swift
//  BookBaram
//
//  Created by 이송미 on 6/17/24.
//

import UIKit

final class BookSearchResultView: UIView {
    enum BookSearchResultConstants {
        static let imageSize = 50.0
        static let marginValue = 15.0
        static let labelMultiplier = 1.5
    }

    private let thumbnail: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .black // placeholder
        imageView.sizeConstraint(width: BookSearchResultConstants.imageSize,
                                 height: BookSearchResultConstants.imageSize)

        return imageView
    }()

    private let title: UILabel = UILabel()

    private let author: UILabel = UILabel()

    func layout() {
        addSubview(thumbnail)
        addSubview(title)
        addSubview(author)

        thumbnailLayout()
        titleLayout()
        authorLayout()
    }

    func setItem(item: Item) {
        self.title.text = item.title
        self.author.text = item.author

        Task {
            self.thumbnail.image = await ImageCache.shared.loadImage(imageUrl: item.image)
        }
    }

    private func thumbnailLayout() {
        thumbnail.makeConstraints { view in
            view.xAxisConstraints(left: leftAnchor, leftOffset: BookSearchResultConstants.marginValue)
            view.yAxisConstraints(top: topAnchor,
                                  topOffset: BookSearchResultConstants.marginValue)
        }
    }

    private func titleLayout() {
        title.dynamicFont()
        title.makeConstraints { view in
            view.yAxisConstraints(top: thumbnail.topAnchor)
            view.xAxisConstraints(left: thumbnail.rightAnchor,
                                  leftOffset: BookSearchResultConstants.marginValue,
                                  right: rightAnchor,
                                  rightOffset: BookSearchResultConstants.marginValue * -1)
        }
    }

    private func authorLayout() {
        author.dynamicFont()
        author.makeConstraints { view in
            view.yAxisConstraints(top: title.lastBaselineAnchor, topOffset: BookSearchResultConstants.marginValue,
                                  bottom: bottomAnchor,
                                  bottomOffset: BookSearchResultConstants.marginValue * -1)
            view.xAxisConstraints(left: thumbnail.rightAnchor, leftOffset: BookSearchResultConstants.marginValue,
                                  right: rightAnchor,
                                  rightOffset: BookSearchResultConstants.marginValue * -1)
        }
    }

    func resetItem() {
        title.text = ""
        author.text = ""
        thumbnail.image = nil
    }
}
