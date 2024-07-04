//
//  HomeView.swift
//  Convene
//
//  Created by Sukhaman Singh on 7/4/24.
//

import SwiftUI


struct HomeView: View {
   
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("Trending Events")
                    .font(.title)
                    .padding(.horizontal)
                
            }
        }
    }
}

#Preview {
    HomeView()
}
