//
//  HomeViewController.swift
//  BookBaram
//
//  Created by 이송미 on 6/9/24.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    lazy var bookCalendarView: UICalendarView = {
        let calendarView = UICalendarView()
        calendarView.translatesAutoresizingMaskIntoConstraints = false
        
        let gregorianCalendar = Calendar(identifier: .gregorian)
        calendarView.calendar = gregorianCalendar
        calendarView.locale = Locale(identifier: "ko_KR")
        
        return calendarView
    }()
    
    lazy var bookListView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    lazy var addButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.tintColor = .white
        button.backgroundColor = .orange
        button.layer.cornerRadius = 25.0
        button.addTarget(self, action: #selector(moveToAddEditor), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLayout()
        
        bookCalendarView.delegate = self
        bookCalendarView.wantsDateDecorations = true
        
        bookListView.delegate = self
        bookListView.dataSource = self
    }
    
    private func setLayout() {
        self.view.backgroundColor = .systemBackground
        
        self.view.addSubview(bookCalendarView)
        self.view.addSubview(bookListView)
        self.view.addSubview(addButton)
        
        let margin = 20.0
        let btnSize = 50.0
        
        bookCalendarView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        bookCalendarView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        bookCalendarView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.5).isActive = true
        
        bookListView.topAnchor.constraint(equalTo: self.bookCalendarView.bottomAnchor, constant: margin).isActive = true
        bookListView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        bookListView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        
        addButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: margin * -1).isActive = true
        addButton.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: margin * -1).isActive = true
        addButton.widthAnchor.constraint(equalToConstant: btnSize).isActive = true
        addButton.heightAnchor.constraint(equalToConstant: btnSize).isActive = true
        
        bookListView.register(HomeBookRecordCellTableViewCell.self, forCellReuseIdentifier: "bookRecordCell")
    }
    
    @objc
    private func moveToAddEditor(_ sender: UIButton) {
        let bookSearchViewController = BookSearchViewController()
        self.navigationController?.pushViewController(bookSearchViewController, animated: true)
    }
}

// MARK: - UICalendarViewDelegate
extension HomeViewController: UICalendarViewDelegate {
    
}

// MARK: -
extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

// MARK: -
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "bookRecordCell") as? HomeBookRecordCellTableViewCell else {
            fatalError("cell does not conform type")
        }                
        
        cell.titleLabel.text = "temp"
        cell.dateLabel.text = "temp"
        
        return cell
    }
}
