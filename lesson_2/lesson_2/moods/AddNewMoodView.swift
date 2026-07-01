//
//  AddNewMoodView.swift
//  lesson_2
//
//  Created by Егор Бессонов on 01.07.2026.
//

import SwiftUI

struct AddNewMoodView: View {
    
    @Environment(\.dismiss) private var dismiss
    @Environment(MoodListViewModel.self) private var moodModel
    @State private var mood: Mood = Mood(type: .Happy)
    
    var body: some View {
        VStack {
            Text("Добавление чувств🪄")
                .padding()
                .font(.title)
                .fontWeight(.bold)
            
            MoodPicker(mood: $mood)
                .padding(.bottom, 50)
                        
            TextEditor(text: $mood.comment)
                            .padding(8)
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(8)
                            .frame(height: 150)
         
            Spacer()
            
            Button("Сохранить") {
                moodModel.addMood(mood: mood)
                dismiss()
            }
        }
    }
}
