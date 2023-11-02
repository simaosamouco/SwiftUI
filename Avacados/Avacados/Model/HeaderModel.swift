//
//  HeaderModel.swift
//  Avacados
//
//  Created by Simão Neves Samouco on 02/11/2023.
//

import SwiftUI
// MARK: - HEADER MODEL

struct Header: Identifiable {
    var id = UUID()
    var image: String
    var headline: String
    var subheadline: String
}
