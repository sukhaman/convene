//
//  EventScheduleView.swift
//  Convene
//
//  Created by Sukhaman Singh on 7/7/24.
//

import SwiftUI

struct EventScheduleView: View {
    @StateObject private var viewModel = EventViewModel()
    var body: some View {
        VStack(alignment:.leading,spacing:20) {
            HStack {
                Text("Schedule:")
                    .fontWeight(.bold)
                Text("\(viewModel.event.date) at \(viewModel.event.time)")
            }
            HStack {
                Text("Arrival Time:")
                    .fontWeight(.bold)
                Text("30 mins earlier to prep")
            }
            HStack {
                Text("Event duraiton:")
                    .fontWeight(.bold)
                Text("\(viewModel.event.duration)")
            }
        }
        .padding()
    }
}

#Preview {
    EventScheduleView()
}
