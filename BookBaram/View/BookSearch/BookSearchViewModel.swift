//
//  BookSearchViewModel.swift
//  BookBaram
//
//  Created by 이송미 on 6/27/24.
//

import Foundation

class BookSearchViewModel {
    static let shared = BookSearchViewModel()
    var bookResult: [Item] = []

    func searchBook(query: String?, start: Int = 1, display: Int = 10) {
        guard let query else { return }

        print("api request")
        Task {
            do {
                if let data = try await ApiClient.shared.request(BaramUrl.naverApi + Path.bookSearch,
                                                              method: .get,
                                                              parameters: [
                                                                "query": query,
                                                                "start": start,
                                                                "display": display
                                                              ],
                                                                 headers: ApiClient.shared.naverApiHeader) {
                    let bookResponse = try JSONDecoder().decode(SearchBookResponse.self, from: data)
                    print("response: \(bookResponse)")
                    await updateBookResult(items: bookResponse.items)
                }

            } catch {
                print("error: \(error)")
            }
        }
    }

    @MainActor
    func updateBookResult(items: [Item]) {
        bookResult.removeAll()
        bookResult.append(contentsOf: items)
    }
}
