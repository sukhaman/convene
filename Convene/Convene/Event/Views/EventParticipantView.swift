//
//  EventParticipantView.swift
//  Convene
//
//  Created by Sukhaman Singh on 7/7/24.
//

import SwiftUI

struct EventParticipantView: View {
    @State var event: Event
    var body: some View {
        HStack {
            ForEach(event.guests, id: \.id) { guest in
                VStack(spacing:10) {
                Image(guest.imageName)
                    .resizable()
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
                Text(guest.name)
            }
                    }
                }
    }
}

#Preview {
    EventParticipantView(event: Event(url:"austin-neill-hgO1wFPXl3I-unsplash",name: "Music Concert",description: "So just what is an event description? In a nutshell, it’s a piece of copy that tells people the basic information they need to know to decide whether or not they want to attend the event. It should always include the 5 W’s (who, what, when, where, and why) and, if necessary, an H for how.", date: "2024-07-18", time: "03:00", duration: "5 Hours", location: "", guests: [Guest(name: "First", imageName: "profile_pic")], createdBy: User(name: "Steve Smith", image: "profile_pic")))
}
