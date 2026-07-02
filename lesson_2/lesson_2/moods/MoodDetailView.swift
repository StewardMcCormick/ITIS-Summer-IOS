//
//  MoodDetailView.swift
//  lesson_2
//
//  Created by Егор Бессонов on 01.07.2026.
//

import SwiftUI

struct MoodDetailView: View {
    let mood: Mood
    
    var body: some View {
        VStack(spacing: 20) {
            Text(mood.type.rawValue)
                .font(.system(size: 80))
            Text(mood.description)
                .font(.title2)
            if !mood.comment.isEmpty {
                Text("Комментарий: \(mood.comment)")
                    .font(.body)
                    .foregroundColor(.secondary)
            }
            Text(mood.stringTimestamp())
                .font(.caption)
            Spacer()
        }
        .padding()
        .navigationTitle("Детали")
    }
}
