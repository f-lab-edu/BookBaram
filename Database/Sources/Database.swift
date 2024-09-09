//
//  Database.swift
//  BookBaram
//
//  Created by 이송미 on 8/5/24.
//

import Foundation
import SwiftData
import BookBaramModel

final public class Database {
    public static let shared = Database()

    private var container: ModelContainer = {
        let schema = Schema([ReviewContent.self])
        let configuration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: configuration)
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    public func saveContent<T>(content: T) throws where T: PersistentModel {
        let context = ModelContext(container)
        context.insert(content)

        do {
            try context.save()
        } catch {
            throw BaramErrorInfo(error: .saveError, description: error.localizedDescription)
        }
    }

    public func loadContent<T>() -> [T] where T: PersistentModel {
        do {
            let context = ModelContext(container)
            let resultData = try context.fetch(FetchDescriptor<T>())
            return resultData
        } catch {
            return []
        }
    }
}
