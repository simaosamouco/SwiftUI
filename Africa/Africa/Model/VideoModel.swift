//
//  VideoModel.swift
//  Africa
//
//  Created by Simão Neves Samouco on 03/10/2023.
//

import SwiftUI

struct Video: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    
    //Computed property
    
    var thumbnail: String {
        "video-\(id)"
    }
}
