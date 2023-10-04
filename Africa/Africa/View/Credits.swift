//
//  Credits.swift
//  Africa
//
//  Created by Simão Neves Samouco on 04/10/2023.
//

import SwiftUI

struct Credits: View {
    var body: some View {
        VStack {
            Image("compass")
                .resizable()
                .scaledToFit()
                .frame(width: 128, height: 128)
            
            Text("""
            Copyright
            All rights reserved

            """)
            .font(.footnote)
            .multilineTextAlignment(.center)
        }
        .padding()
        .opacity(0.4)
    }
}

#Preview {
    Credits()
        .previewLayout(.sizeThatFits)
        .padding()
}
