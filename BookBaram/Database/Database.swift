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
        let schema = Schema([ReviewContents.self])
        let configuration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: configuration)
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    func saveReviewContents(reviewContents: ReviewContents) {
        Task { @MainActor in
            container.mainContext.insert(reviewContents)
            try? container.mainContext.save()
        }
    }
}
