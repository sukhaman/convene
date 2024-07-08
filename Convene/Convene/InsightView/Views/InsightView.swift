//
//  InsightView.swift
//  Convene
//
//  Created by Sukhaman Singh on 7/4/24.
//

import SwiftUI


struct InsightView: View {
    let threads = [
            Post(username: "Steven Smith", time: "23 min ago", message: "What makes you stop taking risks? I’m always afraid of the consequences of my actions.", replies: 192)
        ]
    @State private var isShowingDetailView = false
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    Text("Insights")
                        .font(.title)
                        .padding(.horizontal)
                    
                    ForEach(threads) { thread in
                        PostView(post: thread)
                            .padding(.horizontal)
                    }
                }
            }
            .navigationBarItems(trailing: Button(action: {
                            self.isShowingDetailView = true
                        }) {
                            Image(systemName: "plus")
                        })
            .navigationDestination(isPresented: $isShowingDetailView) {
                        CreateEventView(viewModel: EventViewModel())
                        }
        }
    }
}

#Preview {
    InsightView()
}
