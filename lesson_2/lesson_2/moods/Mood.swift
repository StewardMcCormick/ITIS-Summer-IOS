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

class Mood: Identifiable, Hashable {
    var id: Int = 0
    var type: MoodType
    var timestamp: Date
    var description: String {
        return type.moodDescription
    }
    var comment = ""
    
    init(type: MoodType) {
        self.type = type
        self.timestamp = Date()
    }
    
    convenience init(type: MoodType, comment: String) {
        self.init(type: type)
        self.comment = comment
    }
    
    convenience init(id: Int, type: MoodType) {
        self.init(type: type)
        self.id = id
    }
    
    convenience init(id: Int, type: MoodType, comment: String) {
        self.init(type: type, comment: comment)
        self.id = id
    }
    
    func stringTimestamp() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: timestamp)
    }
    
    static func == (lhs: Mood, rhs: Mood) -> Bool {
        lhs.id == rhs.id && lhs.type == rhs.type && lhs.timestamp == rhs.timestamp && lhs.comment == rhs.comment
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(type)
        hasher.combine(timestamp)
        hasher.combine(comment)
    }
}
