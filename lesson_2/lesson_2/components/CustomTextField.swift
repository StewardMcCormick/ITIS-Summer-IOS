//
//  CustomTextField.swift
//  lesson_2
//
//  Created by Егор Бессонов on 30.06.2026.
//

import SwiftUI

struct CustomTextField: View {
    let placeholder: String
    @Binding var username: String
    
    var body: some View {
        TextField(placeholder, text: $username)
            .padding()
            .frame(maxWidth: .maximum(500, 500))
            .background(Color(.systemGray6))
            .clipShape(RoundedRectangle(cornerRadius: 9))
            .multilineTextAlignment(.center)
    }
}
