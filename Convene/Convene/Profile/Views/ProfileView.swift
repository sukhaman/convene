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
    var events: [Event]
}

struct User: Codable {
    var id = UUID()
    var name: String
    var image: String
}

struct Interest: Identifiable {
    let id = UUID()
    let name: String
    var isSelected: Bool
    var icon: String
}

struct Event: Identifiable {
    var id:UUID? = nil
    var url: String? = nil
    var name: String
    var description: String?
    var date: String
    var time: String
    var duration: String
    var location: String
    var guests: [Guest]
    var createdBy: User
    var equipments: [Equipment]? = nil
}

struct Equipment: Identifiable {
    var id: UUID?
    var name: String
}

struct Guest: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
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
    )
    let segments = ["About Me","Interests", "Events"]
    @State private var isEditing = false
    @State private var selectedSegment = 0
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    Image("profile_pic")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 200)
                        .clipped()
                    
                    
                    VStack {

                        SegmentInfoView(segments: ["About Me","Interests", "Events"], selectedSegment: $selectedSegment) // Adjust height as needed

                        if selectedSegment == 0 {
                                AboutMeView(profile: profile)
                        } else if selectedSegment == 1 {
                            InterestsView(profile: profile)
                        } else if selectedSegment == 2 {
                            ProfileEventView(events: profile.events)
                        }
                        
                        Spacer()
                    }
                }
                .navigationBarTitle("Profile", displayMode: .inline)
            }
        }
    }
}

#Preview {
    ProfileView()
}
