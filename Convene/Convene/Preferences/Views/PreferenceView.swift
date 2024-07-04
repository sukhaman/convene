//
//  PreferenceView.swift
//  Convene
//
//  Created by Sukhaman Singh on 7/4/24.
//

import SwiftUI

struct Subcategory: Identifiable {
    let id = UUID()
    let name: String
    var isSelected: Bool
}

struct Category: Identifiable {
    let id = UUID()
    let name: String
    let icon: String
    var subcategories: [Subcategory]
}


struct PreferenceView: View {
    @State private var categories: [Category] = [
        Category(name: "Music Events", icon: "music.note", subcategories: [
            Subcategory(name: "Gig", isSelected: false),
            Subcategory(name: "Jam", isSelected: false),
            Subcategory(name: "Nightclub", isSelected: false),
            Subcategory(name: "Workshop", isSelected: false),
            Subcategory(name: "Orchestra", isSelected: false)
        ]),
        Category(name: "Food Places", icon: "fork.knife", subcategories: [
            Subcategory(name: "Café", isSelected: false),
            Subcategory(name: "Fancy Restaurant", isSelected: false),
            Subcategory(name: "Fastfood", isSelected: false),
            Subcategory(name: "National Cuisine", isSelected: false)
        ]),
        Category(name: "Visual Arts", icon: "paintbrush", subcategories: [
            Subcategory(name: "City Tours", isSelected: false),
            Subcategory(name: "Museum of Arts", isSelected: false)
        ])
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    Text("Setup Preferences")
                        .font(.largeTitle)
                        .bold()
                    
                    Text("Select what you like in event categories, so we can find a perfect match for you!")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                    ForEach($categories) { $category in
                        Section(header: HStack {
                            Image(systemName: category.icon)
                            Text(category.name)
                                .font(.headline)
                        }) {
                            ScrollView(.horizontal, showsIndicators: false) {
                                LazyHStack {
                                    ForEach($category.subcategories) { $subcategory in
                                        Toggle(isOn: $subcategory.isSelected) {
                                            Text(subcategory.name)
                                                .padding()
                                                .background(subcategory.isSelected ? Color.purple.opacity(1) : Color.white)
                                                .cornerRadius(8)
                                                .overlay(
                                                    RoundedRectangle(cornerRadius: 8)
                                                        .stroke(subcategory.isSelected ? Color.purple : Color.gray, lineWidth: 1)
                                                )
                                                .foregroundStyle(subcategory.isSelected ? Color.white : Color.black)
                                        }
                                        
                                        .toggleStyle(CheckboxToggleStyle())
                                        .padding(.horizontal, 4)
                                    }
                                }
                                .padding(.vertical, 10)
                            }
                        }
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                    }
                    TextButton(title: "Save", foregroundColor: .black, action: {
                        
                    })
                }
                .padding()
            }
            .navigationBarHidden(true)
        }
    }
}

struct CheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button(action: {
            configuration.isOn.toggle()
        }) {
            HStack {
                Image(systemName: configuration.isOn ? "checkmark.square.fill" : "square")
                    .foregroundColor(configuration.isOn ? .purple : .gray)
                configuration.label
            }
        }
    }
}

struct PreferenceView_Previews: PreviewProvider {
    static var previews: some View {
        PreferenceView()
    }
}

#Preview {
    PreferenceView()
}
