//
//  UIView+BookBaram.swift
//  BookBaram
//
//  Created by 이송미 on 6/24/24.
//

import UIKit

enum ConstraintKey {
    static let widthKey = "bbWidth"
    static let heightKey = "bbHeight"
    static let top = "bbTop"
    static let bottom = "bbBottom"
    static let right = "bbRight"
    static let left = "bbLeft"
}

extension UIView {
    func makeConstraints(constraintHandler: (UIView) -> Void) {
        self.translatesAutoresizingMaskIntoConstraints = false
        constraintHandler(self)
    }

    func sizeConstraint(width: Double? = nil, height: Double? = nil) {
        widthConstraint(width: width)
        heightConstraint(height: height)
    }

    private func setYAxisConstraint(identifier: String, layoutConsraint: NSLayoutYAxisAnchor,
                                    targetLayoutConstraint: NSLayoutYAxisAnchor,
                                    offset: CGFloat? = nil) {
        removeLayoutConstraint(identifier: identifier)

        let constraint = layoutConsraint.constraint(equalTo: targetLayoutConstraint)
        constraint.identifier = identifier

        if let offset {
            constraint.offset(offset)
            return
        }

        constraint.isActive = true
    }

    private func setXAxisConstraint(identifier: String, layoutConsraint: NSLayoutXAxisAnchor,
                                    targetLayoutConstraint: NSLayoutXAxisAnchor,
                                    offset: CGFloat? = nil) {
        removeLayoutConstraint(identifier: identifier)

        let constraint = layoutConsraint.constraint(equalTo: targetLayoutConstraint)
        constraint.identifier = identifier

        if let offset {
            constraint.offset(offset)
            return
        }

        constraint.isActive = true
    }

    private func widthConstraint(width: Double? = nil) {
        if let width {
            removeLayoutConstraint(identifier: ConstraintKey.widthKey)
            let widthConstraint = widthAnchor.constraint(equalToConstant: width)
            widthConstraint.identifier = ConstraintKey.widthKey
            widthConstraint.isActive = true
        }
    }

    private func heightConstraint(height: Double? = nil) {
        if let height {
            removeLayoutConstraint(identifier: ConstraintKey.heightKey)
            let heightConstraint = heightAnchor.constraint(equalToConstant: height)
            heightConstraint.identifier = ConstraintKey.heightKey
            heightConstraint.isActive = true
        }
    }

    private func setLayoutDimension(identifier: String,
                                    dimension: NSLayoutDimension,
                                    targetDimension: NSLayoutDimension) {
        removeLayoutConstraint(identifier: identifier)
        let widthConstraint = dimension.constraint(equalTo: targetDimension)
        widthConstraint.identifier = identifier
        widthConstraint.isActive = true
    }

    func sizeConstraint(widthDimension: NSLayoutDimension, heightDimension: NSLayoutDimension) {
        setLayoutDimension(identifier: ConstraintKey.widthKey, dimension: widthAnchor, targetDimension: widthDimension)
        setLayoutDimension(identifier: ConstraintKey.heightKey,
                           dimension: heightAnchor,
                           targetDimension: heightDimension)
    }

    func yAxisConstraints(top: NSLayoutYAxisAnchor? = nil, topOffset: CGFloat? = nil,
                          bottom: NSLayoutYAxisAnchor? = nil,
                          bottomOffset: CGFloat? = nil) {
        if let top {
            setYAxisConstraint(identifier: ConstraintKey.top, layoutConsraint: topAnchor,
                               targetLayoutConstraint: top,
                               offset: topOffset)
        }

        if let bottom {
            setYAxisConstraint(identifier: ConstraintKey.bottom, layoutConsraint: bottomAnchor,
                               targetLayoutConstraint: bottom,
                               offset: bottomOffset)
        }
    }

    func xAxisConstraints(left: NSLayoutXAxisAnchor? = nil, leftOffset: CGFloat? = nil,
                          right: NSLayoutXAxisAnchor? = nil,
                          rightOffset: CGFloat? = nil) {
        if let left {
            setXAxisConstraint(identifier: ConstraintKey.left, layoutConsraint: leftAnchor,
                               targetLayoutConstraint: left, offset: leftOffset)
        }

        if let right {
            setXAxisConstraint(identifier: ConstraintKey.right, layoutConsraint: rightAnchor,
                               targetLayoutConstraint: right, offset: rightOffset)
        }
    }

    private func getLayoutConstraint(identifier: String) -> NSLayoutConstraint? {
        return constraints.filter { constraint in
            constraint.identifier == identifier
        }.first
    }

    private func removeLayoutConstraint(identifier: String) {
        if let constraint = getLayoutConstraint(identifier: identifier) {
            removeConstraint(constraint)
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
