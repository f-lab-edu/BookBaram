//
//  BookSearchView.swift
//  BookBaram
//
//  Created by 이송미 on 6/17/24.
//

import UIKit

final class BookSearchView: UIView {

    private let bookSearchResultView: UITableView = UITableView()
    private let searchBar: UISearchBar = UISearchBar()

    func layout() {
        backgroundColor = .systemBackground
        self.addSubview(bookSearchResultView)
        self.addSubview(searchBar)

        searchBarLayout()
        bookSearchResultViewLayout()
    }

    private func searchBarLayout() {
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        searchBar.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
        searchBar.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
    }

    private func bookSearchResultViewLayout() {
        bookSearchResultView.translatesAutoresizingMaskIntoConstraints = false
        bookSearchResultView.topAnchor.constraint(equalTo: searchBar.bottomAnchor,
                                                  constant: BookSearchViewConstants.marginConstant).isActive = true
        bookSearchResultView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        bookSearchResultView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
        bookSearchResultView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true

        bookSearchResultView.register(BookSearchResultCell.self, forCellReuseIdentifier: "bookCell")
    }

    func delegate(searchbarDelegate: UISearchBarDelegate,
                  tableViewDelegate: UITableViewDelegate,
                  tableViewDataSource: UITableViewDataSource) {
        searchBar.delegate = searchbarDelegate
        bookSearchResultView.delegate = tableViewDelegate
        bookSearchResultView.dataSource = tableViewDataSource
    }

}

enum BookSearchViewConstants {
    static let marginConstant = 20.0
}
