//
//  AboutMeView.swift
//  Convene
//
//  Created by Sukhaman Singh on 7/5/24.
//

import SwiftUI

struct AboutMeView: View {
    var profile: Profile
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            Text("\(profile.name), \(profile.age)")
                .font(.title)
                .bold()
            
            Text(profile.bio)
                .font(.subheadline)
                .padding(.top, 5)
            .padding()
        }
    }
}

#Preview {
    AboutMeView(profile: Profile(
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
