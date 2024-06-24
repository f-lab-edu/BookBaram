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
        return label
    }()

    private let author: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
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
        thumbnail.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        thumbnail.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor,
                                          constant: BookSearchResultConstants.marginValue * -1).isActive = true
    }

    private func titleLayout() {
        title.topAnchor.constraint(equalTo: thumbnail.topAnchor).isActive = true
        title.leadingAnchor.constraint(equalTo: self.thumbnail.trailingAnchor,
                                       constant: BookSearchResultConstants.marginValue).isActive = true
        title.trailingAnchor.constraint(equalTo: self.trailingAnchor,
                                        constant: BookSearchResultConstants.marginValue).isActive = true
    }

    private func authorLayout() {
        author.topAnchor.constraint(equalTo: title.bottomAnchor,
                                    constant: BookSearchResultConstants.marginValue).isActive = true
        author.xAxisConstraints(left: title.leftAnchor, right: title.rightAnchor)
    }
}

enum BookSearchResultConstants {
    static let imageSize = 50.0
    static let marginValue = 15.0
}
