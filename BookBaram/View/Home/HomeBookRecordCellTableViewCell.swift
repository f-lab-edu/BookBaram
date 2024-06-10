//
//  HomeBookRecordCellTableViewCell.swift
//  BookBaram
//
//  Created by 이송미 on 6/9/24.
//

import UIKit

class HomeBookRecordCellTableViewCell: UITableViewCell {
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .natural
        label.numberOfLines = 0
        return label
    }()
    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(titleLabel)
        addSubview(dateLabel)
        
        let marginConstant = 20.0
        
        titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: marginConstant).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        titleLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5).isActive = true
        
        dateLabel.leadingAnchor.constraint(equalTo: self.titleLabel.trailingAnchor).isActive = true
        dateLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        dateLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: marginConstant * -1).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
