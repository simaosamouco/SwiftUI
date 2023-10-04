//
//  ExternalWebLinkView.swift
//  Africa
//
//  Created by Simão Neves Samouco on 03/10/2023.
//

import SwiftUI

struct ExternalWebLinkView: View {
    let animal: Animal
    
    var body: some View {
        GroupBox {
            HStack {
                Image(systemName: "globe")
                Text("Wikipedia")
                Spacer()
                
                Group {
                    Image(systemName: "arrow.up.right.square")
                    
                    Link(animal.name, destination: URL(string: animal.link) ?? URL(string: "https://wikipedia.org")!)
                }
                .foregroundColor(.accentColor)
            }//: HSTACK
        }//: Box
    }
}

#Preview {
    ExternalWebLinkView(animal: animals[2])
        .previewLayout(.sizeThatFits)
        .padding()
}
