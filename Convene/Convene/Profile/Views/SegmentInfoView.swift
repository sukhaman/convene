//
//  SegmentInfoView.swift
//  Convene
//
//  Created by Sukhaman Singh on 7/5/24.
//

import SwiftUI

struct SegmentInfoView: View {
    let segments = ["About Me","Interests", "Events"]
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

#Preview {
    SegmentInfoView(selectedSegment: .constant(0))
}
