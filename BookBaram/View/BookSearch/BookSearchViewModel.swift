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
    var searchBookResult: SearchBookResults?
    var reloadDelegate: ReloadDelegate?
    var error: Error?

    func searchBook(query: String?, start: Int = 1, display: Int = 10) {
        guard let query else { return }
        Task {
            do {
                let data = try await requestSearchBook(query, start: start, display: display)
                try await parseSearchBookResponse(query: query, data: data)
            } catch {
                self.error = error
            }
        }
    }

    private func requestSearchBook(_ query: String, start: Int, display: Int = 10) async throws -> Data? {
        return try await ApiClient.shared.request(BaramUrl.naverApi + Path.bookSearch,
                                                  method: .get,
                                                  parameters: ["query": query,
                                                               "start": start,
                                                               "display": display],
                                                  headers: ApiClient.shared.naverApiHeader)
    }

    private func parseSearchBookResponse(query: String, data: Data?) async throws {
        guard let data = data else {
            throw BaramErrorInfo(error: .invalidDataType)
        }
        let bookResponse = try JSONDecoder().decode(SearchBookResponse.self, from: data)
        await updateBookResult(query: query, response: bookResponse)
    }

    @MainActor
    private func updateBookResult(query: String, response: SearchBookResponse) {
        searchBookResult = SearchBookResults(queryKeyword: query, searchBookResponse: response)
        reloadDelegate?.reloadTable()
    }
}
