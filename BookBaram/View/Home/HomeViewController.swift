//
//  HomeViewController.swift
//  BookBaram
//
//  Created by 이송미 on 6/9/24.
//

import Foundation
import UIKit

final class HomeViewController: UIViewController {
    let homeView = HomeView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLayout()
        homeView.delegate(calendarViewDelegate: self, tableViewDelegate: self, tableViewDataSource: self)
        homeView.addButtonAction(action: UIAction(handler: { [weak self] _ in
            self?.moveToSearchViewController()
        }))
    }
    
    private func setLayout() {
        self.view.backgroundColor = .systemBackground
        
        view.addSubview(homeView)
        
        homeView.translatesAutoresizingMaskIntoConstraints = false
        homeView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        homeView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        homeView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        homeView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        
        homeView.layout()
    }
        
    private func moveToSearchViewController() {
        let bookSearchViewController = BookSearchViewController()
        self.navigationController?.pushViewController(bookSearchViewController, animated: true)
    }
}

// MARK: - UICalendarViewDelegate
extension HomeViewController: UICalendarViewDelegate {
    
}

// MARK: - UITableViewDelegate
extension HomeViewController: UITableViewDelegate {
}

// MARK: -
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "bookRecordCell") as? HomeBookRecordCellTableViewCell else {
            // 에러 대신 기본 셀??
            return UITableViewCell()
        }
        
        cell.titleLabel.text = "temp"
        cell.dateLabel.text = "temp"
        
        return cell
    }
}
