//
//  MainView.swift
//  lesson_2
//
//  Created by Егор Бессонов on 01.07.2026.
//

import SwiftUI

struct MoodView: View {
    
    @Environment(MoodListViewModel.self) private var moodListViewModel
    @State private var isAddingMood: Bool = false
    
    var body: some View {
        VStack {
            Text("Привет, \(moodListViewModel.username)!")
                .padding()
                .font(.largeTitle)
            Text("Вот, как менялось твое настроение :)")
                .font(.title)
                    
            PrimaryButton(title: "Добавить запись") {
                isAddingMood = true
            }
            .padding([.leading, .trailing], 50)
            
            Spacer()
            
            List {
                ForEach(moodListViewModel.moodsHistory.reversed(), id: \.id) { mood in
                    MoodListRow(mood: mood)
                }
                .onDelete { indexSet in
                    if let idx = indexSet.first {
                        moodListViewModel.deleteMood(idx)
                    }
                }
            }
            
            .padding()
            .listStyle(.plain)
        }
        .sheet(isPresented: $isAddingMood) {
            AddNewMoodView()
                .environment(moodListViewModel)
        }
    }
}
