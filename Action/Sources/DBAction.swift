//
//  DBAction.swift
//
//
//  Created by 이송미 on 9/9/24.
//

import Foundation
import SwiftData
import BookBaramModel
import BookBaramDB

public protocol DBProtocol {
    func save<T>(content: T) -> Result<Void, BaramErrorInfo> where T: PersistentModel
    func load<T>() -> [T] where T: PersistentModel
}

public struct DBAction: DBProtocol {
    public static let shared = DBAction()

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
