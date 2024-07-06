//
//  EventGuestView.swift
//  Convene
//
//  Created by Sukhaman Singh on 7/6/24.
//

import SwiftUI

struct EventGuestView: View {
    let guest: Guest
        let onRemove: () -> Void

        var body: some View {
            ZStack(alignment: .topLeading) {
                Image(guest.imageName)
                    .resizable()
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())

                Button(action: onRemove) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.red)
                        .background(Color.white)
                        .clipShape(Circle())
                }
                .offset(x: 50, y: -10)
            }
        }
}

#Preview {
    EventGuestView(guest: Guest(name: "Test", imageName: "profile_pic"), onRemove: {})
}
