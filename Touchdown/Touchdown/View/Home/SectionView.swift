//
//  SectionView.swift
//  Touchdown
//
//  Created by Simão Neves Samouco on 09/10/2023.
//

import SwiftUI

struct SectionView: View {
    @State var rotateCloskwise: Bool
    
    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            Text("Categories".uppercased())
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .rotationEffect(Angle(degrees: rotateCloskwise ? 90 : -90))
            Spacer()
            
        }
        .background(colorGray.cornerRadius(12))
        .frame(width: 85)
    }
}

#Preview {
    SectionView(rotateCloskwise: false)
        .previewLayout(.fixed(width: 120, height: 120))
        .padding()
        .background(colorBackground)
}
