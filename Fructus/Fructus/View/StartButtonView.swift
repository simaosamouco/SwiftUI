//
//  StartButtonView.swift
//  Fructus
//
//  Created by Simão Neves Samouco on 30/09/2023.
//

import SwiftUI

struct StartButtonView: View {
    // MARK: - PROPERTIES
    
    @AppStorage("isOnboarding") var isOnboarding: Bool = true
    
    // MARK: - BODY
    var body: some View {
        Button {
            print("Exit the onboarding")
            isOnboarding = false
            
        } label: {
            HStack(spacing: 8) {
                Text("Start")
                Image(systemName: "arrow.right.circle")
                    .imageScale(.large)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .background(
                Capsule().strokeBorder(Color.white, lineWidth: 1.25)
            )
        } //: BUTTON
        .accentColor(Color.white)

    }
}
 
// MARK: - PREVIEW
#Preview {
    StartButtonView()
        .previewLayout(.sizeThatFits)
}
