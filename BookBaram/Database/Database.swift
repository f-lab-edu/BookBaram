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

    func saveReviewContents(reviewContents: ReviewContent) throws {
        let context = ModelContext(container)
        context.insert(reviewContents)

        do {
            try context.save()
        } catch {
            throw BaramErrorInfo(error: .saveError, description: error.localizedDescription)
        }
    }

    // FetchDescriptor<ReviewContent>()
    func loadReviewContents(date: Date) -> [ReviewContent] {

        do {
            let context = ModelContext(container)
            let resultData = try context.fetch(FetchDescriptor<ReviewContent>(predicate: Database.compareDate(targetDate: date)))
            return resultData
        } catch {
            return []
        }
    }

    private static func compareDate(targetDate: Date) -> Predicate<ReviewContent> {
        let calendar = Calendar.autoupdatingCurrent
        let start = calendar.startOfDay(for: targetDate)
        let end = calendar.date(byAdding: .init(day: 1), to: start) ?? start

        return #Predicate<ReviewContent> { review in
            review.date >= start && end <= review.date
        }
    }
}
