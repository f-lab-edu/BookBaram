//
//  BookSearchResultCell.swift
//  BookBaram
//
//  Created by 이송미 on 5/27/24.
//

import UIKit

class BookSearchResultCell: UITableViewCell {    
    var thumbnail: UIImageView = UIImageView()
    var title: UILabel = UILabel()
    var author: UILabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout() {
        self.addSubview(thumbnail)
        self.addSubview(title)
        self.addSubview(author)
        
        let marginValue = 15.0
        let imageSize = 100.0
        
        thumbnail.translatesAutoresizingMaskIntoConstraints = false
        thumbnail.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: marginValue).isActive = true
        thumbnail.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        thumbnail.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor, constant: marginValue * -1).isActive = true
        thumbnail.widthAnchor.constraint(equalToConstant: imageSize).isActive = true
        thumbnail.heightAnchor.constraint(equalToConstant: imageSize).isActive = true
        thumbnail.backgroundColor = .black // placeholder
        
        title.translatesAutoresizingMaskIntoConstraints = false
        title.topAnchor.constraint(equalTo: thumbnail.topAnchor).isActive = true
        title.leadingAnchor.constraint(equalTo: self.thumbnail.trailingAnchor, constant: marginValue).isActive = true
        title.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: marginValue).isActive = true
        
        author.translatesAutoresizingMaskIntoConstraints = false
        author.topAnchor.constraint(equalTo: title.bottomAnchor, constant: marginValue).isActive = true
        author.leadingAnchor.constraint(equalTo: title.leadingAnchor).isActive = true
        author.trailingAnchor.constraint(equalTo: title.trailingAnchor).isActive = true
    }
    
    func setItem(item: Item) {
        self.title.text = item.title
        self.author.text = item.author
        
        Task {
            let (imageData, _) = try await URLSession.shared.data(from: item.image)
            self.thumbnail.image = UIImage(data: imageData)
        }
    }
}
