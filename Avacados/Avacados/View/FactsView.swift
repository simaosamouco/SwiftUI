//
//  FactsView.swift
//  Avacados
//
//  Created by Simão Neves Samouco on 02/11/2023.
//

import SwiftUI

struct FactsView: View {
    var fact: Fact
    
    var body: some View {
        
        ZStack {
            Text(fact.content)
                .padding(.leading, 55)
                .padding(.trailing, 10)
                .padding(.vertical, 3)
                .frame(width: 300, height: 135, alignment: .center)
                .background(
                    LinearGradient(gradient: Gradient(colors: [Color.colorGreenMedium, Color.colorGreenLight]), startPoint: .leading, endPoint: .trailing))
                .cornerRadius(12)
                .lineLimit(6)
                .multilineTextAlignment(.leading)
                .font(.footnote)
                .foregroundColor(Color.white)
            Image(fact.image)
                .resizable()
                .frame(width: 66, height: 66, alignment: .center)
                .clipShape(Circle())
                .background(
                    Circle()
                        .fill(Color.white)
                        .frame(width: 74, height: 74, alignment: .center)
                    
                )
                .background(
                    Circle()
                        .fill(LinearGradient(gradient: Gradient(colors: [Color.colorGreenMedium, Color.colorGreenLight]), startPoint: .trailing, endPoint: .leading))
                        .frame(width: 82, height: 82, alignment: .center)
                    
                )
                .background(
                    Circle()
                        .fill(Color.colorAppearanceAdaptive)
                        .frame(width: 90, height: 90, alignment: .center)
                )
                .offset(x: -150)
        }
    }
}

#Preview {
    FactsView(fact: factsData.first!)
        .previewLayout(.fixed(width: 400, height: 220))
}
