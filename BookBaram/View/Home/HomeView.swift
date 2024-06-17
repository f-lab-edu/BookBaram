//
//  HomeView.swift
//  BookBaram
//
//  Created by 이송미 on 6/17/24.
//

import UIKit

class HomeView: UIView {

    let bookCalendarView: UICalendarView = {
        let calendarView = UICalendarView()
        calendarView.translatesAutoresizingMaskIntoConstraints = false
        
        let gregorianCalendar = Calendar(identifier: .gregorian)
        calendarView.calendar = gregorianCalendar
        calendarView.locale = Locale(identifier: "ko_KR")
        
        calendarView.wantsDateDecorations = true
        
        return calendarView
    }()
    
    let bookListView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    let addButton: UIButton = {
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
        
        let margin = 20.0
        let btnSize = 50.0
        
        bookCalendarView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        bookCalendarView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        bookCalendarView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        
        bookListView.topAnchor.constraint(equalTo: bookCalendarView.bottomAnchor, constant: margin).isActive = true
        bookListView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        bookListView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        
        addButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: margin * -1).isActive = true
        addButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: margin * -1).isActive = true
        addButton.widthAnchor.constraint(equalToConstant: btnSize).isActive = true
        addButton.heightAnchor.constraint(equalToConstant: btnSize).isActive = true
        
        bookListView.register(HomeBookRecordCellTableViewCell.self, forCellReuseIdentifier: "bookRecordCell")
    }
    
    func delegate(calendarViewDelegate: UICalendarViewDelegate, tableViewDelegate: UITableViewDelegate, tableViewDataSource: UITableViewDataSource) {
        bookCalendarView.delegate = calendarViewDelegate
        
        bookListView.delegate = tableViewDelegate
        bookListView.dataSource = tableViewDataSource
    }
    
    func addButtonAction(action: UIAction) {
        addButton.addAction(action, for: .touchUpInside)
    }
}
