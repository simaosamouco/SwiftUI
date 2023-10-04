//
//  AnimalGridItemView.swift
//  Africa
//
//  Created by Simão Neves Samouco on 04/10/2023.
//

import SwiftUI

struct AnimalGridItemView: View {
    let animal: Animal
    
    var body: some View {
        Image(animal.image)
            .resizable()
            .scaledToFit()
            .cornerRadius(12)
    }
}

#Preview {
    AnimalGridItemView(animal: animals[0])
        .previewLayout(.sizeThatFits)
        .padding()
}
