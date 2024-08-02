//
//  EditViewController.swift
//  BookBaram
//
//  Created by 이송미 on 6/9/24.
//

import UIKit

class EditViewController: UIViewController {
    let editView = EditView()

    override func loadView() {
        view = editView
        view.backgroundColor = .systemBackground
    }

    override func updateViewConstraints() {
        super.updateViewConstraints()

        editView.layout()
    }
}
