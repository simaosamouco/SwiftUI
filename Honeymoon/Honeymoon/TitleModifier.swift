//
//  TitleModifier.swift
//  Honeymoon
//
//  Created by Simão Neves Samouco on 06/11/2023.
//

import SwiftUI

struct TitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(Color.pink)
    }
}


