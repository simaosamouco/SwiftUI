//
//  ReelView.swift
//  Slot Machine
//
//  Created by Simão Neves Samouco on 30/10/2023.
//

import SwiftUI

struct ReelView: View {
    var body: some View {
        Image("gfx-reel")
            .resizable()
            .modifier(ImageModifier())
    }
}

#Preview {
    ReelView()
        .previewLayout(.fixed(width: 220, height: 220))
}
