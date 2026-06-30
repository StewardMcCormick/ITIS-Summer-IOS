//
//  MoodListRow.swift
//  lesson_2
//
//  Created by Егор Бессонов on 01.07.2026.
//

import SwiftUI

struct MoodListRow: View {
    let mood: Mood
    
    var body: some View {
        HStack {
            Text(mood.emoji)
            
            Text(mood.type.rawValue)
            
            Spacer()
            
            Text(mood.stringTimestamp())
        }
    }
}
