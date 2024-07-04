//
//  PostView.swift
//  Convene
//
//  Created by Sukhaman Singh on 7/4/24.
//

import SwiftUI

struct Thread: Identifiable {
    let id = UUID()
    let username: String
    let time: String
    let message: String
    let replies: Int
}

struct PostView: View {
    let thread: Thread
    var body: some View {
       
        VStack(alignment: .leading) {
            HStack {
                // Replace "profile_image" with the actual profile image
                Image("profile_image")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                VStack(alignment: .leading) {
                    Text(thread.username)
                        .font(.headline)
                    Text(thread.time)
                        .font(.subheadline)
                }
                Spacer()
                Image(systemName: "flame.fill")
                    .foregroundColor(.red)
            }
            Text(thread.message)
                .font(.body)
                .padding(.vertical, 5)
            HStack {
                Button(action: {}) {
                    Image(systemName: "hand.thumbsup")
                }
                Button(action: {}) {
                    Image(systemName: "hand.thumbsdown")
                }
                Spacer()
                Text("\(thread.replies) Replies")
            }
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(10)
    }
}

#Preview {
    PostView(thread: Thread(username: "Freeman", time: " 23 mins ago", message: "You are what you do. What makes you stop taking risks? I'm always afraid of the consequences of my actions.", replies: 124))
}
