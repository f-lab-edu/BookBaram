//
//  BaramError.swift
//  BookBaram
//
//  Created by 이송미 on 6/1/24.
//

import Foundation

public struct BaramErrorInfo: Error {
    public var error: BaramError
    public var description: String?

    public init(error: BaramError, description: String? = nil) {
        self.error = error
        self.description = description
    }
}

public enum BaramError {
    case invalidRequest
    case invalidResponse
    case invalidDataType
    case saveError
    case unknown
}
