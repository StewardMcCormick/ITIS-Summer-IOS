//
//  MoodListRow.swift
//  lesson_2
//
//  Created by Егор Бессонов on 01.07.2026.
//

import SwiftUI

struct MoodListRow: View {
    
    @State var mood: Mood
    @State private var isPresent: Bool = false
    
    var body: some View {
        HStack {
            Text(mood.type.rawValue)
            
            Text(mood.description)
            
            Spacer()
            
            Text(mood.stringTimestamp())
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .contentShape(Rectangle())
        .onTapGesture {
            isPresent = true
        }
        .sheet(isPresented: $isPresent) {
            MoodDetailsCard(mood: $mood)
        }
    }
}
