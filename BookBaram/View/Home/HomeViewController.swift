//
//  HomeViewController.swift
//  BookBaram
//
//  Created by 이송미 on 6/9/24.
//

import Foundation
import UIKit
import SwiftUI

protocol ReloadDelegate: AnyObject {
    func reloadTable()
}

final class HomeViewController: UIViewController {
    private let homeView = HomeView()
    private let homeViewModel = HomeViewModel()

    override func loadView() {
        self.view = homeView
        self.view.backgroundColor = .systemBackground
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        homeView.delegate(calendarViewDelegate: self,
                          calendarDateSelection: UICalendarSelectionSingleDate(delegate: self),
                          tableViewDelegate: self,
                          tableViewDataSource: self)
        homeView.addButtonAction(action: UIAction(handler: { [weak self] _ in
            self?.moveToSearchViewController()
        }))

        homeViewModel.updateReloadDelegate(self)
        homeViewModel.loadReviewContents()
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
        uiHostingController.view.frame = homeView.frame
        self.navigationController?.pushViewController(uiHostingController, animated: true)
    }

}

// MARK: - UICalendarViewDelegate
extension HomeViewController: UICalendarViewDelegate, UICalendarSelectionSingleDateDelegate {
    func dateSelection(_ selection: UICalendarSelectionSingleDate, didSelectDate dateComponents: DateComponents?) {
        guard var dateComponents else { return }
        dateComponents.timeZone = TimeZone(identifier: "Asia/Tokyo")
        guard let date = dateComponents.date else { return }

        homeViewModel.loadReviewContents(date: date)
    }
}

// MARK: - UITableViewDelegate
extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let userBookReview = homeViewModel.reviewContetList[indexPath.row].toUserBookReview()
        moveToReadView(userBookReview: userBookReview)
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
