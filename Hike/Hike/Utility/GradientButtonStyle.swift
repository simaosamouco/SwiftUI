//
//  GradientButtonStyle.swift
//  Hike
//
//  Created by Simão Neves Samouco on 12/09/2023.
//

import Foundation
import SwiftUI

struct GradientButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .padding(.vertical)
            .padding(.horizontal, 30)
            .background(
                
                //Conditional Statement with Nil Coalescing
                // Condition ? A : B
                configuration.isPressed ?
                // A: When pressed
                LinearGradient(
                    colors:
                            [.customGrayMedium, .customGrayLight],
                            startPoint: .top,
                            endPoint: .bottom)
                // B: When not pressed
                :
                LinearGradient(
                    colors:
                            [.customGrayLight, .customGrayMedium],
                            startPoint: .top,
                            endPoint: .bottom)
            )
            .cornerRadius(40)
    }
}
