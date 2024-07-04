//
//  CustomButton.swift
//  Convene
//
//  Created by Sukhaman Singh on 7/4/24.
//

import SwiftUI

struct ButtonWithImage: View {
    @State var image: Image
    var foregroundColor: Color
    var action: () -> Void
    var body: some View {
        Button(action: action) {
                        image
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundColor(foregroundColor)
                        .padding()
                        .background(Color.white)
                        .clipShape(Circle())
                        .shadow(color: Color.gray.opacity(0.5), radius: 5, x: 0, y: 2)
                }
    }
}

#Preview {
    ButtonWithImage(image: Image(systemName: "hand.thumbsdown"),foregroundColor: .red, action: {})
}
