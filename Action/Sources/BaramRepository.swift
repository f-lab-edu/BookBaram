//
//  Repository.swift
//
//
//  Created by 이송미 on 9/9/24.
//

import Foundation
import SwiftData
import BookBaramModel
import BookBaramDB

public protocol Repository {
    func save<T>(content: T) -> Result<Void, BaramErrorInfo> where T: PersistentModel
    func load<T>() -> [T] where T: PersistentModel
}

public struct BaramRepository: Repository {
    public init() {}

    public func save<T>(content: T) -> Result<Void, BaramErrorInfo> where T: PersistentModel {
        do {
            try Database.shared.saveContent(content: content)
            return .success(Void())
        } catch {
            return .failure(BaramErrorInfo(error: .saveError))
        }
    }

    public func load<T>() -> [T] where T: PersistentModel {
        Database.shared.loadContent()
    }
}
