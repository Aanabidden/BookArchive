//
//  HomeViewModel.swift
//  BookArchive
//
//  Created by Aradhana Verma on 21/08/19.
//  Copyright © 2019 Aradhana Verma. All rights reserved.
//

import Foundation

class HomeViewModel {
    var dataFetcher : BookDetailFetchProtocol!
    
    // Output
    var displayError:(String)->() = { _ in }
    var numberOfRows = 0
    var title = ""
    
    // Input
    var viewDidLoad: () -> () = { }
    
    private var tableDataSource = [BookDetail]()
    private var dataModel: [BookDetail]! {
        didSet {
            configureTableDataSource()
            configureOutput()
        }
    }
        
    init(dataFetcher: BookDetailFetchProtocol) {
        self.dataFetcher = dataFetcher
        viewDidLoad = { [weak self] in
            self?.getBooksData()
        }
    }
   
    private func getBooksData() {
        dataFetcher.fetchBookDetail { [weak self] (bookList, errorMessage) in
            guard let books = bookList else {
                self?.displayError(errorMessage!)
                return
            }
            self?.dataModel = books
        }
    }
    
    private func configureTableDataSource() {
        for book in dataModel {
            tableDataSource.append(book)
        }
    }
    
    private func configureOutput() {
        title = "Book Archive"
        numberOfRows = tableDataSource.count
    }
    
    func tableCellDataModelForIndexPath(_ indexPath: IndexPath) -> BookDetail {
        return tableDataSource[indexPath.row]
    }
}
