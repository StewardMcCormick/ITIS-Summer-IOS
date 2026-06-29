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
        print("Доступность: \(isAvailable ? "доступна" : "недоступна")\n")
    }
    
    mutating func issue() -> Void {
        guard isAvailable else {
            print("Книга '\(name)' недоступна")
            return
        }
        
        isAvailable = false
        print("Книга '\(name)' успешно выдана")
    }
}

class Library {
    var books: [Book]
    
    init(books: [Book]) {
        self.books = books
    }
    
    func findBook(byName name: String) -> Book? {
        return books.first{ $0.name == name }
    }
    
    func findBook(byAuthor author: String) -> [Book] {
        return books.filter{ $0.author == author }
    }
    
    func issueBook(id: Int) -> Void {
        if (id > books.count - 1 || id < 0) {
            print("Книги с таким индексом не существует")
            return
        }
        
        books[id].issue()
    }
    
    func getBooksByGenre(genre: String) -> [Book] {
        return books.filter{ $0.genre.rawValue.lowercased() == genre.lowercased() }
    }
    
    func getBooksByGenre(genre: Genre) -> [Book] {
        return books.filter{ $0.genre == genre }
    }
    
    func printAllBooks() -> Void {
        books.forEach{ $0.PrintInfo() }
    }
    
    func getSortedBooksListByPageNum(decrease: Bool) -> [Book] {
        guard decrease else {
            return books.sorted { $0.pageNum < $1.pageNum }
        }
        
        return books.sorted { $1.pageNum < $0.pageNum }
    }
    
    func getAllBooksNames() -> [String] {
        return books.map { $0.name }
    }
    
    func getTotalPageNum() -> UInt64 {
        var sum: UInt64 = 0
        books.forEach { sum += UInt64($0.pageNum) }
        return sum
    }
    
    static func createTestLibrary() -> Library {
        return Library(books: [
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
        ])
    }
}

extension Library {
    func getTop3VolumesBooks() -> [Book] {
        let sortedBooks = self.getSortedBooksListByPageNum(decrease: true)
        if sortedBooks.count <= 3 {
            return sortedBooks
        }
        
        return Array(sortedBooks.prefix(3))
    }
}

let library: Library = Library.createTestLibrary()

print(library.getAllBooksNames())

print(library.getTotalPageNum())

print(library.getTop3VolumesBooks())
