//
//  BookSearchResultView.swift
//  BookBaram
//
//  Created by 이송미 on 6/17/24.
//

import UIKit

final class BookSearchResultView: UIView {

    private let thumbnail: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .black // placeholder
        imageView.sizeConstraint(width: BookSearchResultConstants.imageSize,
                                 height: BookSearchResultConstants.imageSize)

        return imageView
    }()

    private let title: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.dynamicFont()
        return label
    }()

    private let author: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.dynamicFont()
        return label
    }()

    func layout() {
        addSubview(thumbnail)
        addSubview(title)
        addSubview(author)

        thumbnailLayout()
        titleLayout()
        authorLayout()
    }

    func setItem(item: Item) async throws {
        self.title.text = item.title
        self.author.text = item.author

        let (imageData, _) = try await URLSession.shared.data(from: item.image)
        self.thumbnail.image = UIImage(data: imageData)
    }

    private func thumbnailLayout() {
        thumbnail.leadingAnchor.constraint(equalTo: self.leadingAnchor,
                                           constant: BookSearchResultConstants.marginValue).isActive = true
        thumbnail.topAnchor.constraint(equalTo: title.firstBaselineAnchor).isActive = true
        thumbnail.bottomAnchor.constraint(lessThanOrEqualTo: author.lastBaselineAnchor).isActive = true
    }

    private func titleLayout() {
        title.topAnchor.constraint(equalTo: topAnchor,
                                   constant: BookSearchResultConstants.marginValue).isActive = true
        title.leftAnchor.constraint(equalTo: self.thumbnail.rightAnchor,
                                       constant: BookSearchResultConstants.marginValue).isActive = true
        title.rightAnchor.constraint(equalTo: self.rightAnchor,
                                        constant: BookSearchResultConstants.marginValue).isActive = true

    }

    private func authorLayout() {
        author.firstBaselineAnchor.constraint(equalToSystemSpacingBelow: title.lastBaselineAnchor,
                                              multiplier: 1.5).isActive = true
        author.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        author.xAxisConstraints(left: thumbnail.rightAnchor, right: rightAnchor)
    }
}

enum BookSearchResultConstants {
    static let imageSize = 50.0
    static let marginValue = 15.0
}
