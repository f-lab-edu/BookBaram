//
//  EditViewController.swift
//  BookBaram
//
//  Created by 이송미 on 6/9/24.
//

import UIKit

class EditViewController: UIViewController {
    let editView = EditView()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setLayout()
    }

    private func setLayout() {
        self.view.backgroundColor = .systemBackground
        view.addSubview(editView)

        editView.translatesAutoresizingMaskIntoConstraints = false
        editView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        editView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        editView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        editView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true

        editView.layout()
    }
}
