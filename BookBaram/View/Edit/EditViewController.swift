//
//  EditViewController.swift
//  BookBaram
//
//  Created by 이송미 on 6/9/24.
//

import UIKit

class EditViewController: UIViewController {

    override func loadView() {
        view = EditView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setLayout()
    }

    private func setLayout() {
        self.view.backgroundColor = .systemBackground

        if let editView = view as? EditView {
            editView.layout()
        }
    }
}
