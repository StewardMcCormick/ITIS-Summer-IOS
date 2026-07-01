//
//  MoodDetailsCard.swift
//  lesson_2
//
//  Created by Егор Бессонов on 01.07.2026.
//

import SwiftUI

struct MoodDetailsCard: View {
    
    @Environment(\.dismiss) private var dismiss
    @Binding var mood: Mood
    
    var body: some View {
        SectionCard {
            VStack {
                Text("Описание чувства")
                    .padding()
                    .font(.largeTitle)
                
                HStack {
                    Text("\(mood.type.rawValue)")
                        .font(.title)
                    
                    Text("\(mood.description)")
                        .font(.title)
                }
                
                Spacer()
                
                Text("Комментарий:")
                    .font(.title2)
                
                Text("\(mood.comment)")
                
                Spacer()
            }
            
            PrimaryButton(title: "Закрыть") {
                dismiss()
            }
        }
    }
}
