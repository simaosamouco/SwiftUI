//
//  HeaderView.swift
//  Honeymoon
//
//  Created by Simão Neves Samouco on 06/11/2023.
//

import SwiftUI

struct HeaderView: View {
    // MARK: - PROPERTOES
    
    @Binding var showGuideView: Bool
    @Binding var showInfoView: Bool
    
    var body: some View {
        HStack {
            Button(action: {
                showInfoView.toggle()
                
            }, label: {
                Image(systemName: "info.circle")
                    .font(.system(size: 24, weight: .regular))
                    .accentColor(Color.primary)
            })
            .sheet(isPresented: $showInfoView) {
                InfoView()
            }
            Spacer()
            Image("logo-honeymoon-pink")
                .resizable()
                .scaledToFit()
                .frame(height: 28)
            Spacer()
            
            Button(action: {
                print("Guide")
                showGuideView.toggle()
            }, label: {
                Image(systemName: "questionmark.circle")
                    .font(.system(size: 24, weight: .regular))
                    .accentColor(Color.primary)
            })
            .sheet(isPresented: $showGuideView) {
                GuideView()
            }
        }
        .padding()
    }
}

#Preview {
    HeaderView(showGuideView: .constant(false), showInfoView: .constant(false))
}
