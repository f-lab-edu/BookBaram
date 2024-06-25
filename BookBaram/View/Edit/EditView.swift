//
//  EditView.swift
//  BookBaram
//
//  Created by 이송미 on 6/17/24.
//

import UIKit

class EditView: UIView {
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    let contentView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 10.0
        return stackView
    }()

    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .black // placeholder
        imageView.heightAnchor.constraint(equalToConstant: 100.0).isActive = true
        return imageView
    }()

    let titleTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont.preferredFont(forTextStyle: .body)
        textField.adjustsFontForContentSizeCategory = true
        return textField
    }()

    let contentTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.font = UIFont.preferredFont(forTextStyle: .body)
        textView.adjustsFontForContentSizeCategory = true
        return textView
    }()

    func layout() {
        addSubview(scrollView)
        addSubview(contentView)

        contentView.addArrangedSubview(imageView)
        contentView.addArrangedSubview(titleTextField)
        contentView.addArrangedSubview(contentTextView)

        scrollViewLayout()
        contentViewLayout()

        textFieldStyle()
        contentTextViewStyle()
    }

    private func scrollViewLayout() {
        scrollView.sizeConstraint(widthDimension: widthAnchor, heightDimension: heightAnchor)
        scrollView.yAxisConstraints(top: safeAreaLayoutGuide.topAnchor,
                                    bottom: safeAreaLayoutGuide.bottomAnchor)
    }

    private func contentViewLayout() {
        contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor,
                                             constant: EditViewConstants.marginConstant).isActive = true
        contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor,
                                              constant: EditViewConstants.marginConstant * -1).isActive = true
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor,
                                           constant: EditViewConstants.marginConstant * -2).isActive = true
        contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor).isActive = true
    }

    private func textFieldStyle() {
        titleTextField.borderStyle = .roundedRect
        titleTextField.placeholder = "Write the title"
    }

    private func contentTextViewStyle() {
        contentTextView.layer.borderWidth = 1.0
        contentTextView.layer.cornerRadius = 8
        contentTextView.layer.borderColor = UIColor.lightGray.cgColor
        contentTextView.text = "Content"
    }

}

enum EditViewConstants {
    static let marginConstant = 15.0
}
