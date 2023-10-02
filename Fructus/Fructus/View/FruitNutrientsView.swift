//
//  FruitNutrientsView.swift
//  Fructus
//
//  Created by Simão Neves Samouco on 02/10/2023.
//

import SwiftUI

struct FruitNutrientsView: View {
    // MARK: - PROPERTIES
    var fruit: Fruit
    let nutrients: [String] = ["Energy", "Sugar", "Fat", "Protein", "Vitamins", "Minerals"]
    
    // MARK: - BODY
    var body: some View {
        GroupBox() {
            DisclosureGroup("Nutitional value per 100g") {
                ForEach(0..<nutrients.count, id: \.self) { item in
                    
                    Divider().padding(.vertical, 2)
                    HStack {
                        Group {
                            Image(systemName: "info.circle")
                            Text(nutrients[item])
                        }
                        .foregroundColor(fruit.gradientColors[1])
                        .font(Font.system(.body).bold())
                        
                        Spacer(minLength: 25)
                        Text(fruit.nutrition[item])
                    }
                }
            }
            
            
        } //: BOX
        
    }
}

// MARK: - PREVIEW
#Preview {
    FruitNutrientsView(fruit: fruitsData[0])
        .previewLayout(.fixed(width: 375, height: 480))
        .padding(/*@START_MENU_TOKEN@*/EdgeInsets()/*@END_MENU_TOKEN@*/)
}
