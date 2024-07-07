//
//  TodayEventView.swift
//  Convene
//
//  Created by Sukhaman Singh on 7/6/24.
//

import SwiftUI


struct TodayEventView: View {
    @StateObject private var viewModel = EventViewModel()
    
    var body: some View {
        NavigationView {
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
                            EventRow(event: event, viewModel: viewModel)
                                .frame(maxWidth: .infinity, maxHeight: .infinity) // Full width and height
                        }
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity) // Full width and height
            }
            .navigationBarTitle("Events")
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
                        ButtonWithImage(image: Image(event.createdBy.image), foregroundColor: .mint, backgrounColor: .white, action: {
                            print("Show profile screen")
                        })
                        .frame(width: 20, height: 20)
                        .clipShape(Circle())
                        
                        VStack(alignment: .leading) {
                            Text(viewModel.event.createdBy.name)
                                .font(.headline)
                        }
                    }
                    
                    SegmentInfoView(segments: ["Overview", "Participant", "Equipment", "Schedule"], selectedSegment: $selectedSegment)
                }
                .padding()
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 4))
                .frame(width: reader.size.width)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity) // Full width and height
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity) // Full width and height
    }
}





#Preview {
    TodayEventView()
}
