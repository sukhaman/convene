//
//  ButtonWithTextImage.swift
//  Convene
//
//  Created by Sukhaman Singh on 7/4/24.
//

import SwiftUI

struct ButtonWithTextImage: View {
    @State var image: Image
    @State var text: String
    var imageColor: Color
    var textColor: Color
    var action: () -> Void
    var body: some View {
        HStack {
        Button(action: action) {
            image
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundColor(imageColor)
               
            Text(text)
                .foregroundStyle(textColor)
                .font(.headline)
        }
    }
        .padding()
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius:25))
        .shadow(color: Color.gray.opacity(0.5), radius: 5, x: 0, y: 2)
        
    }
}

#Preview {
    ButtonWithTextImage(image: Image(systemName: "message.badge.waveform"),text: "Text",imageColor: .red,textColor: .black, action: {})
}
