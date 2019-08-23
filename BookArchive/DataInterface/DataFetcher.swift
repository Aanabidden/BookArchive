//
//  DataParser.swift
//  BookArchive
//
//  Created by Aradhana Verma on 21/08/19.
//  Copyright © 2019 Aradhana Verma. All rights reserved.
//

import Foundation

protocol BookDetailFetchProtocol {
    func fetchBookDetail(completion:@escaping ([BookDetail]?,_ errorMessage: String?)->())
}

class BookDetailFetch: BookDetailFetchProtocol {
    func fetchBookDetail(completion:@escaping ([BookDetail]?, String?) -> ()) {
        let strURL = "http://android.jiny.mockable.io/getAll"
        
        APICall.requestGETURL(strURL, success: {
            (JSONResponse) -> Void in
            guard let results = JSONResponse["list"].arrayObject else { return }
            completion(self.BookDetailListFrom(results: results as! [[String : Any]]), nil)
        }) {
            (error) -> Void in
            print(error)
        }
    }
    
    private func BookDetailListFrom(results: [[String: Any]]) -> [BookDetail] {
        var arrBook = [BookDetail]()
        for book in results {
            arrBook.append(BookDetail(JSON: book))
        }
    
        return arrBook
    }
    
}
