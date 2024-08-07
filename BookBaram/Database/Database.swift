//
//  Database.swift
//  BookBaram
//
//  Created by 이송미 on 8/5/24.
//

import Foundation
import SwiftData

final class Database {
    static let shared = Database()

    private var container: ModelContainer = {
        let schema = Schema([ReviewContent.self])
        let configuration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: configuration)
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    func saveReviewContents(reviewContents: ReviewContent) {
        let context = ModelContext(container)
        context.insert(reviewContents)
        try? context.save()
    }

    func loadReviewContents() -> [ReviewContent] {
        do {
            let context = ModelContext(container)
            let resultData = try context.fetch(FetchDescriptor<ReviewContent>())
            return resultData
        } catch {
            return []
        }
    }
}
