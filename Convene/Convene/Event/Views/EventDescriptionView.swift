//
//  EventDescriptionView.swift
//  Convene
//
//  Created by Sukhaman Singh on 7/7/24.
//

import SwiftUI

struct EventDescriptionView: View {
    var event: Event
    var body: some View {
        VStack {
            if let eventDescription = event.description {
                Text(eventDescription)
                    .fontWeight(.regular)
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: true) // Adjust height based on content
            }
        }
    }
}

#Preview {
    EventDescriptionView(event: Event(url:"austin-neill-hgO1wFPXl3I-unsplash",name: "Music Concert",description: "So just what is an event description? In a nutshell, it’s a piece of copy that tells people the basic information they need to know to decide whether or not they want to attend the event. It should always include the 5 W’s (who, what, when, where, and why) and, if necessary, an H for how.", date: "2024-07-18", time: "03:00", duration: "5 Hours", location: "", guests: [], createdBy: User(name: "Steve Smith", image: "profile_pic")))
}
