//
//  Date+BookBaram.swift
//  BookBaram
//
//  Created by 이송미 on 8/7/24.
//

import Foundation

extension Date {
    func toString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"

        return dateFormatter.string(from: self)
    }
}
