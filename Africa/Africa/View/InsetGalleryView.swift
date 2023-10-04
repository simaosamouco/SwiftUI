//
//  InsetGalleryvIEW.swift
//  Africa
//
//  Created by Simão Neves Samouco on 03/10/2023.
//

import SwiftUI

struct InsetGalleryView: View {
    let animal: Animal
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 15) {
                ForEach(animal.gallery, id: \.self) { item in
                    Image(item)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                    .cornerRadius(12)
                }
            }//: hstack
        }//: SCROLL
    }
}

#Preview {
    InsetGalleryView(animal: animals[4])
        .previewLayout(.sizeThatFits)
        .padding()
}
