//
//  BookModel.swift
//  BookArchive
//
//  Created by Aradhana Verma on 20/08/19.
//  Copyright © 2019 Aradhana Verma. All rights reserved.
//

import Foundation

struct BookDetail {
    let id      : String?
    let title   : String?
    let genre   : String?
    let authorName : String?
    let authorCounty : String?
    let publisher : String?
    let solCount : Int?
    let imageURL : String?
    
    init(JSON: [String: Any]) {
        self.id = JSON["id"] as? String
        self.title = JSON["book_title"] as? String
        self.genre = JSON["genre"] as? String
        self.authorName = JSON["author_name"] as? String
        self.authorCounty = JSON["author_country"] as? String
        self.publisher = JSON["publisher"] as? String
        self.solCount = JSON["sold_count"] as? Int
        self.imageURL = JSON["image_url"] as? String
    }
}
