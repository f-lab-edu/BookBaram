//
//  EditViewController.swift
//  BookBaram
//
//  Created by 이송미 on 6/9/24.
//

import UIKit
import BookBaramModel
import BookBaramAction

final class EditViewController: UIViewController {
    let editView = EditView()
    let editViewModel = EditViewModel(db: DBAction.shared)

    private lazy var saveBtn: UIBarButtonItem = UIBarButtonItem(title: "Save",
                                                           style: .plain,
                                                           target: self,
                                                           action: #selector(EditViewController.saveContents))

    override func loadView() {
        view = editView
        view.backgroundColor = .systemBackground
        navigationItem.rightBarButtonItem = saveBtn
    }

    override func updateViewConstraints() {
        super.updateViewConstraints()

        editView.layout()
    }

    func updateSelectedBookItem(item: Item?) {
        editViewModel.updateSelectedBookItem(item: item)

        if let item {
            editView.setImage(url: item.image)
        }
    }

    @objc
    func saveContents() {
        editViewModel.saveReview(title: editView.titleTextField.text, contents: editView.contentTextView.text)

        moveToHome()
    }

    private func moveToHome() {
        navigationController?.popToRootViewController(animated: true)
    }
}
