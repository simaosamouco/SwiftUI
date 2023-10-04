//
//  CenterModifier.swift
//  Africa
//
//  Created by Simão Neves Samouco on 04/10/2023.
//

import SwiftUI

struct CenterModifier: ViewModifier {
    func body(content: Content) -> some View {
        HStack {
            Spacer()
            content
            Spacer()
        }
    }
}
