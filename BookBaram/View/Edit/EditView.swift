//
//  EditView.swift
//  BookBaram
//
//  Created by 이송미 on 6/17/24.
//

import UIKit

class EditView: UIView {
    enum EditViewConstants {
        static let marginConstant = 15.0
    }

    let scrollView: UIScrollView = UIScrollView()

    let contentView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 10.0
        return stackView
    }()

    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .black // placeholder
        imageView.heightAnchor.constraint(equalToConstant: 100.0).isActive = true
        return imageView
    }()

    let titleTextField: UITextField = UITextField()

    let contentTextView: UITextView = UITextView()

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
        scrollView.makeConstraints { view in
            view.sizeConstraint(widthDimension: widthAnchor, heightDimension: heightAnchor)
            view.yAxisConstraints(top: safeAreaLayoutGuide.topAnchor,
                                  bottom: safeAreaLayoutGuide.bottomAnchor)
        }
    }

    private func contentViewLayout() {
        contentView.makeConstraints { view in
            view.xAxisConstraints(left: scrollView.leftAnchor,
                                  leftOffset: EditViewConstants.marginConstant,
                                  right: scrollView.rightAnchor,
                                  rightOffset: EditViewConstants.marginConstant)
            view.yAxisConstraints(top: scrollView.topAnchor,
                                  topOffset: EditViewConstants.marginConstant,
                                  bottom: scrollView.bottomAnchor,
                                  bottomOffset: EditViewConstants.marginConstant)
        }
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
