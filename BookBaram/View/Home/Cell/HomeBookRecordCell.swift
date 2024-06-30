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

        self.addSubview(homeBookRecordView)
        homeBookRecordView.makeConstraints { view in
            view.yAxisConstraints(top: topAnchor, bottom: bottomAnchor)
            view.xAxisConstraints(left: leftAnchor, right: rightAnchor)
        }
        homeBookRecordView.layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
