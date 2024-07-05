//
//  EventViewModel.swift
//  Convene
//
//  Created by Sukhaman Singh on 7/5/24.
//

import Foundation

class EventViewModel: ObservableObject {
    @Published var event: Event
        
        init(event: Event = Event(name: "", date: "", time: "", duration: "", location: "", guests: [])) {
            self.event = event
        }
        
        func addOrUpdateEvent() {
            // Logic to add or update event
            // For example, save to a database or update an existing record
        }
}
