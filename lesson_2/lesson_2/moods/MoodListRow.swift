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
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                Text(mood.type.rawValue)
                    .font(.largeTitle)
                Spacer()
                Text(mood.description)
                    .font(.headline)
            }
            Text(mood.stringTimestamp())
                .font(.caption2)
                .foregroundColor(.secondary)
        }
    }
}
