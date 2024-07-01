//
//  HomeBookRecordCellTableViewCell.swift
//  BookBaram
//
//  Created by 이송미 on 6/9/24.
//

import UIKit

final class HomeBookRecordCell: UITableViewCell {
    private let homeBookRecordView = HomeBookRecordView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        self.contentView.addSubview(homeBookRecordView)
        homeBookRecordView.makeConstraints { view in
            view.yAxisConstraints(top: contentView.topAnchor, bottom: contentView.bottomAnchor)
            view.xAxisConstraints(left: contentView.leftAnchor, right: contentView.rightAnchor)
        }
        homeBookRecordView.layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
