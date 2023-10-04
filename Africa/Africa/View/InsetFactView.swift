//
//  InsetFactView.swift
//  Africa
//
//  Created by Simão Neves Samouco on 03/10/2023.
//

import SwiftUI

struct InsetFactView: View {
    let animal: Animal
    var body: some View {
        GroupBox {
            TabView {
                ForEach(animal.fact, id: \.self) { item in
                    Text(item)
                }
            }//: TAB
            .tabViewStyle(PageTabViewStyle())
            .frame(minHeight: 148, idealHeight: 168, maxHeight: 180)
        }//: BOX
    }
}

#Preview {
    InsetFactView(animal: animals[5])
        .previewLayout(.sizeThatFits)
        .padding()
}
