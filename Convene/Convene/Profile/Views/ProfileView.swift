//
//  ProfileView.swift
//  Convene
//
//  Created by Sukhaman Singh on 7/4/24.
//

import SwiftUI

struct Profile {
    var name: String
    var age: Int
    var bio: String
    var interests: [Interest]
}

struct Interest: Identifiable {
    let id = UUID()
    let name: String
    var isSelected: Bool
    var icon: String
}


struct ProfileView: View {
    @State private var profile = Profile(
        name: "Jack Daniels",
        age: 27,
        bio: "Composer, musician, Italian cuisine lover, wanna find a buddy to attend events!",
        interests: [
            Interest(name: "Gig", isSelected: true, icon: "music.note"),
            Interest(name: "Workshop", isSelected: true, icon: "hammer"),
            Interest(name: "Café", isSelected: true, icon: "fork.knife"),
            Interest(name: "National Cuisine", isSelected: true, icon: "globe"),
            Interest(name: "Observatory", isSelected: true, icon: "telescope"),
            Interest(name: "Science Museum", isSelected: true, icon: "book"),
            Interest(name: "Workshop", isSelected: true, icon: "hammer"),
            Interest(name: "Café", isSelected: true, icon: "fork.knife"),
            Interest(name: "National Cuisine", isSelected: true, icon: "globe"),
            Interest(name: "Observatory", isSelected: true, icon: "telescope"),
            Interest(name: "Science Museum", isSelected: true, icon: "book"),
            Interest(name: "Workshop", isSelected: true, icon: "hammer"),
            Interest(name: "Café", isSelected: true, icon: "fork.knife"),
            Interest(name: "National Cuisine", isSelected: true, icon: "globe"),
            Interest(name: "Observatory", isSelected: true, icon: "telescope"),
            Interest(name: "Science Museum", isSelected: true, icon: "book"),
            Interest(name: "Workshop", isSelected: true, icon: "hammer"),
            Interest(name: "Café", isSelected: true, icon: "fork.knife"),
            Interest(name: "National Cuisine", isSelected: true, icon: "globe"),
            Interest(name: "Observatory", isSelected: true, icon: "telescope"),
            Interest(name: "Science Museum", isSelected: true, icon: "book")
        ]
    )
    
    @State private var isEditing = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    Image("profile_pic")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 200)
                        .clipped()
                        .cornerRadius(10)
                    
                    Text("\(profile.name), \(profile.age)")
                        .font(.title)
                        .bold()
                    
                    Text(profile.bio)
                        .font(.subheadline)
                        .padding(.top, 5)
                    InterestView(profile: profile)

                }
                .navigationBarTitle("Profile", displayMode: .inline)
            }
        }
    }
}

struct InterestView: View {
    var profile: Profile
    var body: some View {
        VStack {
            Text("Interests")
                .font(.headline)
                .padding(.top, 10)
            
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 100), spacing: 10)], spacing: 10) {
                ForEach(profile.interests.filter { $0.isSelected }) { interest in
                    HStack {
                        Image(systemName: interest.icon)
                        Text(interest.name)
                    }
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                }
            }
        }
    }
}

#Preview {
    ProfileView()
}
