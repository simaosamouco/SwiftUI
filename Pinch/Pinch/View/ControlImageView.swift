//
//  ControlImageView.swift
//  Pinch
//
//  Created by Simão Neves Samouco on 28/09/2023.
//

import SwiftUI

struct ControlImageView: View {
    let icon: String
    
    var body: some View {
        Image(systemName: icon)
    }
}

struct ControlImageView_Previews: PreviewProvider {
    static var previews: some View {
        ControlImageView(icon: "minus.magnifyingglass")
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
