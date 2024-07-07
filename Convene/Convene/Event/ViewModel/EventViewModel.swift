//
//  EventViewModel.swift
//  Convene
//
//  Created by Sukhaman Singh on 7/5/24.
//

import Foundation

class EventViewModel: ObservableObject {
    @Published var event: Event
    @Published var hours: Int = 0
    @Published var minutes: Int = 0
    @Published var guests: [Guest] = [
           Guest(name: "Alice", imageName: "profile_pic"),
           Guest(name: "Bob", imageName: "profile_pic"),
           Guest(name: "Charlie", imageName: "profile_pic")
       ]
    @Published var events: [Event] = [
        Event(url:"austin-neill-hgO1wFPXl3I-unsplash",name: "Music Concert", date: "2024-07-18", time: "03:00", duration: "5 Hours", location: "", guests: [], createdBy: User(name: "Steve Smith", image: "profile_pic")),
        Event(url:"debby-hudson-3q05_K3eJxM-unsplash",name: "Art Workshop", date: "2024-07-15", time: "03:00", duration: "5 Hours", location: "", guests: [], createdBy: User(name: "Steve Smith", image: "profile_pic")),
        Event(url:"stefano-girardelli-qUnLMCQjv2k-unsplash",name: "Food Festival", date: "2024-07-18", time: "03:00", duration: "5 Hours", location: "", guests: [], createdBy: User(name: "Steve Smith", image: "profile_pic"))
           ]
       func removeGuest(at index: Int) {
           guests.remove(at: index)
       }
    var duration: String {
           return "\(hours) hours and \(minutes) minutes"
    }
    var date: String {
        return event.date
    }
    var time: String {
        return event.time
    }
    init(event: Event = Event(name: "", date: "", time: "", duration: "", location: "", guests: [], createdBy: User(name: "Steve Smith", image: "profile_pic"))) {
            self.event = event
        }
        
        func addOrUpdateEvent() {
            // Logic to add or update event
            // For example, save to a database or update an existing record
        }
}
