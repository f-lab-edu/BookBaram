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

    let contentTextView: UITextView = {
        let textView = UITextView()
        textView.heightAnchor.constraint(equalToConstant: 250.0).isActive = true
        return textView
    }()

    func layout() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)

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
            view.xAxisConstraints(left: safeAreaLayoutGuide.leftAnchor,
                                  leftOffset: EditViewConstants.marginConstant,
                                  right: safeAreaLayoutGuide.rightAnchor,
                                  rightOffset: EditViewConstants.marginConstant * -1)
            view.yAxisConstraints(top: safeAreaLayoutGuide.topAnchor,
                                  bottom: safeAreaLayoutGuide.bottomAnchor)
        }
    }

    private func contentViewLayout() {
        contentView.makeConstraints { view in
            view.xAxisConstraints(left: scrollView.leftAnchor,
                                  right: scrollView.rightAnchor)
            view.yAxisConstraints(top: scrollView.topAnchor,
                                  bottom: scrollView.bottomAnchor)
            view.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        }
    }

    private func textFieldStyle() {
        titleTextField.font = UIFont.preferredFont(forTextStyle: .body)
        titleTextField.adjustsFontForContentSizeCategory = true
        titleTextField.borderStyle = .roundedRect
        titleTextField.placeholder = "Write the title"
    }

    private func contentTextViewStyle() {
        contentTextView.font = UIFont.preferredFont(forTextStyle: .body)
        contentTextView.adjustsFontForContentSizeCategory = true
        contentTextView.layer.borderWidth = 1.0
        contentTextView.layer.cornerRadius = 8
        contentTextView.layer.borderColor = UIColor.lightGray.cgColor
    }

    @MainActor
    func setImage(url: URL) {
        Task {
            if let result = try? await URLSession.shared.data(from: url) {
                imageView.image = UIImage(data: result.0)
            }
        }
    }
}
