//
//  SectionCard.swift
//  lesson_2
//
//  Created by Егор Бессонов on 01.07.2026.
//

import SwiftUI

struct SectionCard<Content: View>: View {
    
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        VStack {
            content
        }
        .padding()
        .frame(minWidth: 200, minHeight: 80)
        .background(
            RoundedRectangle(cornerRadius: 9)
                .fill(Color(.white))
        )
    }
}
