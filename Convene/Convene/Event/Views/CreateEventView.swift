//
//  CreateEventView.swift
//  Convene
//
//  Created by Sukhaman Singh on 7/5/24.
//

import SwiftUI

struct CreateEventView: View {
    @ObservedObject var viewModel: EventViewModel
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Text("Create Event")
                        .font(.title)
                    ButtonWithImage(image: Image(systemName: "xmark.circle"), foregroundColor: .white, backgrounColor: .black) {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
        }
    }
}

struct DurationPicker: View {
    @Binding var duration: TimeInterval
    
    var body: some View {
        HStack {
            Text("Duration")
            Spacer()
            Picker("Duration", selection: $duration) {
                Text("1h").tag(TimeInterval(3600))
                Text("2h").tag(TimeInterval(7200))
                Text("3h").tag(TimeInterval(10800))
                Text("4h").tag(TimeInterval(14400))
            }
            .pickerStyle(MenuPickerStyle())
        }
    }
}


#Preview {
    CreateEventView(viewModel: EventViewModel())
}
