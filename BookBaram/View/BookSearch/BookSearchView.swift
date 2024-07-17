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
        searchBar.makeConstraints { view in
            view.yAxisConstraints(top: safeAreaLayoutGuide.topAnchor)
            view.xAxisConstraints(left: safeAreaLayoutGuide.leftAnchor,
                                  right: safeAreaLayoutGuide.rightAnchor)
        }
    }

    private func bookSearchResultViewLayout() {
        bookSearchResultView.makeConstraints {  view in
            view.topAnchor.constraint(equalTo: searchBar.bottomAnchor,
                                      constant: BookSearchViewConstants.marginConstant).isActive = true
            view.xAxisConstraints(left: safeAreaLayoutGuide.leftAnchor,
                                  right: safeAreaLayoutGuide.rightAnchor)
        }
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
        nextButton.makeConstraints { view in
            view.yAxisConstraints(top: bookSearchResultView.bottomAnchor, bottom: safeAreaLayoutGuide.bottomAnchor)
            view.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor,
                                        constant: BookSearchViewConstants.marginConstant * -1).isActive = true
        }
        nextButton.setImage(UIImage(systemName: "arrow.right"), for: .normal)
    }

    private func prevButtonLayout() {
        prevButton.makeConstraints { view in
            view.yAxisConstraints(top: bookSearchResultView.bottomAnchor, bottom: safeAreaLayoutGuide.bottomAnchor)
            view.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor,
                                       constant: BookSearchViewConstants.marginConstant).isActive = true
        }
        prevButton.setImage(UIImage(systemName: "arrow.left"), for: .normal)
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
