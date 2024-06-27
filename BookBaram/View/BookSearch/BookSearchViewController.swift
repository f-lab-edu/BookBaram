//
//  BookSearchViewController.swift
//  BookBaram
//
//  Created by 이송미 on 5/27/24.
//

import UIKit

final class BookSearchViewController: UIViewController {
    let bookSearchViewModel = BookSearchViewModel.shared

    override func loadView() {
        self.view = BookSearchView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // init viewlayout
        setLayout()

        // set delegate
        if let bookSearchView = view as? BookSearchView {
            bookSearchView.delegate(searchbarDelegate: self, tableViewDelegate: self, tableViewDataSource: self)
        }
    }

    private func setLayout() {
        if let bookSearchView = view as? BookSearchView {
            bookSearchView.layout()
        }
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
            fatalError("This is not BookSearchResultCell")
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
