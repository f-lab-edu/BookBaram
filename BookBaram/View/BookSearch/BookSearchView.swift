//
//  BookSearchView.swift
//  BookBaram
//
//  Created by 이송미 on 6/17/24.
//

import UIKit

final class BookSearchView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    let bookSearchResultView: UITableView = UITableView()
    let searchBar: UISearchBar = UISearchBar()

    func layout() {
        backgroundColor = .systemBackground
        self.addSubview(bookSearchResultView)
        self.addSubview(searchBar)

        let marginConstant = 20.0
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        searchBar.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
        searchBar.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true

        bookSearchResultView.translatesAutoresizingMaskIntoConstraints = false
        bookSearchResultView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: marginConstant).isActive = true
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
