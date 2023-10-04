//
//  ContentView.swift
//  Africa
//
//  Created by Simão Neves Samouco on 03/10/2023.
//

import SwiftUI

struct ContentView: View {
    //MARK: - PROPERTIES
    let animals: [Animal] = Bundle.main.decode("animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    
    @State private var isGridViewActive: Bool = false
    
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Int = 1
    @State private var toolbarIcon: String = "square.grid.2x2"
    
    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
        gridColumn = gridLayout.count
        print("Grid Number: \(gridColumn)")
        
        //TOOL BAR IMAGE
        switch gridColumn {
        case 1:
            toolbarIcon = "square.grid.2x2"
        case 2:
            toolbarIcon = "square.grid.3x2"
        case 3:
            toolbarIcon = "rectangle.grid.1x2"
        default:
            toolbarIcon = "square.grid.2x2"
        }
    }
    
    
    //MARK: - BODY
    var body: some View {
        NavigationView {
            
            Group {
                if !isGridViewActive {
                    List {
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        
                        ForEach(animals) { animal in
                            NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                AnimalListItemView(animal: animal)
                                    .listRowBackground(Color.clear)
                            } //: LINK
                        }//: LOOP
                        
                        Credits()
                            .modifier(CenterModifier())
                        
                        
                    }//: list
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                            ForEach(animals) { item in
                                NavigationLink(destination: AnimalDetailView(animal: item)) {
                                    AnimalGridItemView(animal: item)
                                } //: LINK
                                
                            }//: LOOP
                        }//: GRID
                        .padding(10)
                        .animation(.easeIn)
                    }//: SCROLL
                }//: CONDITION
            }//: GROUP
            .listStyle(PlainListStyle())
            .navigationBarTitle("Africa", displayMode: .large)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    HStack(spacing: 16) {
                        //LIST
                        Button {
                            print("List view is activated")
                            isGridViewActive = false
                            haptics.impactOccurred()
                        } label: {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .primary : .accentColor)
                        }
                        
                        //GRID
                        Button {
                            print("Grid view is activated")
                            isGridViewActive = true
                            haptics.impactOccurred()
                            gridSwitch()
                        } label: {
                            Image(systemName: toolbarIcon)
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .accentColor : .primary)
                        }
                    }
                }
            }
        } //: Navigation
    }
}

#Preview {
    ContentView()
}
