//
//  BookSearchResultCell.swift
//  BookBaram
//
//  Created by 이송미 on 5/27/24.
//

import UIKit

class BookSearchResultCell: UITableViewCell {    
    @IBOutlet var thumnail: UIImageView!
    @IBOutlet var title: UILabel!
    @IBOutlet var author: UILabel!
    
    func setItem(item: Item) {
        self.title.text = item.title
        self.author.text = item.author
        
        DispatchQueue.global().async {
            if let imageData = try? Data(contentsOf: item.image) {
                DispatchQueue.main.sync {
                    self.thumnail.image = UIImage(data: imageData)
                }
            }
        }        
    }
}
