//
//  CoverImageView.swift
//  Africa
//
//  Created by Simão Neves Samouco on 03/10/2023.
//

import SwiftUI

struct CoverImageView: View {
    // MARK: - PROPERTIES
    let coverImages: [CoverImage] = Bundle.main.decode("covers.json")
    
    // MARK: - BODY
    var body: some View {
        TabView {
            ForEach(coverImages) { item in
                Image(item.name)
                    .resizable()
                    .scaledToFill()
            }
        }//: TAB
        .tabViewStyle(PageTabViewStyle())
        
    }
}

// MARK: - PREVIEW
#Preview {
    CoverImageView()
        .previewLayout(.fixed(width: 400, height: 300))
}
