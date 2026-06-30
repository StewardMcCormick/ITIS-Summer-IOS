//
//  GreetingView.swift
//  lesson_2
//
//  Created by Егор Бессонов on 30.06.2026.
//

import SwiftUI

struct GreetingView: View {
    
    @Environment(MoodListViewModel.self) private var moodViewModel
    @AppStorage("storedUsername") private var username = ""
    
    var body: some View {
        
        VStack(spacing: 20) {
            Text("Привет! Введи свое имя")
                .font(.largeTitle)
            
            CustomTextField(placeholder: "Введите имя", username: $username)
                .padding([.leading, .trailing], 30)
                .padding(.top, 5)
            
            PrimaryButton(title: "Начать") {
                moodViewModel.name(username)
            }
            .padding([.leading, .trailing], 30)
        }
        
    }
}

//#Preview {
//    GreetingView()
//}
