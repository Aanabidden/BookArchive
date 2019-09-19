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
    var loadData: () -> () = { }
    var bindToSourceViewModels :(() -> ()) = {  }
    
    private var filter = BookFilter.None
    private var tableDataSource = [String]()
    private var dataModel: [BookDetail]! {
        didSet {
            configureTableDataSource()
            configureOutput()
        }
    }
        
    init(dataFetcher: BookDetailFetchProtocol) {
        self.dataFetcher = dataFetcher
        loadData = { [weak self] in
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
        tableDataSource.removeAll()
        for book in dataModel {
            if let title = book.title {
                tableDataSource.append(title)
            }
        }
    }
    
    private func configureOutput() {
        title = "Book Archive"
        numberOfRows = tableDataSource.count
        self.bindToSourceViewModels()
    }
    
    func tableCellDataModelForIndexPath(_ indexPath: IndexPath) -> String {
        return tableDataSource[indexPath.row]
    }
    
    func filterList(forType type:BookFilter) -> Void {
        tableDataSource.removeAll()
        switch type {
        case BookFilter.Author:
            configureTableDataSourceAuthor()
        case BookFilter.Category:
            configureTableDataSourceCategory()
        case BookFilter.Genre:
            configureTableDataSourceGenre()
        case BookFilter.None:
            configureTableDataSource()
        }
        let unique = Array(Set(tableDataSource))
        tableDataSource = unique
        configureOutput()
    }
    
    private func configureTableDataSourceAuthor() {
        for book in dataModel {
            if let author = book.authorName {
                tableDataSource.append(author)
            }
        }
    }
    
    private func configureTableDataSourceCategory() {
        for book in dataModel {
            if let category = book.genre {
                tableDataSource.append(category)
            }
        }
    }
    
    private func configureTableDataSourceGenre() {
        for book in dataModel {
            if let genre = book.genre {
                tableDataSource.append(genre)
            }
        }
    }
}
