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
        imageView.sizeConstraint(width: BookSearchResultConstants.imageSize)

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
            let (imageData, _) = try await URLSession.shared.data(from: item.image)
            self.thumbnail.image = UIImage(data: imageData)
        }
    }

    private func thumbnailLayout() {
        thumbnail.makeConstraints { view in
            view.xAxisConstraints(left: leftAnchor, leftOffset: BookSearchResultConstants.marginValue)
            view.yAxisConstraints(top: topAnchor,
                                  topOffset: BookSearchResultConstants.marginValue,
                                  bottom: author.lastBaselineAnchor,
                                  bottomOffset: BookSearchResultConstants.marginValue * -1)
        }
    }

    private func titleLayout() {
        title.makeConstraints { view in
            view.yAxisConstraints(top: thumbnail.topAnchor)
            view.xAxisConstraints(left: thumbnail.rightAnchor,
                                  leftOffset: BookSearchResultConstants.marginValue,
                                  right: rightAnchor, rightOffset: BookSearchResultConstants.marginValue * -1)
        }
    }

    private func authorLayout() {
        author.makeConstraints { view in
            view.yAxisConstraints(top: title.lastBaselineAnchor,
                                  topOffset: BookSearchResultConstants.marginValue,
                                  bottom: bottomAnchor,
                                  bottomOffset: BookSearchResultConstants.marginValue * -1)
            view.xAxisConstraints(left: title.leftAnchor, right: title.rightAnchor)
        }
    }
}
