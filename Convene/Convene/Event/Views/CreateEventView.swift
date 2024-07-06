//
//  CreateEventView.swift
//  Convene
//
//  Created by Sukhaman Singh on 7/5/24.
//

import SwiftUI

struct CreateEventView: View {
    @ObservedObject var viewModel: EventViewModel
    @State private var selectedDate = Date.now
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    HStack {
                        Text("Create Event")
                            .font(.title)
                        Spacer()
                        ButtonWithImage(image: Image(systemName: "xmark.circle"), foregroundColor: .white, backgrounColor: .black) {
                            presentationMode.wrappedValue.dismiss()
                        }
                    }
                    .padding()
                    
                    VStack {
                    HStack {
                        Text("Event Name")
                            .font(.subheadline)
                            .fontWeight(.light)
                        Spacer()
                    }
                        TextFieldWithButton(viewModel: viewModel,name: "Enter event name",buttonTitle: "Add description")
                                
                }
                    .padding(20)
                    VStack(spacing: 20) {
                        HStack {
                            Text("Date")
                                .font(.subheadline)
                                .fontWeight(.light)
                            Spacer()
                        }
                        HStack {
                            CenteredDatePicker(component: .constant(.date))
                            
                            Image(systemName: "calendar.circle")
                                .resizable()
                                .frame(width: 25,height: 25)
                                .padding()
                                .foregroundStyle(.white)
                            Spacer()
                        }
                        .frame(maxHeight: 50)
                        .background(.secondary)
                        .clipShape(RoundedRectangle(cornerRadius: 4))
                        .overlay(
                            RoundedRectangle(cornerRadius: 4)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                        HStack {
                            Text("Time")
                                .font(.subheadline)
                                .fontWeight(.light)
                            Spacer()
                        }
                        HStack {
                            CenteredDatePicker(component: .constant(.hourAndMinute))
                            Image(systemName: "clock")
                                .resizable()
                                .frame(width: 25,height: 25)
                                .padding()
                                .foregroundStyle(.white)
                            Spacer()
                        }
                        .frame(maxHeight: 50)
                        .background(.secondary)
                        .clipShape(RoundedRectangle(cornerRadius: 4))
                        .overlay(
                            RoundedRectangle(cornerRadius: 4)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                        HStack {
                            Text("Duration")
                                .font(.subheadline)
                                .fontWeight(.light)
                            Spacer()
                        }
                        HStack {
                            DurationPicker(viewModel: EventViewModel())
                            Image(systemName: "arrow.up.arrow.down.circle")
                                .resizable()
                                .frame(width: 25,height: 25)
                                .padding()
                                .foregroundStyle(.white)
                            Spacer()
                        }
                        .frame(maxHeight: 50)
                        .background(.secondary)
                        .clipShape(RoundedRectangle(cornerRadius: 4))
                        .overlay(
                            RoundedRectangle(cornerRadius: 4)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                        
                        HStack {
                            Text("Location")
                                .font(.subheadline)
                                .fontWeight(.light)
                            Spacer()
                        }
                        TextFieldWithButton(viewModel: viewModel,name: "Enter Address",buttonTitle: "Set meeting location")
                            .padding(.bottom,30)
                        HStack {
                            Text("Add guests")
                                .font(.subheadline)
                                .fontWeight(.light)
                            Spacer()
                        }
                        TextFieldWithButton(viewModel: viewModel,name: "Enter email to inivte any guest",buttonTitle: "Add")
                        HStack {
                                    ForEach(viewModel.guests.indices, id: \.self) { index in
                                        EventGuestView(guest: viewModel.guests[index]) {
                                            viewModel.removeGuest(at: index)
                                        }
                                    }
                                    .padding(.top,40)
                            Spacer()
                                }
                        TextButton(title: "Create", foregroundColor: .purple) {
                            // MARK: Create
                        }
                        .frame(maxWidth: .infinity)
                        
                    }
                    
                    .padding(20)
                    Spacer()
                }
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct CenteredDatePicker: View {
    @State private var selectedDate = Date()
    @Binding var component: DatePickerComponents
    var body: some View {
        VStack {
            HStack {
                Spacer()
                DatePicker(
                    "",
                    selection: $selectedDate,
                    displayedComponents: component
                )
                .labelsHidden()
                .background(Color.clear)
                .foregroundStyle(.white)
                Spacer()
            }
        }
    }
}

struct DurationPicker: View {
    @ObservedObject var viewModel: EventViewModel
    @State var show = false
    var body: some View {
        
        VStack {
            if show {
            HStack {
                Spacer()
                
                    Picker(selection: $viewModel.hours, label: Text("Hours")) {
                        ForEach(0..<24) { hour in
                            Text("\(hour) h").tag(hour)
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .frame(width: 100)
                    Spacer()
                
                Picker(selection: $viewModel.minutes, label: Text("Minutes")) {
                    ForEach(0..<60) { minute in
                        Text("\(minute) m").tag(minute)
                    }
                }
                .pickerStyle(WheelPickerStyle())
                .frame(width: 100)
                Spacer()
            }
            .frame(height: 150)
            
            Text("This event will take place on the \(viewModel.date) from \(viewModel.time) unitl \(viewModel.duration)")
                .font(.headline)
                .padding()
            } else {
                Text("Select the duration of your event")
                    .font(.subheadline)
                    .fontWeight(.light)
                    .foregroundStyle(.white)
                    .padding(30)
            }
        }
        
    }
}


#Preview {
    CreateEventView(viewModel: EventViewModel())
}

struct TextFieldWithButton: View {
    @ObservedObject var viewModel: EventViewModel
    @State var name: String
    @State var buttonTitle: String
    var body: some View {
        GeometryReader { reader in
            HStack {
                ZStack {
                    TextField(text: $viewModel.event.name) {
                        //  Enter event name
                        Text(name)
                    }
                    .frame(minWidth: reader.size.width - 30, minHeight: 45)
                    .padding(.trailing, 20) // Add padding to make space for the button
                    .background(Color.secondary)
                    .clipShape(RoundedRectangle(cornerRadius: 4))
                    .overlay(
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                    
                    HStack {
                        Spacer()
                        Button(action: {
                            // Add description button action
                        }) {
                            // Add description
                            Text(buttonTitle)
                                .foregroundColor(.white)
                                .padding(.horizontal)
                                .frame(height: 40)
                                .background(Color.black)
                                .clipShape(RoundedRectangle(cornerRadius: 4))
                        }
                    }
                    .padding(.trailing, 8)
                }
            }
        }
    }
}
