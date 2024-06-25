//
//  UILabel+BookBaram.swift
//  BookBaram
//
//  Created by 이송미 on 6/25/24.
//

import UIKit

extension UILabel {
    func dynamicFont(textStyle: UIFont.TextStyle = .body) {
        font = UIFont.preferredFont(forTextStyle: textStyle)
        adjustsFontForContentSizeCategory = true
        numberOfLines = 0
    }
}
