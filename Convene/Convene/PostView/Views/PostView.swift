//
//  PostView.swift
//  Convene
//
//  Created by Sukhaman Singh on 7/4/24.
//

import SwiftUI

struct Post: Identifiable {
    let id = UUID()
    let username: String
    let time: String
    let message: String
    let replies: Int
}

struct PostView: View {
    let post: Post
    var body: some View {
       
        VStack(alignment: .leading) {
            HStack {
                // Replace "profile_image" with the actual profile image
                CustomButton(image: Image(systemName: "person.circle"), foregroundColor: .mint, action: {
                    print("Show profile screen")
                })
                    .frame(width: 50, height: 50)
                    .padding(.trailing,10)
                VStack(alignment: .leading) {
                    Text(post.username)
                        .font(.headline)
                    Text(post.time)
                        .font(.subheadline)
                }
                Spacer()
                Image(systemName: "flame.fill")
                    .foregroundColor(.red)
            }
            Text(post.message)
                .font(.body)
                .padding(.vertical, 5)
            HStack {
                CustomButton(image: Image(systemName: "hand.thumbsup"),foregroundColor: .black) {
                    print("Post liked")
                }
                CustomButton(image: Image(systemName: "hand.thumbsdown"),foregroundColor: .red) {
                    print("Post disliked")
                }
                Spacer()
                ButtonWithTextImage(image: Image(systemName: "message.badge.waveform"),text: "\(post.replies) Replies", imageColor: .purple, textColor: .black) {
                    print("Show replies")
                }
            }
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(10)
    }
}

#Preview {
    PostView(post: Post(username: "Freeman", time: " 23 mins ago", message: "You are what you do. What makes you stop taking risks? I'm always afraid of the consequences of my actions.", replies: 124))
}
