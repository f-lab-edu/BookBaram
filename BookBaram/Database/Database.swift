//
//  Database.swift
//  BookBaram
//
//  Created by 이송미 on 8/5/24.
//

import Foundation
import SwiftData

final class Database: Sendable {
    static let shared = Database()

    private let container: ModelContainer = {
        let schema = Schema([ReviewContent.self])
        let configuration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: configuration)
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    func saveReviewContents(reviewContents: ReviewContent) throws {
        let context = ModelContext(container)
        context.insert(reviewContents)

        do {
            try context.save()
        } catch {
            throw BaramErrorInfo(error: .saveError, description: error.localizedDescription)
        }
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
