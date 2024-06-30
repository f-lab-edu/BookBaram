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
        let gregorianCalendar = Calendar(identifier: .gregorian)
        calendarView.calendar = gregorianCalendar
        calendarView.locale = Locale(identifier: "ko_KR")

        calendarView.wantsDateDecorations = true

        return calendarView
    }()

    private let bookListView: UITableView = UITableView()

    private let addButton: UIButton = {
        let button = UIButton()
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
        bookCalendarView.makeConstraints { view in
            view.yAxisConstraints(top: topAnchor)
            view.xAxisConstraints(left: leftAnchor, right: rightAnchor)
            view.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.55).isActive = true
        }
    }

    private func bookListViewLayout() {
        bookListView.makeConstraints { _ in
            bookListView.xAxisConstraints(left: leftAnchor, right: rightAnchor)
            bookListView.yAxisConstraints(top: bookCalendarView.bottomAnchor,
                                          topOffset: HomeViewConstants.margin,
                                          bottom: bottomAnchor)
        }

        bookListView.register(HomeBookRecordCell.self, forCellReuseIdentifier: "bookRecordCell")
    }

    private func addButtonLayout() {
        addButton.makeConstraints { view in
            view.yAxisConstraints(bottom: bottomAnchor,
                                  bottomOffset: HomeViewConstants.margin * -1)
            view.xAxisConstraints(right: rightAnchor, rightOffset: HomeViewConstants.margin * -1)
            view.sizeConstraint(width: HomeViewConstants.btnSize, height: HomeViewConstants.btnSize)
        }
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
