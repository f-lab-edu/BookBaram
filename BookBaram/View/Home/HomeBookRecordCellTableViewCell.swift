//
//  HomeBookRecordCellTableViewCell.swift
//  BookBaram
//
//  Created by 이송미 on 6/9/24.
//

import UIKit

final class HomeBookRecordCellTableViewCell: UITableViewCell {
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .natural
        label.dynamicFont()
        return label
    }()

    private let dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right
        label.dynamicFont()
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        addSubview(titleLabel)
        addSubview(dateLabel)

        titleLabelLayout()
        dateLabelLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func titleLabelLayout() {
        titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,
                                            constant: HomeBookRecordCellConstants.marginConstant).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        titleLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }

    private func dateLabelLayout() {
        dateLabel.leadingAnchor.constraint(equalTo: self.titleLabel.trailingAnchor).isActive = true
        dateLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        dateLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor,
                                            constant: HomeBookRecordCellConstants.marginConstant * -1).isActive = true
        dateLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }

    func setLabel(title: String, date: String) {
        titleLabel.text = title
        dateLabel.text = date
    }
}

enum HomeBookRecordCellConstants {
    static let marginConstant = 20.0
}
