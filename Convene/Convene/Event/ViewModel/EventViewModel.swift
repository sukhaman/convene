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
        init(event: Event = Event(name: "", date: "", time: "", duration: "", location: "", guests: [])) {
            self.event = event
        }
        
        func addOrUpdateEvent() {
            // Logic to add or update event
            // For example, save to a database or update an existing record
        }
}
