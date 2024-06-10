//
//  EditViewController.swift
//  BookBaram
//
//  Created by 이송미 on 6/9/24.
//

import UIKit

class EditViewController: UIViewController {
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    lazy var contentView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 10.0
        return stackView
    }()
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .black // placeholder
        return imageView
    }()
    
    lazy var titleTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var contentTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setLayout()
    }
    
    private func setLayout() {
        self.view.backgroundColor = .systemBackground
        
        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        contentView.addArrangedSubview(imageView)
        contentView.addArrangedSubview(titleTextField)
        contentView.addArrangedSubview(contentTextView)
        
        let marginConstant = 15.0
        
        scrollView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: marginConstant).isActive = true
        contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: marginConstant * -1).isActive = true
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: marginConstant * -2).isActive = true
        contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor).isActive = true

        imageView.heightAnchor.constraint(equalToConstant: 100.0).isActive = true
        
        titleTextField.borderStyle = .roundedRect
        titleTextField.placeholder = "Write the title"
        
        contentTextView.layer.borderWidth = 1.0
        contentTextView.layer.cornerRadius = 8
        contentTextView.layer.borderColor = UIColor.lightGray.cgColor
        contentTextView.text = "Content"
                
    }
}
