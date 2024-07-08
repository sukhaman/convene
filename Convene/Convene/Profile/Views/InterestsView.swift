//
//  InterestsView.swift
//  Convene
//
//  Created by Sukhaman Singh on 7/5/24.
//

import SwiftUI

struct InterestsView: View {
    var profile: Profile
    var body: some View {
        VStack {
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
    InterestsView(profile: Profile(
        name: "Jack Daniels",
        age: 27,
        bio: "Composer, musician, Italian cuisine lover, wanna find a buddy to attend events!",
        interests: [
            Interest(name: "Gig", isSelected: true, icon: "music.note"),
            Interest(name: "Workshop", isSelected: true, icon: "hammer"),
            Interest(name: "Café", isSelected: true, icon: "fork.knife"),
            Interest(name: "National Cuisine", isSelected: true, icon: "globe"),
            Interest(name: "Observatory", isSelected: true, icon: "megaphone"),
            Interest(name: "Science Museum", isSelected: true, icon: "book"),
            Interest(name: "Workshop", isSelected: true, icon: "hammer"),
            Interest(name: "Café", isSelected: true, icon: "fork.knife"),
            Interest(name: "National Cuisine", isSelected: true, icon: "globe")
        ],
        events: [
            Event(name: "Music Concert", date: "2024-07-18", time: "03:00", duration: "5 Hours", location: "", guests: [], createdBy: User(name: "Steve Smith", image: "profile_pic")),
            Event(name: "Art Workshop", date: "2024-07-15", time: "03:00", duration: "5 Hours", location: "", guests: [], createdBy: User(name: "Steve Smith", image: "profile_pic")),
            Event(name: "Food Festival", date: "2024-07-18", time: "03:00", duration: "5 Hours", location: "", guests: [], createdBy: User(name: "Steve Smith", image: "profile_pic"))
               ]
    ))
}
