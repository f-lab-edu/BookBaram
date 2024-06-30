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
    private let nextButton: UIButton = UIButton()
    private let prevButton: UIButton = UIButton()
    private let pageLabel: UILabel = UILabel()

    func layout() {
        backgroundColor = .systemBackground
        self.addSubview(bookSearchResultView)
        self.addSubview(searchBar)

        searchBarLayout()
        bookSearchResultViewLayout()
        pagingLayout()
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
        bookSearchResultView.xAxisConstraints(left: safeAreaLayoutGuide.leftAnchor,
                                              right: safeAreaLayoutGuide.rightAnchor)

        bookSearchResultView.register(BookSearchResultCell.self, forCellReuseIdentifier: "bookCell")
    }

    private func pagingLayout() {
        self.addSubview(nextButton)
        self.addSubview(prevButton)
        self.addSubview(pageLabel)

        nextButtonLayout()
        prevButtonLayout()
        pageLabelLayout()
    }

    private func nextButtonLayout() {
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.setImage(UIImage(systemName: "arrow.right"), for: .normal)
        nextButton.yAxisConstraints(top: bookSearchResultView.bottomAnchor, bottom: safeAreaLayoutGuide.bottomAnchor)
        nextButton.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor,
                                          constant: BookSearchViewConstants.marginConstant * -1).isActive = true
    }

    private func prevButtonLayout() {
        prevButton.translatesAutoresizingMaskIntoConstraints = false
        prevButton.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        prevButton.yAxisConstraints(top: bookSearchResultView.bottomAnchor, bottom: safeAreaLayoutGuide.bottomAnchor)
        prevButton.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor,
                                         constant: BookSearchViewConstants.marginConstant).isActive = true
    }

    private func pageLabelLayout() {
        pageLabel.translatesAutoresizingMaskIntoConstraints = false
        pageLabel.yAxisConstraints(top: bookSearchResultView.bottomAnchor, bottom: safeAreaLayoutGuide.bottomAnchor)
        pageLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }

    func delegate(searchbarDelegate: UISearchBarDelegate,
                  tableViewDelegate: UITableViewDelegate,
                  tableViewDataSource: UITableViewDataSource) {
        searchBar.delegate = searchbarDelegate
        bookSearchResultView.delegate = tableViewDelegate
        bookSearchResultView.dataSource = tableViewDataSource
    }

    func reloadData() {
        bookSearchResultView.reloadData()
    }

    func pageLabelInfo(currentPage: Int, totlaPage: Int) {
        pageLabel.text = "\(currentPage)/\(totlaPage)"
    }

    func addActionForPrevButton(action: UIAction) {
        prevButton.addAction(action, for: .touchUpInside)
    }

    func addActionForNextButton(action: UIAction) {
        nextButton.addAction(action, for: .touchUpInside)
    }

}
