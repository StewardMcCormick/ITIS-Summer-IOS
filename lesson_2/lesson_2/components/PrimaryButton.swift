//
//  PrimaryButton.swift
//  lesson_2
//
//  Created by Егор Бессонов on 30.06.2026.
//

import SwiftUI

struct PrimaryButton: View {
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(title, action: action)
            .padding()
            .frame(maxWidth: .maximum(500, 500))
            .background(.blue)
            .foregroundStyle(.white)
            .clipShape(RoundedRectangle(cornerRadius: 9))
    }
}
