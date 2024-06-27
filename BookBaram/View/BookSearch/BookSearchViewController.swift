//
//  BookSearchViewController.swift
//  BookBaram
//
//  Created by 이송미 on 5/27/24.
//

import UIKit

protocol ReloadDelegate {
    func reloadTable()
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
        bookSearchViewModel.reloadDelegate = self
    }

    private func setLayout() {
        bookSearchView.layout()
    }
}

// MARK: - UITableViewDelegate
extension BookSearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

// MARK: - UITableViewDataSource
extension BookSearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookSearchViewModel.bookResult.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "bookCell") as? BookSearchResultCell else {
            return UITableViewCell()
        }

        cell.setItem(item: bookSearchViewModel.bookResult[indexPath.row])

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
extension BookSearchViewController: ReloadDelegate {
    func reloadTable() {
        self.bookSearchView.reloadData()
    }
}
