//
//  HomeViewController.swift
//  BookBaram
//
//  Created by 이송미 on 6/9/24.
//

import Foundation
import UIKit
import SwiftUI
import BookBaramModel
import BookBaramAction

protocol ReloadDelegate: AnyObject {
    func reloadTable()
}

final class HomeViewController: UIViewController {
    private let homeView = HomeView()
    private let homeViewModel = HomeViewModel(db: DBAction.shared)

    override func loadView() {
        self.view = homeView
        self.view.backgroundColor = .systemBackground
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setLayout()

        homeView.delegate(calendarViewDelegate: self, tableViewDelegate: self, tableViewDataSource: self)
        homeView.addButtonAction(action: UIAction(handler: { [weak self] _ in
            self?.moveToSearchViewController()
        }))
        homeViewModel.updateReloadDelegate(self)
    }

    override func updateViewConstraints() {
        super.updateViewConstraints()
        setLayout()
    }

    private func setLayout() {
        homeView.layout()
    }

    private func moveToSearchViewController() {
        let bookSearchViewController = BookSearchViewController()
        self.navigationController?.pushViewController(bookSearchViewController, animated: true)
    }

    private func moveToReadView(userBookReview: UserBookReview) {
        let uiHostingController = UIHostingController(rootView: ReadView(userBookReview: userBookReview))
        self.navigationController?.pushViewController(uiHostingController, animated: true)
    }

    override func viewDidAppear(_ animated: Bool) {
        homeViewModel.loadReviewContents()
    }
}

// MARK: - UICalendarViewDelegate
extension HomeViewController: UICalendarViewDelegate {

}

// MARK: - UITableViewDelegate
extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // TODO: self.moveToReadView(...)
    }
}

// MARK: -
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeViewModel.reviewContetList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "bookRecordCell")
                as? HomeBookRecordCell else {
            // 에러 대신 기본 셀??
            return UITableViewCell()
        }

        cell.setContent(content: homeViewModel.reviewContetList[indexPath.row])

        return cell
    }
}

extension HomeViewController: ReloadDelegate {
    func reloadTable() {
        homeView.reloadData()
    }
}
