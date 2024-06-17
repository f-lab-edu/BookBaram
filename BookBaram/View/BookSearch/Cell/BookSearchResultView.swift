//
//  BookSearchResultView.swift
//  BookBaram
//
//  Created by 이송미 on 6/17/24.
//

import UIKit

class BookSearchResultView: UIView {

    let thumbnail: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .black // placeholder
        return imageView
    }()
    
    let title: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let author: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    
    func layout() {
        addSubview(thumbnail)
        addSubview(title)
        addSubview(author)
        
        let marginValue = 15.0
        let imageSize = 100.0
                
        thumbnail.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: marginValue).isActive = true
        thumbnail.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        thumbnail.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor, constant: marginValue * -1).isActive = true
        thumbnail.widthAnchor.constraint(equalToConstant: imageSize).isActive = true
        thumbnail.heightAnchor.constraint(equalToConstant: imageSize).isActive = true
        
        title.topAnchor.constraint(equalTo: thumbnail.topAnchor).isActive = true
        title.leadingAnchor.constraint(equalTo: self.thumbnail.trailingAnchor, constant: marginValue).isActive = true
        title.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: marginValue).isActive = true
        
        author.topAnchor.constraint(equalTo: title.bottomAnchor, constant: marginValue).isActive = true
        author.leadingAnchor.constraint(equalTo: title.leadingAnchor).isActive = true
        author.trailingAnchor.constraint(equalTo: title.trailingAnchor).isActive = true
    }
    
    func setItem(item: Item) async throws {
        self.title.text = item.title
        self.author.text = item.author
        
        let (imageData, _) = try await URLSession.shared.data(from: item.image)
        self.thumbnail.image = UIImage(data: imageData)
    }
}
