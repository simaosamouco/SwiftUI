//
//  CategoryModel.swift
//  Touchdown
//
//  Created by Simão Neves Samouco on 09/10/2023.
//

import Foundation

struct Category: Codable, Identifiable {
    let id: Int
    let name: String
    let image: String
}
