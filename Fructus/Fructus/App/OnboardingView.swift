//
//  OnboardingView.swift
//  Fructus
//
//  Created by Simão Neves Samouco on 30/09/2023.
//

import SwiftUI

struct OnboardingView: View {
    // MARK: - PROPERTIES
    var fruits: [Fruit] = fruitsData
    
    // MARK: - BODY
    var body: some View {
        TabView {
            ForEach(0..<5) { item in
                FruitCardView(fruit: fruits[item])
                
            } //: LOOP
            
        } //: tab
        .tabViewStyle(PageTabViewStyle())
        .padding(20)
        
    }
}

// MARK: - PREVIEW
#Preview {
    OnboardingView(fruits: fruitsData)
}
