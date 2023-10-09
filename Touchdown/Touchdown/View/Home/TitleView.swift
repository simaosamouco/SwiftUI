//
//  TitleView.swift
//  Touchdown
//
//  Created by Simão Neves Samouco on 09/10/2023.
//

import SwiftUI

struct TitleView: View {
    var title: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.largeTitle)
                .fontWeight(.heavy)
            
            Spacer()
        }//: HSTACK
        .padding(.horizontal)
        .padding(.top, 15)
        .padding(.bottom, 10)
    }
}

#Preview {
    TitleView(title: "HELMET")
        .previewLayout(.sizeThatFits)
        .background(colorBackground)
}
