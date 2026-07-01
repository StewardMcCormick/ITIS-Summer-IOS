//
//  MoodPicker.swift
//  lesson_2
//
//  Created by Егор Бессонов on 01.07.2026.
//

import SwiftUI

struct MoodPicker: View {
    @Binding var mood: Mood
    @State private var selectedOption: MoodType = .Happy
    
    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 15) {
                ForEach(MoodType.allCases, id: \.self) { option in
                    Button(action: {
                        selectedOption = option
                        mood.type = option
                    }) {
                        Text(option.rawValue)
                            .padding()
                            .background(selectedOption == option ? Color.blue : Color(.systemGray6))
                            .foregroundColor(.white)
                            .cornerRadius(40)
                    }
                    .font(.system(size: 50))
                    .buttonStyle(.plain)
                }
            }
        }
        .padding()
    }
}
