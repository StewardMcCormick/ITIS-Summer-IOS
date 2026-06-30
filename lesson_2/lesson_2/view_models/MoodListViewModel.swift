//
//  MoodListViewModel.swift
//  lesson_2
//
//  Created by Егор Бессонов on 30.06.2026.
//

import SwiftUI

@Observable
class MoodListViewModel {
    
    var username: String = ""
    var moodsHistory: [Mood] = []
    var isNamed: Bool = false
    
    func name(_ name: String) {
        if name.isEmpty {
            isNamed = false
            return
        }
        
        username = name
        isNamed = true
    }
    
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
