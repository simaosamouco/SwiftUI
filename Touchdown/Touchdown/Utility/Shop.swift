//
//  Shop.swift
//  Touchdown
//
//  Created by Simão Neves Samouco on 09/10/2023.
//

import Foundation
class Shop: ObservableObject {
    @Published var showingProduct: Bool = false
    @Published var selectedProduct: Product? = nil
}
