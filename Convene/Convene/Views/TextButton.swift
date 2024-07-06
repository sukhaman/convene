//
//  TextButton.swift
//  Convene
//
//  Created by Sukhaman Singh on 7/4/24.
//

import SwiftUI

struct TextButton: View {
    @State var title: String
    var foregroundColor: Color
    var action: () -> Void
    var body: some View {
        Button(action: action) {
                        Text(title)
                        .foregroundColor(foregroundColor)
                        .padding()
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .shadow(color: Color.gray.opacity(0.5), radius: 5, x: 0, y: 2)
                }
    }
}

#Preview {
    TextButton(title: "Save", foregroundColor: .black, action: {})
}
