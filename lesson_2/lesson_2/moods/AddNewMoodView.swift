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
        NavigationStack {
            Form {
                Section("Настроение") {
                    Picker("Выберите", selection: $mood.type) {
                        ForEach(MoodType.allCases, id: \.self) { type in
                            Text(type.rawValue).tag(type)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Комментарий") {
                    TextEditor(text: $mood.comment)
                        .frame(minHeight: 100)
                }
            }
            .navigationTitle("Добавление чувств🪄")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Сохранить") {
                        moodModel.addMood(mood: mood)
                        dismiss()
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Отмена") {
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    AddNewMoodView()
        .environment(MoodListViewModel.getTestList())
}
