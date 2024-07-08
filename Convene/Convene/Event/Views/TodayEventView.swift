//
//  TodayEventView.swift
//  Convene
//
//  Created by Sukhaman Singh on 7/6/24.
//

import SwiftUI


struct TodayEventView: View {
    @StateObject private var viewModel = EventViewModel()
    @State var isShowProfileScreen = false
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Text("You have \(viewModel.events.count) events today")
                        .font(.headline)
                        .padding()

                    Spacer()

                    Image(systemName: "bell.fill")
                        .foregroundColor(.red)
                        .padding()
                }
                
                ScrollView {
                    VStack(spacing: 0) {
                        ForEach(viewModel.events) { event in
                            EventRow(event: event, viewModel: viewModel, action: {
                                isShowProfileScreen.toggle()
                            })
                                .frame(maxWidth: .infinity, maxHeight: .infinity) // Full width and height
                        }
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity) // Full width and height
            }
            .navigationBarTitle("Events")
            .navigationDestination(isPresented: $isShowProfileScreen) {
                       ProfileView()
                        }
        }
    }

    func delete(at offsets: IndexSet) {
        // viewModel.events.remove(atOffsets: offsets)
    }
}

struct EventRow: View {
    var event: Event
    @ObservedObject var viewModel: EventViewModel
    @State private var selectedSegment = 0
    var action: () -> Void
    var body: some View {
                GeometryReader { reader in
                    VStack {
                        if let url = event.url {
                            Image(url)
                                .resizable()
                                .frame(width: reader.size.width, height: 250)
                                .clipped()
                        }
                        
                        VStack(alignment: .leading) {
                            
                            
                            HStack(spacing:10) {
                                Text(event.name)
                                    .font(.headline)
                                Spacer()
                                Image(systemName: "clock")
                                
                                Text(event.time)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                
                                
                               
                            }
                            
                            HStack {
                                // Replace "profile_image" with the actual profile image
                                ButtonWithImage(image: Image(event.createdBy.image), foregroundColor: .mint, backgrounColor: .white, action: action)
                                .frame(width: 20, height: 20)
                                .clipShape(Circle())
                                
                                VStack(alignment: .leading) {
                                    Text(viewModel.event.createdBy.name)
                                        .font(.headline)
                                }
                            }
                            
                            SegmentInfoView(segments: ["Overview", "Participant", "Equipment", "Schedule"], selectedSegment: $selectedSegment)
                            
                            if selectedSegment == 0 {
                                   EventDescriptionView(event: event)
                            } else if selectedSegment == 1 {
                                EventParticipantView(event: event)
                            } else if selectedSegment == 2 {
                                EquipmentListView(event: event)
                            } else if selectedSegment == 3 {
                                EventScheduleView()
                            }
                        }
                        .padding()
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 4))
                        .frame(width: reader.size.width)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity) // Full width and height
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
        } // Full width and height
}





#Preview {
    TodayEventView()
}
