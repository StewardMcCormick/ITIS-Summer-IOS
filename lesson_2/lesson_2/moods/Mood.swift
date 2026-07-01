//
//  Mood.swift
//  lesson_2
//
//  Created by Егор Бессонов on 30.06.2026.
//

import Foundation

enum MoodType: String, CaseIterable {
    case Happy = "😊"
    case Normal = "😐"
    case Sad = "😔"
    
    var moodDescription: String {
        switch self {
        case .Happy:
            return "Я счастлив"
        case .Normal:
            return "Чувствую себя нормально"
        case .Sad:
            return "Мне грустно("
        }
    }
    
    static func fromEmoji(_ e: String) -> MoodType? {
        MoodType(rawValue: e)
    }
}

class Mood: Equatable {
    var id: Int = 0
    var type: MoodType
    var timestamp: Date
    var description: String {
        return type.moodDescription
    }
    var comment = ""
    
    init(type: MoodType) {
        self.type = type
        timestamp = Date()
    }
    
    convenience init(type: MoodType, comment: String) {
        self.init(type: type)
        self.comment = comment
    }
    
    func stringTimestamp() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: timestamp)
    }
    
    static func == (o1: Mood, o2: Mood) -> Bool {
        return o1.description == o2.description &&
               o1.comment == o2.comment &&
               o1.type == o2.type &&
               o1.timestamp == o2.timestamp
    }
}
