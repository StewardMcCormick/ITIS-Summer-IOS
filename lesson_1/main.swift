//
//  main.swift
//  itis-summer-ios
//
//  Created by Steward McCormick on 29.06.2026.
//

import Foundation

struct Book {
    var name: String
    var author: String
    var publishDate: Date
    var pageNum: UInt16
    var isAvailable: Bool
    
    var shortDescription: String { "\(name) — \(author) (\(pageNum) стр.)" }
}

let formatter = DateFormatter()
formatter.dateFormat = "dd.MM.yyyy"

if let publishDate = formatter.date(from: "29.08.2007") {
    let book1 = Book(name: "Some", author: "Author", publishDate: publishDate, pageNum: 128, isAvailable: true)
    print(book1.shortDescription)
} else {
    print("Incorrect date")
}

