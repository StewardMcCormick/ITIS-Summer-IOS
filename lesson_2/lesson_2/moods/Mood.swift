//
//  Mood.swift
//  lesson_2
//
//  Created by Егор Бессонов on 30.06.2026.
//

import Foundation

enum MoodType: String {
    case Happy = "Я счастлив"
    case Normal = "Чувствую себя нормально"
    case Sab = "Мне грустно("
}

class Mood: Equatable {
    var id: Int = 0
    let type: MoodType
    let emoji: String
    var timestamp: Date
    var description = ""
    
    init(type: MoodType) {
        self.type = type
        
        switch type {
        case .Happy:
            self.emoji = "😊"
        case .Normal:
            self.emoji = "😐"
        case .Sab:
            self.emoji = "😔"
        }
        
        timestamp = Date()
    }
    
    convenience init(type: MoodType, description: String) {
        self.init(type: type)
        
        self.description = description
    }
    
    func stringTimestamp() -> String {
        timestamp.formatted()
    }
    
    static func == (o1: Mood, o2: Mood) -> Bool {
        return o1.description == o2.description && o1.type == o2.type && o1.timestamp == o2.timestamp
    }
}
