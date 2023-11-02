//
//  AvocadoView.swift
//  Avacados
//
//  Created by Simão Neves Samouco on 02/11/2023.
//

import SwiftUI

struct AvocadoView: View {
    @State private var pulsateAnimation: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            Image("avocado")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 240, height: 240, alignment: .center)
                .shadow(color: Color.colorBlackTransparentDark, radius: 12, x: 0, y: 8)
                .scaleEffect(self.pulsateAnimation ? 1 : 0.9)
                .opacity(self.pulsateAnimation ? 1 : 0.9)
                .animation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true))
            VStack {
                Text("Avocados".uppercased())
                    .font(.system(size: 42, weight: .bold, design: .serif))
                    .foregroundColor(Color.white)
                    .padding()
                    .shadow(color: Color.colorBlackTransparentDark, radius: 4, x: 0, y: 4)
                Text("""
                     Creamy, green, and full of nutrients! Avocado is a powerhouse ingredient at any meal. Enjoy these handpicked avocado recipes for breakfast, lunch, dinner & more!
                    """)
                .lineLimit(nil)
                .font(.system(.headline, design: .serif))
                .foregroundColor(Color.colorGreenLight)
                .multilineTextAlignment(.center)
                .lineSpacing(8)
                .frame(maxWidth:640, minHeight: 120)
            }
            .padding()
            
            Spacer()
        }//: VSTACK
        .background(
            Image("background")
                .resizable()
                .aspectRatio(contentMode: .fill)
        )
        .edgesIgnoringSafeArea(.all)
        .onAppear(perform: {
            self.pulsateAnimation.toggle()
        })
    }
}

#Preview {
    AvocadoView()
        .previewDevice("iPhone 11 Pro")
        .environment(\.colorScheme, .dark)
}
