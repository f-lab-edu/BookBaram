//
//  BookSearchViewController.swift
//  BookBaram
//
//  Created by 이송미 on 5/27/24.
//

import UIKit

class BookSearchViewController: UIViewController {

    @IBOutlet var bookSearchResultView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bookSearchResultView.delegate = self
        bookSearchResultView.dataSource = self
    }
}

// MARK: - UITableViewDelegate
extension BookSearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
}

// MARK: - UITableViewDataSource
extension BookSearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // TODO: 나중에 datasource와 연결 필요
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "bookCell") as? BookSearchResultCell else {
            fatalError("This is not BookSearchResultCell")
        }
        
        // TODO: cell.setItem(...)
        
        return cell
    }
}
