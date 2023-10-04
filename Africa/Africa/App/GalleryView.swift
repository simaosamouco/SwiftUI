//
//  GalleryView.swift
//  Africa
//
//  Created by Simão Neves Samouco on 03/10/2023.
//

import SwiftUI

struct GalleryView: View {
    
    @State private var selectedAnimal: String = "lion"
    
    let animals: [Animal] = Bundle.main.decode("animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    
    //SIMPLE GRID DEFINITION
//    let gridLayout: [GridItem] = [
//        GridItem(),
//        GridItem(),
//        GridItem()
//    ]
    
    // EFFICIENT GRID DEFINITION
    //let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
    
    //DYNAMIC GRID LAYOUR
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Double = 3.0
    
    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumn))
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            
            
            VStack(alignment: .center, spacing: 30) {
                // MARK: - image
                Image(selectedAnimal)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 8))
                
                // MARK: - SLIDER
                Slider(value: $gridColumn, in: 2...4, step: 1)
                    .padding(.horizontal)
                    .onChange(of: gridColumn) { oldValue, newValue in
                        gridSwitch()
                    }
                
                // MARK: - GRID
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                    ForEach(animals) { item in
                        Image(item.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 1))
                            .onTapGesture {
                                selectedAnimal = item.image
                                haptics.impactOccurred()
                            }
                    }
                }//: GRID
                .animation(.easeIn)
                .onAppear(perform: {
                    gridSwitch()
                })
            }//:VSTACK
            .padding(.horizontal, 10)
            .padding(.vertical, 50)
        }//: SCROLL
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(MotionAnimationView())
    }
}

#Preview {
    GalleryView()
}
