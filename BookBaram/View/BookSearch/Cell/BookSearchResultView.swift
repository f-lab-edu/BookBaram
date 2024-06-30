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
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .black // placeholder
        imageView.sizeConstraint(width: BookSearchResultConstants.imageSize)

        return imageView
    }()

    private let title: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
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

    func setItem(item: Item) {
        self.title.text = item.title
        self.author.text = item.author

        Task {
            do {
                let (imageData, _) = try await URLSession.shared.data(from: item.image)
                self.thumbnail.image = UIImage(data: imageData)
            } catch {
                self.thumbnail.image = UIImage(systemName: "exclamationmark.triangle")
            }
        }
    }

    private func thumbnailLayout() {
        thumbnail.leadingAnchor.constraint(equalTo: leadingAnchor,
                                           constant: BookSearchResultConstants.marginValue).isActive = true
        thumbnail.topAnchor.constraint(equalTo: topAnchor,
                                       constant: BookSearchResultConstants.marginValue).isActive = true
        thumbnail.lastBaselineAnchor.constraint(lessThanOrEqualTo: author.lastBaselineAnchor).isActive = true
    }

    private func titleLayout() {
        title.topAnchor.constraint(equalTo: topAnchor,
                                   constant: BookSearchResultConstants.marginValue).isActive = true
        title.leftAnchor.constraint(equalTo: thumbnail.rightAnchor,
                                       constant: BookSearchResultConstants.marginValue).isActive = true
        title.rightAnchor.constraint(equalTo: rightAnchor,
                                        constant: BookSearchResultConstants.marginValue * -1).isActive = true
    }

    private func authorLayout() {
        author.firstBaselineAnchor.constraint(equalToSystemSpacingBelow: title.lastBaselineAnchor,
                                              multiplier: 1.0).isActive = true
        author.xAxisConstraints(left: title.leftAnchor, right: title.rightAnchor)
        author.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}
