//
//  PostViewModel.swift
//  Convene
//
//  Created by Sukhaman Singh on 7/7/24.
//

import Foundation

class PostViewModel: ObservableObject {
    @Published var post: Post
    @Published var posts: [Post] = []
    init(post: Post = Post(username: "Freeman", time: " 23 mins ago", message: "You are what you do. What makes you stop taking risks? I'm always afraid of the consequences of my actions.", replies: 124)) {
        self.post = post
        posts = addPosts()
    }
        
        func addOrUpdateEvent() {
            // Logic to add or update event
            // For example, save to a database or update an existing record
        }
    
    private func addPosts() -> [Post] {
        return [
            Post(username: "Greg", time: "23 mins ago", message: "Well there we go again", replies: 0),
            Post(username: "Peter", time: "23 mins ago", message: "Well said", replies: 0),
            Post(username: "Mark", time: "23 mins ago", message: "Well there we go again", replies: 0),
            Post(username: "Jack", time: "23 mins ago", message: "Well there we go again", replies: 0)
        ]
    }
}
