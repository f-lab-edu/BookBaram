//
//  UIViewController+BookBaram.swift
//  BookBaram
//
//  Created by 이송미 on 9/15/24.
//

import UIKit

extension UIViewController {
    func presentError(error: Error?) {
        let message = "에러가 발생했습니다. 잠시 후에 시도해주세요.\n\(String(describing: error?.localizedDescription))"
        
        let alert = UIAlertController(title: "Error Occur", message: message, preferredStyle: .alert)
        present(alert, animated: true)
    }
}
