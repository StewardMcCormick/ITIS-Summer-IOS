//
//  MoodListViewModel.swift
//  lesson_2
//
//  Created by Егор Бессонов on 30.06.2026.
//

import SwiftUI

@Observable
class MoodListViewModel {
    
    private var lastId: Int = 0
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
        lastId += 1
        mood.id = lastId
        moodsHistory.append(mood)
    }
    
    func deleteMood(_ idx: Int) {
        guard idx < moodsHistory.count else { return }
        moodsHistory.remove(at: idx)
    }
    
    static func getTestList() -> MoodListViewModel {
        let model = MoodListViewModel()
        
        model.addMood(mood: Mood(type: .Happy, comment: "happy"))
        model.addMood(mood: Mood(type: .Normal))
        model.addMood(mood: Mood(type: .Sad))
        model.addMood(mood: Mood(type: .Sad, comment: "Sad"))
        
        return model
    }
}
