//
//  UIView+BookBaram.swift
//  BookBaram
//
//  Created by 이송미 on 6/24/24.
//

import UIKit

extension UIView {
    func sizeConstraint(width: Double? = nil, height: Double? = nil) {
        if let width {
            self.widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        if let height {
            self.heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }

    func sizeConstraint(widthDimension: NSLayoutDimension, heightDimension: NSLayoutDimension) {
        self.widthAnchor.constraint(equalTo: widthDimension).isActive = true
        self.heightAnchor.constraint(equalTo: heightDimension).isActive = true
    }

    func yAxisConstraints(top: NSLayoutYAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil) {
        if let top {
            self.topAnchor.constraint(equalTo: top).isActive = true
        }

        if let bottom {
            self.bottomAnchor.constraint(equalTo: bottom).isActive = true
        }
    }

    func xAxisConstraints(left: NSLayoutXAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil) {
        if let left {
            self.leftAnchor.constraint(equalTo: left).isActive = true
        }

        if let right {
            self.rightAnchor.constraint(equalTo: right).isActive = true
        }

    }
}
