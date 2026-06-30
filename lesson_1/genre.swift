//
//  genre.swift
//  itis-summer-ios
//
//  Created by Егор Бессонов on 30.06.2026.
//


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
