//
//  ContentView.swift
//  lesson_2
//
//  Created by Егор Бессонов on 01.07.2026.
//

import SwiftUI

struct ContentView: View {
    
    @State private var moodListViewModel = MoodListViewModel()
    
    var body: some View {
        if moodListViewModel.isNamed {
            MoodView()
                .environment(moodListViewModel)
        } else {
            GreetingView()
                .environment(moodListViewModel)
        }
    }
}

#Preview {
    ContentView()
}
