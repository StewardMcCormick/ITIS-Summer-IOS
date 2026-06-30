//
//  MoodListViewModel.swift
//  lesson_2
//
//  Created by Егор Бессонов on 30.06.2026.
//

import Foundation

@Observable
class MoodListViewModel {
    var moodsHistory: [Mood] = []
    
    func addMood(mood: Mood) {
        moodsHistory.append(mood)
    }
    
    func deleteMood(mood: Mood) {
        for (idx, m) in moodsHistory.enumerated() {
            if mood == m {
                moodsHistory.remove(at: idx)
                break
            }
        }
    }
}
