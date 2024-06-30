//
//  BookSearchViewController.swift
//  BookBaram
//
//  Created by 이송미 on 5/27/24.
//

import UIKit

protocol BookSearchResultsUpdateDelegate: AnyObject {
    func reloadTable()
    func updatePagingInfo(currentPage: Int, totalPage: Int)
}

final class BookSearchViewController: UIViewController {
    private let bookSearchView = BookSearchView()
    private let bookSearchViewModel = BookSearchViewModel.shared

    override func loadView() {
        self.view = bookSearchView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // init viewlayout
        setLayout()

        // set delegate
        bookSearchView.delegate(searchbarDelegate: self, tableViewDelegate: self, tableViewDataSource: self)
        bookSearchViewModel.bookSearchResultsUpdateDelegate = self
    }

    private func setLayout() {
        bookSearchView.layout()
        bookSearchView.addActionForNextButton(action: UIAction(handler: { [weak self] _ in
            self?.bookSearchViewModel.searchNextPage()
        }))
        bookSearchView.addActionForPrevButton(action: UIAction(handler: { [weak self] _ in
            self?.bookSearchViewModel.searchPrevPage()
        }))
    }
}

// MARK: - UITableViewDelegate
extension BookSearchViewController: UITableViewDelegate {
}

// MARK: - UITableViewDataSource
extension BookSearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookSearchViewModel.searchBookResult?.items.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "bookCell") as? BookSearchResultCell else {
            return UITableViewCell()
        }

        if let searchBookResult = bookSearchViewModel.searchBookResult {
            cell.setItem(item: searchBookResult.items[indexPath.row])
        }

        return cell
    }
}

// MARK: - UISearchBarDelegate
extension BookSearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        bookSearchViewModel.searchBook(query: searchBar.text)
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
    }
}

// MARK: - ReloadDelegate {
extension BookSearchViewController: BookSearchResultsUpdateDelegate {
    func reloadTable() {
        self.bookSearchView.reloadData()
    }

    func updatePagingInfo(currentPage: Int, totalPage: Int) {
        self.bookSearchView.pageLabelInfo(currentPage: currentPage, totlaPage: totalPage)
    }
}
