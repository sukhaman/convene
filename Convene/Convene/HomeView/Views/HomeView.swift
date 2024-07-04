//
//  HomeView.swift
//  Convene
//
//  Created by Sukhaman Singh on 7/4/24.
//

import SwiftUI


struct HomeView: View {
    let threads = [
            Post(username: "Gimmy Nathan Jr.", time: "23 min ago", message: "What makes you stop taking risks? I’m always afraid of the consequences of my actions.", replies: 192)
        ]
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("Trending Events")
                    .font(.title)
                    .padding(.horizontal)
                
                ForEach(threads) { thread in
                                    PostView(post: thread)
                                        .padding(.horizontal)
                                }
            }
        }
    }
}

#Preview {
    HomeView()
}
