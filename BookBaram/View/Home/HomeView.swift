//
//  HomeView.swift
//  BookBaram
//
//  Created by 이송미 on 6/17/24.
//

import UIKit

final class HomeView: UIView {

    private let bookCalendarView: UICalendarView = {
        let calendarView = UICalendarView()
        calendarView.translatesAutoresizingMaskIntoConstraints = false

        let gregorianCalendar = Calendar(identifier: .gregorian)
        calendarView.calendar = gregorianCalendar
        calendarView.locale = Locale(identifier: "ko_KR")

        calendarView.wantsDateDecorations = true

        return calendarView
    }()

    private let bookListView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    private let addButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.tintColor = .white
        button.backgroundColor = .orange
        button.layer.cornerRadius = 25.0
        return button
    }()

    func layout() {
        addSubview(bookCalendarView)
        addSubview(bookListView)
        addSubview(addButton)

        bookCalendarViewLayout()
        bookListViewLayout()
        addButtonLayout()
    }

    private func bookCalendarViewLayout() {
        bookCalendarView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        bookCalendarView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        bookCalendarView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
    }

    private func bookListViewLayout() {
        bookListView.topAnchor.constraint(equalTo: bookCalendarView.bottomAnchor,
                                          constant: HomeViewConstants.margin).isActive = true
        bookListView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        bookListView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true

        bookListView.register(HomeBookRecordCellTableViewCell.self, forCellReuseIdentifier: "bookRecordCell")
    }

    private func addButtonLayout() {
        addButton.bottomAnchor.constraint(equalTo: bottomAnchor,
                                          constant: HomeViewConstants.margin * -1).isActive = true
        addButton.trailingAnchor.constraint(equalTo: trailingAnchor,
                                            constant: HomeViewConstants.margin  * -1).isActive = true
        addButton.widthAnchor.constraint(equalToConstant: HomeViewConstants.btnSize).isActive = true
        addButton.heightAnchor.constraint(equalToConstant: HomeViewConstants.btnSize).isActive = true
    }

    func delegate(calendarViewDelegate: UICalendarViewDelegate,
                  tableViewDelegate: UITableViewDelegate,
                  tableViewDataSource: UITableViewDataSource) {
        bookCalendarView.delegate = calendarViewDelegate

        bookListView.delegate = tableViewDelegate
        bookListView.dataSource = tableViewDataSource
    }

    func addButtonAction(action: UIAction) {
        addButton.addAction(action, for: .touchUpInside)
    }
}

enum HomeViewConstants {
    static let margin = 20.0
    static let btnSize = 50.0
}
