//
//  SegmentInfoView.swift
//  Convene
//
//  Created by Sukhaman Singh on 7/5/24.
//

import SwiftUI

struct SegmentInfoView: View {
    @State var segments = [String]()
    @Binding var selectedSegment: Int
    var body: some View {
        GeometryReader { geometry in
            HStack {
                ForEach(0..<segments.count, id: \.self) { index in
                    SegmentButton(selectedSegment: self.$selectedSegment, index: index, title: self.segments[index], width: geometry.size.width / CGFloat(self.segments.count))
                }
            }
            // Line under the selected segment
            HStack {
                Rectangle()
                    .fill(Color.purple)
                    .frame(width: geometry.size.width / CGFloat(self.segments.count), height: 2)
                    .offset(x: CGFloat(self.selectedSegment) * (geometry.size.width / CGFloat(self.segments.count)), y: 50)
                Spacer()
            }
            
            
        }
        .frame(height: 50)
    }
}

struct SegmentButton: View {
    @Binding var selectedSegment: Int
    let index: Int
    let title: String
    let width: CGFloat

    var body: some View {
        Button(action: {
            self.selectedSegment = self.index
        }) {
            Text(title)
                .frame(width: width, height: 40)
                .background(.white)
                .foregroundColor(Color.purple)
                .opacity(self.selectedSegment == self.index ? 1  : 0.5)
        
                
        }
    }
}

#Preview {
    SegmentInfoView(segments: ["About Me","Interests", "Events"], selectedSegment: .constant(0))
}
