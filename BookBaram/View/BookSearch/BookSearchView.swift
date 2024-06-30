//
//  BookSearchView.swift
//  BookBaram
//
//  Created by 이송미 on 6/17/24.
//

import UIKit

final class BookSearchView: UIView {

    enum BookSearchViewConstants {
        static let marginConstant = 20.0
    }

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
        searchBar.yAxisConstraints(top: safeAreaLayoutGuide.topAnchor)
        searchBar.xAxisConstraints(left: safeAreaLayoutGuide.leftAnchor,
                                   right: safeAreaLayoutGuide.rightAnchor)
    }

    private func bookSearchResultViewLayout() {
        bookSearchResultView.translatesAutoresizingMaskIntoConstraints = false
        bookSearchResultView.topAnchor.constraint(equalTo: searchBar.bottomAnchor,
                                                  constant: BookSearchViewConstants.marginConstant).isActive = true
        bookSearchResultView.yAxisConstraints(bottom: safeAreaLayoutGuide.bottomAnchor)
        bookSearchResultView.xAxisConstraints(left: safeAreaLayoutGuide.leftAnchor,
                                              right: safeAreaLayoutGuide.rightAnchor)

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
