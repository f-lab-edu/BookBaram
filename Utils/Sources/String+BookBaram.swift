//
//  Date+BookBaram.swift
//  BookBaram
//
//  Created by 이송미 on 8/2/24.
//

import Foundation

extension String {
    public func toDate() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE, dd MMM yyyy HH:mm:ss Z"

        return dateFormatter.date(from: self)
    }
}
