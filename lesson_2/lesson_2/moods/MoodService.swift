//
//  MoodService.swift
//  lesson_2
//
//  Created by Егор Бессонов on 01.07.2026.
//

import Foundation

@Observable
class MoodService {
    var moods: [Mood] = []
    
    func fetchMoods() async throws -> [Mood] {
        try await Task.sleep(nanoseconds: 1_500_000_000)
        
        if moods.isEmpty {
            moods = [
                Mood(id: 0, type: .Happy, comment: "happy"),
                Mood(id: 1, type: .Normal),
                Mood(id: 2, type: .Sad),
                Mood(id: 3, type: .Sad, comment: "Sad")
            ]
        }
        return moods
    }
    
    func addMood(_ mood: Mood) {
        moods.append(mood)
    }
    
    func deleteMood(withId id: Int) {
        moods.removeAll { $0.id == id }
    }
}
