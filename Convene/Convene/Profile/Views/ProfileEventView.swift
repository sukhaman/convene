//
//  ProfileEventView.swift
//  Convene
//
//  Created by Sukhaman Singh on 7/5/24.
//

import SwiftUI

struct ProfileEventView: View {
    let events: [Event]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ForEach(events) { event in
                    HStack {
                        Text(event.name)
                            .bold()
                        Spacer()
                        Text(event.date)
                            .foregroundColor(.gray)
                    }
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                }
            }
            .padding()
        }
    }
}

#Preview {
    ProfileEventView(events: [
        Event(name: "Music Concert", date: "2024-07-18", time: "03:00", duration: "5 Hours", location: "", guests: [], createdBy: User(name: "Steve Smith", image: "profile_pic")),
        Event(name: "Art Workshop", date: "2024-07-15", time: "03:00", duration: "5 Hours", location: "", guests: [], createdBy: User(name: "Steve Smith", image: "profile_pic")),
        Event(name: "Food Festival", date: "2024-07-18", time: "03:00", duration: "5 Hours", location: "", guests: [], createdBy: User(name: "Steve Smith", image: "profile_pic"))
           ])
}
