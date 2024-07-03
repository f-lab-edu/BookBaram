//
//  UIView+BookBaram.swift
//  BookBaram
//
//  Created by 이송미 on 6/24/24.
//

import UIKit

extension UIView {
    func makeConstraints(constraintHandler: (UIView) -> Void) {
        self.translatesAutoresizingMaskIntoConstraints = false
        constraintHandler(self)
    }

    func sizeConstraint(width: Double, height: Double) {
        self.widthAnchor.constraint(equalToConstant: width).isActive = true
        self.heightAnchor.constraint(greaterThanOrEqualToConstant: height).isActive = true
    }

    func sizeConstraint(widthDimension: NSLayoutDimension, heightDimension: NSLayoutDimension) {
        self.widthAnchor.constraint(equalTo: widthDimension).isActive = true
        self.heightAnchor.constraint(equalTo: heightDimension).isActive = true
    }

    func yAxisConstraints(top: NSLayoutYAxisAnchor? = nil,
                          topOffset: CGFloat? = nil,
                          bottom: NSLayoutYAxisAnchor? = nil,
                          bottomOffset: CGFloat? = nil) {
        if let top {
            self.topAnchor.constraint(equalTo: top).offset(topOffset)
        }

        if let bottom {
            self.bottomAnchor.constraint(equalTo: bottom).offset(bottomOffset)
        }
    }

    func xAxisConstraints(left: NSLayoutXAxisAnchor? = nil,
                          leftOffset: CGFloat? = nil,
                          right: NSLayoutXAxisAnchor? = nil,
                          rightOffset: CGFloat? = nil) {
        if let left {
            self.leftAnchor.constraint(equalTo: left).offset(leftOffset)
        }

        if let right {
            self.rightAnchor.constraint(equalTo: right).offset(rightOffset)
        }
    }
}

extension NSLayoutConstraint {
    func offset(_ offset: CGFloat?) {
        if let offset {
            self.constant = offset
        }
        self.isActive = true
    }
}
