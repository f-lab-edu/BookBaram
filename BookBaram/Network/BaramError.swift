//
//  BaramError.swift
//  BookBaram
//
//  Created by 이송미 on 6/1/24.
//

import Foundation

struct BaramErrorInfo: Error {
    var error: BaramError
    var description: String?
}

enum BaramError {
    case invalidRequest
    case invalidResponse
    case unknown
}
