//
//  HideKeyboardExtension.swift
//  Devote
//
//  Created by Simão Neves Samouco on 25/10/2023.
//

import SwiftUI

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
