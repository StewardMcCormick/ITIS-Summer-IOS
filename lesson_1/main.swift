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

func genreDespription(genre value: Genre) -> String {
    switch value {
    case .Fantasy:
        return "фантастика — книги о вымышленных мирах и технологиях"
    case .Classical:
        return "классика — литература, прошедшая проверку временем"
    case .Detective:
        return "детектив — произведения о расследованиях"
    case .NonFiction:
        return "нон-фикшн — документальная проза о науке, истории, бизнесе и психологии, расширяющая картину мира без вымысла"
    }
}

protocol Printable {
    func PrintInfo() -> Void
}

struct Book: Printable {
    var name: String
    var author: String
    var genre: Genre
    var publishDate: Date
    var pageNum: UInt16
    var isAvailable: Bool
    
    var shortDescription: String { "\(name) — \(author) (\(pageNum) стр.)" }
    
    func PrintInfo() -> Void {
        print("Название: \(name)")
        print("Автор: \(author)")
        print("Жанр: \(genre.rawValue)")
        print("Дата публикации: \(publishDate)")
        print("Страниц: \(pageNum)")
        print("Доступность: \(isAvailable ? "доступна" : "недоступна")")
    }
}

let books: [Book] = [
    Book(
        name: "1984",
        author: "Джордж Оруэлл",
        genre: .Fantasy,
        publishDate: Calendar.current.date(from: DateComponents(year: 1949, month: 6, day: 8))!,
        pageNum: 328,
        isAvailable: true
    ),
    Book(
        name: "Преступление и наказание",
        author: "Фёдор Достоевский",
        genre: .Classical,
        publishDate: Calendar.current.date(from: DateComponents(year: 1866, month: 1, day: 1))!,
        pageNum: 672,
        isAvailable: false
    ),
    Book(
        name: "Собака Баскервилей",
        author: "Артур Конан Дойл",
        genre: .Detective,
        publishDate: Calendar.current.date(from: DateComponents(year: 1902, month: 4, day: 1))!,
        pageNum: 256,
        isAvailable: true
    ),
    Book(
        name: "Sapiens. Краткая история человечества",
        author: "Юваль Ной Харари",
        genre: .NonFiction,
        publishDate: Calendar.current.date(from: DateComponents(year: 2011, month: 1, day: 1))!,
        pageNum: 512,
        isAvailable: true
    ),
    Book(
        name: "Дюна",
        author: "Фрэнк Герберт",
        genre: .Fantasy,
        publishDate: Calendar.current.date(from: DateComponents(year: 1965, month: 8, day: 1))!,
        pageNum: 896,
        isAvailable: false
    ),
    Book(
        name: "Убийство в Восточном экспрессе",
        author: "Агата Кристи",
        genre: .Detective,
        publishDate: Calendar.current.date(from: DateComponents(year: 1934, month: 1, day: 1))!,
        pageNum: 256,
        isAvailable: true
    ),
    Book(
        name: "Анна Каренина",
        author: "Лев Толстой",
        genre: .Classical,
        publishDate: Calendar.current.date(from: DateComponents(year: 1877, month: 1, day: 1))!,
        pageNum: 864,
        isAvailable: true
    ),
    Book(
        name: "Thinking, Fast and Slow",
        author: "Дэниел Канеман",
        genre: .NonFiction,
        publishDate: Calendar.current.date(from: DateComponents(year: 2011, month: 10, day: 25))!,
        pageNum: 499,
        isAvailable: false
    ),
    Book(
        name: "Властелин Колец: Братство Кольца",
        author: "Дж. Р. Р. Толкин",
        genre: .Fantasy,
        publishDate: Calendar.current.date(from: DateComponents(year: 1954, month: 7, day: 29))!,
        pageNum: 423,
        isAvailable: true
    ),
    Book(
        name: "Идиот",
        author: "Фёдор Достоевский",
        genre: .Classical,
        publishDate: Calendar.current.date(from: DateComponents(year: 1869, month: 1, day: 1))!,
        pageNum: 640,
        isAvailable: true
    )
]

func findBook(_ array: [Book], byName name: String) -> Book? {
    for book in array {
        if book.name == name  {
            return book
        }
    }
    
    return nil
}

func findBook(_ array: [Book], byAuthor author: String) -> Book? {
    for book in array {
        if book.author == author  {
            return book
        }
    }
    
    return nil
}
