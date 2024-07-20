//
//  HomeBookRecordView.swift
//  BookBaram
//
//  Created by 이송미 on 6/30/24.
//

import UIKit

final class HomeBookRecordView: UIView {
    enum HomBookRecordConstants {
        static let marginConstant = 20.0
        static let widthPortion = 0.5
    }

    private let titleLabel: UILabel = UILabel()

    private let dateLabel: UILabel = UILabel()

    func layout() {
        addSubview(titleLabel)
        addSubview(dateLabel)

        titleLayout()
        dateLayout()

        titleLabel.text = "hi\n bbbbbbbcccccdddrefafdafadsfasdf"
        dateLabel.text = "hello"
    }

    private func titleLayout() {
        titleLabel.dynamicFont()
        titleLabel.makeConstraints { view in
            view.xAxisConstraints(left: leftAnchor, leftOffset: HomBookRecordConstants.marginConstant)
            view.yAxisConstraints(top: topAnchor, bottom: bottomAnchor)
            view.widthAnchor.constraint(equalTo: widthAnchor,
                                        multiplier: HomBookRecordConstants.widthPortion).isActive = true
        }
    }

    private func dateLayout() {
        dateLabel.dynamicFont()
        dateLabel.textAlignment = .right
        dateLabel.makeConstraints { view in
            view.xAxisConstraints(left: titleLabel.rightAnchor,
                                  right: rightAnchor,
                                  rightOffset: HomBookRecordConstants.marginConstant * -1)
            view.yAxisConstraints(top: titleLabel.topAnchor, bottom: titleLabel.bottomAnchor)
        }
    }
}
