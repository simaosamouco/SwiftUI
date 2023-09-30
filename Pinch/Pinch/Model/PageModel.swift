//
//  PageModel.swift
//  Pinch
//
//  Created by Simão Neves Samouco on 29/09/2023.
//

import Foundation

struct Page: Identifiable {
    let id: Int
    let imageName: String
}

extension Page {
    var thumbnailName: String {
        return "thumb-" + imageName
    }
}
