//
//  main.swift
//  itis-summer-ios
//
//  Created by Steward McCormick on 29.06.2026.
//

import Foundation

enum Genre: String {
    case Fantasy = "фантастика"
    case Detective = "детектив"
    case Classical = "классика"
    case NonFiction = "нон-фикшн"
}

struct Book {
    var name: String
    var author: String
    var genre: Genre
    var publishDate: Date
    var pageNum: UInt16
    var isAvailable: Bool
    
    var shortDescription: String { "\(name) — \(author) (\(pageNum) стр.)" }
}
