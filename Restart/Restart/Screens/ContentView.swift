//
//  ContentView.swift
//  Restart
//
//  Created by Simão Neves Samouco on 15/09/2023.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("onboarding") var isOnBoardingActive: Bool = true
    
    var body: some View {
        ZStack {
            if isOnBoardingActive {
                OnboardingView()
            } else {
                HomeView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
