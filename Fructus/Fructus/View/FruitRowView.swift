//
//  FruitRowView.swift
//  Fructus
//
//  Created by Simão Neves Samouco on 02/10/2023.
//

import SwiftUI

struct FruitRowView: View {
    // MARK: - PROPERTIES
    var fruit: Fruit
    
    // MARK: - BODY
    var body: some View {
        HStack {
            Image(fruit.image)
                .renderingMode(.original)
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80, alignment: .center)
                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.3), radius: 3, x: 2, y: 2)
                .background(LinearGradient(colors: fruit.gradientColors, startPoint: .top, endPoint: .bottom))
                .cornerRadius(8)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(fruit.title)
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text(fruit.headline)
                    .font(.caption)
                    .foregroundColor(Color.secondary)
            }
                
            
        } //: HSTACK
    }
}

// MARK: - PREVIEW
#Preview {
    FruitRowView(fruit: fruitsData[6])
        .previewLayout(.sizeThatFits)
        .padding(/*@START_MENU_TOKEN@*/EdgeInsets()/*@END_MENU_TOKEN@*/)
}
