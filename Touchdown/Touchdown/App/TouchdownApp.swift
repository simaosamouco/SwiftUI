//
//  TouchdownApp.swift
//  Touchdown
//
//  Created by Simão Neves Samouco on 06/10/2023.
//

import SwiftUI

@main
struct TouchdownApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(Shop())
        }
    }
}
