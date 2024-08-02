//
//  ImageInfo.swift
//  BookBaram
//
//  Created by 이송미 on 8/2/24.
//

import Foundation

struct ImageInfo: Codable {
    let url: URL
    let data: Data
    let expireTime: Date?

    init(url: URL, data: Data, expireTime: String?) {
        self.url = url
        self.data = data
        self.expireTime = expireTime?.toDate()
    }
}
